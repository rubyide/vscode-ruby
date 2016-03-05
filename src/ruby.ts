/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

'use strict';

import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import {EventEmitter} from 'events';
import {DOMParser} from 'xmldom';
import {LaunchRequestArguments, IRubyEvaluationResult, IDebugVariable, ICommand} from './interface';
import {SocketClientState} from './common';

export class RubyProcess extends EventEmitter {
	private debugSocketClient : net.Socket = null;
	private buffer: string;
	private parser: DOMParser;
	private debugprocess: childProcess.ChildProcess;
	private launchArgs: LaunchRequestArguments;
	private pendingCommands: ICommand[];
	private _state: SocketClientState;

	get state(): SocketClientState {
		return this._state;
	}

	set state(newState: SocketClientState) {
		this._state = newState;
	}

	public constructor(args: LaunchRequestArguments) {
		super();
		this.launchArgs = args;
		this.pendingCommands = [];
		this.state = SocketClientState.ready;

		var that = this;
		var runtimeArgs = ['--evaluation-timeout', '10'];
		var runtimeExecutable: string;

		if (process.platform === 'win32') {
			runtimeExecutable = 'rdebug-ide.bat';
		}
		else if (process.platform === 'darwin') {
			runtimeExecutable = 'rdebug-ide';
		}
		else {
			// platform: linux
			runtimeExecutable = 'rdebug-ide';
		}

		var programArgs = [];
		var processCwd = dirname(this.launchArgs.program);

		this.debugprocess = childProcess.spawn(runtimeExecutable, [...runtimeArgs, args.program, '-xd'], {cwd: processCwd});
		// redirect output to debug console
		this.debugprocess.stdout.on('data', (data: Buffer) => {
			that.emit('exeutableOutput', data);
		});
		this.debugprocess.stderr.on('data', (data: Buffer) => {
			if (/^Fast Debugger/.test(data.toString())) {
				that.debugSocketClient.connect(1234);
			}
			that.emit('debuggerOutput', data)
		});
		this.debugprocess.on('exit', () => {
			that.emit('debuggerProcessExit');
		});
		this.debugprocess.on('error', (error: Error) => {
			that.emit('debuggerProcessError', error);
		});

		this.buffer = '';
		this.parser = new DOMParser();

		this.debugSocketClient = new net.Socket( {
			type: 'tcp4'
		});

		this.debugSocketClient.on('connect', (buffer: Buffer) => {
			that.state = SocketClientState.connected;
			that.emit('debuggerConnect');
		});
		this.debugSocketClient.on('end', (ex) => {
		});

		this.debugSocketClient.on('close', d=> {
			that.state = SocketClientState.closed;
			that.emit('debuggerClientClose');
		});

		this.debugSocketClient.on('error', d=> {
			var msg = 'Debugger client error, ' + d;
			that.emit('debuggerClientError', msg);
		});

		this.debugSocketClient.on('timeout', d=> {
			var msg = 'Debugger client timedout, ' + d;
			that.emit('debuggerClientTimeout', msg);
		});

		this.debugSocketClient.on('data', (buffer: Buffer) => {
			var chunk = buffer.toString();
			var threadId: any;
 			var document: XMLDocument;

			if (/^<breakpoint .*?\/>$/.test(chunk)) {
				document = that.parser.parseFromString(chunk, 'application/xml');
  				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit('breakpointHit', +threadId.value);
				return;
			}

			if (/^<suspended .*?\/>$/.test(chunk)) {
				document = that.parser.parseFromString(chunk, 'application/xml');
 				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit('suspended', +threadId.value);
				return;
			}

			if(/^<exception .*?\/>$/.test(chunk)) {
 				document = that.parser.parseFromString(chunk, 'application/xml');
 				var exceptionType = document.documentElement.attributes.getNamedItem('type');
 				var exceptionMessage = document.documentElement.attributes.getNamedItem('message');
 				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit('exception', +threadId.value, exceptionType.value + ': ' + exceptionMessage.value);
 				return;
			}

			if(/^<breakpointAdded .*\/>$/.test(chunk)) {
 				let re = /<breakpointAdded\s+no="(\d+)"\s+location="(.*?)"\s*?\/>/g;
				chunk.match(re).forEach(m => {
					document = that.parser.parseFromString(m, 'application/xml');
					that.FinishCmd(document);
				});
				return;
			}

			if(/^<breakpointDeleted .*\/>$/.test(chunk)) {
				let re = /<breakpointDeleted\s+no="(\d+)"\s*\/>/g;
				chunk.match(re).forEach(m => {
					document = that.parser.parseFromString(m, 'application/xml');
					that.FinishCmd(document);
				});
				return;
			}

			if(/^<eval .*?\/>$/.test(chunk)) {
				var re = /^<eval\s+expression="(.*)"\s+value="(.*)"\s*\/>/;
				var match = re.exec(chunk);

				if (match) {
					that.FinishCmd(match[2]);
				}
				return;
			}

			if (
				(/^<frames>/.test(chunk) && !/<\/frames>$/.test(chunk)) ||
				(/^<frame .*?\/>$/.test(chunk) && this.buffer !== '') ||
				(/^<variables>/.test(chunk) && !/<\/variables>$/.test(chunk)) ||
				(/^<variable .*?\/>$/.test(chunk) && this.buffer !== '') ||
				(/^<breakpoints>/.test(chunk) && !/<\/breakpoints>$/.test(chunk)) ||
				(/^<breakpoint .*?\/>$/.test(chunk) && this.buffer !== '') ||
				(/^<threads>/.test(chunk) && !/\/threads>$/.test(chunk))
			) {
				that.buffer += chunk;
				return;
			} else if (
				(/^<variable .*?>$/.test(chunk) && !/<\/variables>$/.test(chunk)) ||
				/<\/variable>$/.test(chunk)
			) {
				that.buffer += chunk;
				return;
			}
			else if (
				(/^<thread .*?>$/.test(chunk) && !/<\/threads>$/.test(chunk)) ||
				/<\/thread>$/.test(chunk)
			) {
				that.buffer += chunk;
			}
			else if (
				/<\/frames>$/.test(chunk) ||
				/<\/variables>$/.test(chunk) ||
				/<\/breakpoints>$/.test(chunk) ||
				/<\/threads>$/.test(chunk)
			) {
				that.buffer = that.buffer + chunk;
				if (/<\/frames>$/.test(chunk)) {
					document = that.parser.parseFromString(that.buffer, 'application/xml');
					that.FinishCmd(document);
				}
				else if (/<\/variables>$/.test(chunk)) {
					document = that.parser.parseFromString(that.buffer, 'application/xml');
					that.FinishCmd(document);
				}
				else if (/<\/threads>$/.test(chunk)) {
					document = that.parser.parseFromString(that.buffer, 'application/xml');
					that.FinishCmd(document);
				}
				that.buffer = '';
			}
		});
	}

	public Run(cmd: string): void {
		this.debugSocketClient.write(cmd);
	}

	public Enqueue(cmd: string): Promise<any> {
		var that = this;
		var pro =  new Promise<any>((resolve, reject) => {
			var newCommand = {
				command: cmd,
				resolve: resolve,
				reject: reject
			};
			that.pendingCommands.push(newCommand);
			that.debugSocketClient.write(newCommand.command);
		});
		return pro;
	}

	private FinishCmd(result: any): void {
		if (this.pendingCommands.length > 0) {
			this.pendingCommands[0].resolve(result);
			this.pendingCommands.shift();
		}
	}
}
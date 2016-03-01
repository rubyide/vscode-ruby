/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

"use strict";

import {DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, BreakpointEvent, OutputEvent, Thread, StackFrame, Scope, Source, Handles, Breakpoint} from 'vscode-debugadapter';
import {DebugProtocol} from 'vscode-debugprotocol';
import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import {EventEmitter} from 'events';
import {DOMParser} from 'xmldom';
import {LaunchRequestArguments, IRubyEvaluationResult, IDebugVariable, ICommand} from './interface';

export class RubyProcess extends EventEmitter {
	private debugSocketServer : net.Socket = null;

	private buffer: string;
	private parser: DOMParser;
	private debugprocess: childProcess.ChildProcess;

	private launchArgs: LaunchRequestArguments;

	private pendingCommands: ICommand[];

	public constructor(args: LaunchRequestArguments) {
		super();
		this.launchArgs = args;
		this.pendingCommands = [];

		var that = this;
		var runtimeArgs = [];
		var runtimeExecutable = 'rdebug-ide';
		var programArgs = [];
		var processCwd = dirname(this.launchArgs.program);

		this.debugprocess = childProcess.spawn(runtimeExecutable, [args.program, "-xd"], {cwd: processCwd});
		// redirect output to debug console
		this.debugprocess.stdout.on('data', (data: Buffer) => {
			that.emit("exeutableOutput", data);
		});
		this.debugprocess.stderr.on('data', (data: Buffer) => {
			if (/^Fast Debugger/.test(data.toString())) {
				that.debugSocketServer.connect(1234);
			}
			that.emit("debuggerOutput", data)
		});
		this.debugprocess.on('exit', () => {
			that.emit("debuggerProcessExit");
		});
		this.debugprocess.on('error', (error: Error) => {
			that.emit("debuggerProcessError", error);
		});

		this.buffer = "";
		this.parser = new DOMParser();

		this.debugSocketServer = new net.Socket( {
			type: "tcp4"
		});
		this.debugSocketServer.on('connect', (buffer: Buffer) => {
			that.emit("debuggerConnect");
		});
		this.debugSocketServer.on('end', (ex) => {
			var msg = "Debugger client disconneced, " + ex;
			console.log(msg);
        });
        this.debugSocketServer.on("data", (buffer: Buffer) => {
			var chunk = buffer.toString();
			var threadId: any;
 			var document: XMLDocument;

			if (/^<breakpoint .*?\/>$/.test(chunk)) {
				document = that.parser.parseFromString(chunk, 'application/xml');
  				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit("breakpointHit", +threadId.value);
				return;
			}

			if (/^<suspended .*?\/>$/.test(chunk)) {
				document = that.parser.parseFromString(chunk, 'application/xml');
 				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit("suspended", +threadId.value);
				return;
			}

			if(/^<exception .*?\/>$/.test(chunk)) {
 				document = that.parser.parseFromString(chunk, 'application/xml');
 				var exceptionType = document.documentElement.attributes.getNamedItem("type");
 				var exceptionMessage = document.documentElement.attributes.getNamedItem("message");
 				threadId = document.documentElement.attributes.getNamedItem('threadId');
				that.emit("exception", +threadId.value, exceptionType.value + ": " + exceptionMessage.value);
 			}

			if (
				(/^<frames>/.test(chunk) && !/<\/frames>$/.test(chunk)) ||
				(/^<frame .*?\/>$/.test(chunk) && this.buffer !== "") ||
				(/^<variables>/.test(chunk) && !/<\/variables>$/.test(chunk)) ||
				(/^<variable .*?\/>$/.test(chunk) && this.buffer !== "") ||
				(/^<breakpoints>/.test(chunk) && !/<\/breakpoints>$/.test(chunk)) ||
				(/^<breakpoint .*?\/>$/.test(chunk) && this.buffer !== "") ||
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
				that.buffer = "";
			}
		});
        this.debugSocketServer.on("close", d=> {
			var msg = "Debugger client closed, " + d;
			that.emit("debuggerClientClose");
		});
		this.debugSocketServer.on("error", d=> {
			var msg = "Debugger client error, " + d;
			that.emit("debuggerClientError", msg);
		});
		this.debugSocketServer.on("timeout", d=> {
			var msg = "Debugger client timedout, " + d;
			that.emit("debuggerClientTimeout", msg);
		});
	}

	public Run(cmd: string): void {
		this.debugSocketServer.write(cmd);
	}

	public Enqueue(cmd: string): Promise<any> {
		return new Promise<any>((resolve, reject) => {
			var newCommand = {
				command: cmd,
				resolve: resolve,
				reject: reject
			};
			this.pendingCommands.push(newCommand);
			this.debugSocketServer.write(newCommand.command);
		});
	}

	private FinishCmd(xml: XMLDocument): void {
		if (this.pendingCommands.length > 0) {
			this.pendingCommands[0].resolve(xml);
			this.pendingCommands.shift();
		}
	}
}
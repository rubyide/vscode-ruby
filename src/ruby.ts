/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

"use strict";

import {DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, BreakpointEvent, OutputEvent, Thread, StackFrame, Scope, Source, Handles, Breakpoint} from 'vscode-debugadapter';
import {DebugProtocol} from 'vscode-debugprotocol';
import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import {DOMParser} from 'xmldom';
import {LaunchRequestArguments, IRubyEvaluationResult, IDebugVariable, ICommand} from './interface';

export class RubyProcess {
	private debugSocketServer : net.Socket = null;

	private buffer: string;
	private parser: DOMParser;
	private debugprocess: childProcess.ChildProcess;
	private debugSession: DebugSession;

	private launchArgs: LaunchRequestArguments;

	private pendingCommands: ICommand[];

	public constructor(debugSession: DebugSession, args: LaunchRequestArguments, response: DebugProtocol.LaunchResponse) {
		this.debugSession = debugSession;
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
			this.debugSession.sendEvent(new OutputEvent(data.toString() + '', 'stdout'));
		});
		this.debugprocess.stderr.on('data', (data: Buffer) => {
			if (/^Fast Debugger/.test(data.toString())) {
				this.debugSocketServer.connect(1234);
			}
			this.debugSession.sendEvent(new OutputEvent(data.toString() + '', 'stderr'));
		});
		this.debugprocess.on('exit', () => {
			this.debugSession.sendEvent(new TerminatedEvent());
		});
		this.debugprocess.on('error', (error: Error) => {
			this.debugSession.sendEvent(new OutputEvent(error.message, 'stderr'));
		});

		this.buffer = "";
		this.parser = new DOMParser();

		this.debugSocketServer = new net.Socket( {
			type: "tcp4"
		});
		this.debugSocketServer.on('connect', (buffer: Buffer) => {
			this.debugSession.sendEvent(new InitializedEvent());
			this.debugSession.sendResponse(response);
		});
		this.debugSocketServer.on('end', (ex) => {
			var msg = "Debugger client disconneced, " + ex;
			console.log(msg);
        });
        this.debugSocketServer.on("data", (buffer: Buffer) => {
			var chunk = buffer.toString();

			if (/^<breakpoint .*?\/>$/.test(chunk)) {
				this.debugSession.sendEvent(new StoppedEvent('breakpoint', 1));
				return;
			}

			if (/^<suspended .*?\/>$/.test(chunk)) {
				this.debugSession.sendEvent(new StoppedEvent("step", 1));
				return;
			}

			if (
				(/^<frames>/.test(chunk) && !/<\/frames>$/.test(chunk)) ||
				(/^<frame .*?\/>$/.test(chunk) && this.buffer !== "") ||
				(/^<variables>/.test(chunk) && !/<\/variables>$/.test(chunk)) ||
				(/^<variable .*?\/>$/.test(chunk) && this.buffer !== "") ||
				(/^<breakpoints>/.test(chunk) && !/<\/breakpoints>$/.test(chunk)) ||
				(/^<breakpoint .*?\/>$/.test(chunk) && this.buffer !== "")
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
				/<\/frames>$/.test(chunk) ||
				/<\/variables>$/.test(chunk) ||
				/<\/breakpoints>$/.test(chunk)
			) {
				that.buffer = that.buffer + chunk;
				if (/<\/frames>$/.test(chunk)) {
					var document = that.parser.parseFromString(that.buffer, 'application/xml');
					that.FinishCmd(document);
				}
				else if (/<\/variables>$/.test(chunk)) {
					console.log("variables\n");
					console.log(that.buffer);
					var document = that.parser.parseFromString(that.buffer, 'application/xml');
					that.FinishCmd(document);
				}
				that.buffer = "";
			}
		});
        this.debugSocketServer.on("close", d=> {
			var msg = "Debugger client closed, " + d;
			this.debugSession.sendEvent(new OutputEvent(msg));
			this.debugSession.sendEvent(new TerminatedEvent());
		});
		this.debugSocketServer.on("error", d=> {
			var msg = "Debugger client error, " + d;
			this.debugSession.sendEvent(new OutputEvent(msg));
		});
		this.debugSocketServer.on("timeout", d=> {
			var msg = "Debugger client timedout, " + d;
			this.debugSession.sendEvent(new OutputEvent(msg + "\n", "stderr"));
			console.log(msg);
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
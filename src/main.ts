/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

'use strict';

import {DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, BreakpointEvent, OutputEvent, Thread, StackFrame, Scope, Source, Handles, Breakpoint} from 'vscode-debugadapter';
import {DebugProtocol} from 'vscode-debugprotocol';
import {readFileSync} from 'fs';
import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import {DOMParser} from 'xmldom';
import {Terminal} from './terminal';
import {RubyProcess} from './ruby';
import {LaunchRequestArguments, IRubyEvaluationResult, IDebugVariable} from './interface';
import {SocketClientState} from './common';

class RubyDebugSession extends DebugSession {

	// we don't support multiple threads, so we can use a hardcoded ID for the default thread
	private static THREAD_ID = 2;

	private _breakpointId = 1000;

	// maps from sourceFile to array of Breakpoints
	private _breakPoints = new Map<string, DebugProtocol.Breakpoint[]>();

	private _variableHandles: Handles<IDebugVariable>;

	private rubyProcess: RubyProcess;

	/**
	 * Creates a new debug adapter.
	 * We configure the default implementation of a debug adapter here
	 * by specifying that this 'debugger' uses zero-based lines and columns.
	 */
	public constructor() {
		super();

		this.setDebuggerLinesStartAt1(true);
		this.setDebuggerColumnsStartAt1(false);

		this._variableHandles = new Handles<IDebugVariable>();
	}

	/**
	 * The 'initialize' request is the first request called by the frontend
	 * to interrogate the features the debug adapter provides.
	 */
	protected initializeRequest(response: DebugProtocol.InitializeResponse, args: DebugProtocol.InitializeRequestArguments): void {
		// This debug adapter implements the configurationDoneRequest.
		response.body.supportsConfigurationDoneRequest = true;

		this.sendResponse(response);
	}

	protected launchRequest(response: DebugProtocol.LaunchResponse, args: LaunchRequestArguments): void {
		var that = this;
		this.rubyProcess = new RubyProcess(args);

		this.rubyProcess.on('debuggerConnect', () => {
			that.sendEvent(new InitializedEvent());
			that.sendResponse(response);
		}).on('exeutableOutput', (data: Buffer) => {
			that.sendEvent(new OutputEvent(data.toString() + '', 'stdout'));
		}).on('debuggerProcessError', (error: Error) => {
			that.sendEvent(new OutputEvent(error.message, 'stderr'));
		}).on('breakpointHit', (threadId: number) => {
			that.sendEvent(new StoppedEvent('breakpoint', threadId));
		}).on('suspended', (threadId: number) => {
			that.sendEvent(new StoppedEvent('step', +threadId));
		}).on('exception', (threadId: number, exceptionMsg: string) => {
			that.sendEvent(new StoppedEvent('exception', threadId, exceptionMsg));
		}).on('debuggerClientClose', () => {
			that.sendEvent(new TerminatedEvent());
		}).on('debuggerClientError', (msg: string) => {
			that.sendEvent(new OutputEvent(msg));
			that.sendEvent(new TerminatedEvent());
		}).on('debuggerClientTimeout', (msg: string) => {
			that.sendEvent(new OutputEvent(msg + '\n', 'stderr'));
			that.sendEvent(new TerminatedEvent());
		});

		if (args.showDebuggerOutput) {
			this.rubyProcess.on('debuggerOutput', (data: Buffer) => {
				that.sendEvent(new OutputEvent(data.toString() + '', 'stderr'));
			});
		}

		if (args.stopOnEntry) {
			this.sendResponse(response);

			// we stop on the first line
			this.sendEvent(new StoppedEvent('entry', RubyDebugSession.THREAD_ID));
		}
	}

	// Executed after all breakpints have been set by VS Code
	protected configurationDoneRequest(response: DebugProtocol.ConfigurationDoneRequest, args:
	DebugProtocol.ConfigurationDoneArguments): void {
		var command = ['start'];
		this.rubyProcess.Run(command.join(' ') + '\n');
	}

	protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {

		var that = this;
		var path = args.source.path;
		var clientLines = args.lines;

		// read file contents into array for direct access
		var lines = readFileSync(path).toString().split('\n');

		var linesToAdd = args.breakpoints.map(b => b.line);
		var registeredBks = this._breakPoints.get(path);
		var linesToRemove: number[] = [];
		var linesToUpdate: number[] = linesToAdd;

		if (registeredBks) {
			linesToRemove = registeredBks.map(b => b.line).filter(oldLine => linesToAdd.indexOf(oldLine) === -1);
		    linesToUpdate = registeredBks.map(b => b.line).filter(oldLine => linesToAdd.indexOf(oldLine) >= 0);
		}

		var linesToRemovePromise = linesToRemove.map(line => {
			var bk = registeredBks.filter(b=> b.line === line)[0];
			return that.rubyProcess.Enqueue('delete ' + bk.id + '\n');
		});

		Promise.all(linesToRemovePromise).then(() => {
			var linesToUpdatePromise = linesToUpdate.map(line =>
				that.rubyProcess.Enqueue('break ' + path + ":" + line + '\n')
			);

			var breakpoints = new Array<Breakpoint>();

			Promise.all(linesToUpdatePromise).then((values) => {
				values.map(xml => {
 					var no = (<XMLDocument>xml).documentElement.attributes.getNamedItem('no');
					var location = (<XMLDocument>xml).documentElement.attributes.getNamedItem('location');
					var bp = <DebugProtocol.Breakpoint> new Breakpoint(true, that.convertDebuggerLineToClient(+location.value.split(':')[1]));
					bp.id = +no.value;
					breakpoints.push(bp);
				});

				that._breakPoints.set(path, breakpoints);

				response.body = {
					breakpoints: breakpoints
				};
				that.sendResponse(response);
			});
		});
	}

	protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {

		this.rubyProcess.Enqueue('thread list\n').then((xml: XMLDocument) => {
			if (xml.documentElement.nodeName !== 'threads') {
				return;
			}

			var threads = new Array<Thread>();
			for(let i= 0; i < xml.documentElement.childNodes.length; i++) {
				var threadNode = xml.documentElement.childNodes.item(i);
				var threadId = threadNode.attributes.getNamedItem('id');

				threads.push(new Thread(+threadId.value, 'thread_'+threadId.value));
			}
			response.body = {
				threads: threads
			};
			this.sendResponse(response);
		});
	}

	// Called by VS Code after a StoppedEvent
	/** StackTrace request; value of command field is 'stackTrace'.
		The request returns a stacktrace from the current execution state.
	*/
	protected stackTraceRequest(response: DebugProtocol.StackTraceResponse, args: DebugProtocol.StackTraceArguments): void {

		if (!args.levels) {
			args.levels = 0;
		}

		var that = this;

		this.rubyProcess.Enqueue('where\n').then((xml: XMLDocument) => {
			if (xml.documentElement.nodeName !== 'frames') {
				return;
			}

			const frames = new Array<StackFrame>();
			for(let i= 0; i < xml.documentElement.childNodes.length && i < args.levels; i++) {
				var frameNode = xml.documentElement.childNodes.item(i);
				var file = frameNode.attributes.getNamedItem('file');
				var line = frameNode.attributes.getNamedItem('line');
				var bn = basename(file.value);

				var sourcesInFile = readFileSync(file.value).toString().split('\n');
				var code = sourcesInFile[this.convertDebuggerLineToClient(+line.value)-1].trim();
				frames.push(new StackFrame(
					i,
					`${code}`,
					new Source(basename(file.value),
					this.convertDebuggerPathToClient(file.value)),
					this.convertDebuggerLineToClient(+line.value),
					0
			    ));
			}

			if (frames.length == 0) {
				that.sendEvent(new TerminatedEvent());
				return;
			}

			response.body = {
				stackFrames: frames
			};
			that.sendResponse(response);
		});
	}

    /** Scopes request; value of command field is 'scopes'.
	   The request returns the variable scopes for a given stackframe ID.
	*/
	protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {

		const frameReference = args.frameId;
		const scopes = new Array<Scope>();
		var frameCmd = ['frame', frameReference + 1, '\n'];
		this.rubyProcess.Run(frameCmd.join(' '));
		var variablesCmd = ['var', 'local', '\n'];
		this.rubyProcess.Enqueue(variablesCmd.join(' ')).then((xml: XMLDocument) => {
			let variables: IRubyEvaluationResult[] = [];
			for(let i= 0; i < xml.documentElement.childNodes.length; i++) {
				var varNode = xml.documentElement.childNodes.item(i);
				var name = varNode.attributes.getNamedItem('name');
				var value = varNode.attributes.getNamedItem('value');
				var hasChildren = varNode.attributes.getNamedItem('hasChildren');
				var objectId = varNode.attributes.getNamedItem('objectId');
				var kind = varNode.attributes.getNamedItem('kind');

				variables.push({
					Name: name.value,
					IsExpandable: hasChildren == undefined ? false : hasChildren.value === 'true',
					Id: objectId == undefined ? null : objectId.value,
					Value: value == undefined ? 'undefined' : value.value,
					Kind: kind.value
				});
			}

			let localVar: IDebugVariable = { variables: variables };
			scopes.push(new Scope('Local', this._variableHandles.create(localVar), false));

			response.body = {
				scopes: scopes
			};
			this.sendResponse(response);
		});
	}

	/** Variables request; value of command field is 'variables'.
		Retrieves all children for the given variable reference.
	*/
	protected variablesRequest(response: DebugProtocol.VariablesResponse, args: DebugProtocol.VariablesArguments): void {
		var varRef = this._variableHandles.get(args.variablesReference);

		if (varRef.evaluateChildren !== true) {
			let variables = [];
			varRef.variables.forEach(variable=> {
			let variablesReference = 0;
			//If this value can be expanded, then create a vars ref for user to expand it
			if (variable.IsExpandable) {
				const parentVariable: IDebugVariable = {
					variables: [variable],
					evaluateChildren: true
				};
				variablesReference = this._variableHandles.create(parentVariable);
			}

			variables.push({
				name: variable.Name,
				value: variable.Value,
				variablesReference: variablesReference
			});
		});

		response.body = {
			variables: variables
		};

		return this.sendResponse(response);
	}

		var varInstanceCmd = ['var', 'instance', varRef.variables[0].Id];
		this.rubyProcess.Enqueue(varInstanceCmd.join(' ').concat('\n')).then((xml: XMLDocument) => {
			let children = [];
			let variables: IRubyEvaluationResult[] = [];
			for(let i= 0; i < xml.documentElement.childNodes.length; i++) {
				var varNode = xml.documentElement.childNodes.item(i);
				var name = varNode.attributes.getNamedItem('name');
				var value = varNode.attributes.getNamedItem('value');
				var hasChildren = varNode.attributes.getNamedItem('hasChildren');
				var objectId = varNode.attributes.getNamedItem('objectId');
				var kind = varNode.attributes.getNamedItem('kind');

				variables.push({
					Name: name.value,
					IsExpandable: hasChildren == undefined ? false : hasChildren.value === 'true',
					Id: objectId == undefined ? null : objectId.value,
					Value: value == undefined ? 'undefined' : value.value,
					Kind: kind.value
				});
			}

			variables.forEach(child => {
				let variablesReference = 0;
				//If this value can be expanded, then create a vars ref for user to expand it
				if (child.IsExpandable) {
					const childVariable: IDebugVariable = {
						variables: [child],
						evaluateChildren: true
					};
					variablesReference = this._variableHandles.create(childVariable);
				}

				children.push({
					name: child.Name,
					value: child.Value,
					variablesReference: variablesReference
				});
			});

			response.body = {
				variables: children
			};

			this.sendResponse(response);
		});
	}

	protected continueRequest(response: DebugProtocol.ContinueResponse, args: DebugProtocol.ContinueArguments): void {

		this.sendResponse(response);
		this.rubyProcess.Run('c\n');
	}

	protected nextRequest(response: DebugProtocol.NextResponse, args: DebugProtocol.NextArguments): void {

		this.sendResponse(response);
		this.rubyProcess.Run('next\n');
	}

	protected stepInRequest(response: DebugProtocol.StepInResponse): void {
		this.sendResponse(response);
		this.rubyProcess.Run('step\n');
	}

	protected stepOutRequest(response: DebugProtocol.StepInResponse): void {
		this.sendResponse(response);

		//Not sure which command we should use, `finish` will execute all frames.
		this.rubyProcess.Run('finish\n');
	}

	/** Evaluate request; value of command field is 'evaluate'.
		Evaluates the given expression in the context of the top most stack frame.
		The expression has access to any variables and arguments that are in scope.
	*/
	protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
		this.rubyProcess.Enqueue("eval " + args.expression + "\n").then((value: any) => {
			response.body = {
				result: value,
				variablesReference: 0
			};
			this.sendResponse(response);
		});
	}

	protected disconnectRequest(response: DebugProtocol.DisconnectResponse, args: DebugProtocol.DisconnectArguments) {
		if (this.rubyProcess.state !== SocketClientState.closed) {
			this.rubyProcess.Run('quit\n');
		}
		this.sendResponse(response);
	}
}

DebugSession.run(RubyDebugSession);

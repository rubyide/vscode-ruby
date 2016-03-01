/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

"use strict";

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


class MockDebugSession extends DebugSession {

	// we don't support multiple threads, so we can use a hardcoded ID for the default thread
	private static THREAD_ID = 1;

	private _breakpointId = 1000;

	// the initial (and one and only) file we are debugging
	private _sourceFile: string;

	// the contents (= lines) of the one and only file
	private _sourceLines = new Array<string>();

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
		this._sourceFile = args.program;
		this._sourceLines = readFileSync(this._sourceFile).toString().split('\n');

		this.rubyProcess = new RubyProcess(this, args, response);

		if (args.stopOnEntry) {
			this.sendResponse(response);

			// we stop on the first line
			this.sendEvent(new StoppedEvent("entry", MockDebugSession.THREAD_ID));
		}
	}

	// Executed after all breakpints have been set by VS Code
	protected configurationDoneRequest(response: DebugProtocol.ConfigurationDoneRequest, args:
	DebugProtocol.ConfigurationDoneArguments): void {
		var command = ["start"];
		this.rubyProcess.Run(command.join(" ") + "\n");
	}

	protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {

		var path = args.source.path;
		var clientLines = args.lines;

		// read file contents into array for direct access
		var lines = readFileSync(path).toString().split('\n');

		var breakpoints = new Array<Breakpoint>();

		// verify breakpoint locations
		for (var i = 0; i < clientLines.length; i++) {
			var l = this.convertClientLineToDebugger(clientLines[i]);
			var verified = false;
			if (l < lines.length) {
				const line = lines[l-1].trim();
				// if a line is empty or starts with '+' we don't allow to set a breakpoint but move the breakpoint down
				if (line.length == 0 || line.indexOf("+") == 0)
					l++;
				// if a line starts with '-' we don't allow to set a breakpoint but move the breakpoint up
				if (line.indexOf("-") == 0)
					l--;
				// don't set 'verified' to true if the line contains the word 'lazy'
				// in this case the breakpoint will be verified 'lazy' after hitting it once.
				if (line.indexOf("lazy") < 0) {
					verified = true;    // this breakpoint has been validated
				}
			}
			const bp = <DebugProtocol.Breakpoint> new Breakpoint(verified, this.convertDebuggerLineToClient(l));
			bp.id = this._breakpointId++;
			var command = ["break", "test.rb:"+bp.line];
			this.rubyProcess.Run(command.join(" ") + "\n");
			breakpoints.push(bp);
		}
		this._breakPoints[path] = breakpoints;

		// send back the actual breakpoint positions
		response.body = {
			breakpoints: breakpoints
		};
		this.sendResponse(response);
	}

	protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {

		// return the default thread
		response.body = {
			threads: [
				new Thread(MockDebugSession.THREAD_ID, "thread 1")
			]
		};
		this.sendResponse(response);
	}

	// Called by VS Code after a StoppedEvent
	/** StackTrace request; value of command field is "stackTrace".
		The request returns a stacktrace from the current execution state.
	*/
	protected stackTraceRequest(response: DebugProtocol.StackTraceResponse, args: DebugProtocol.StackTraceArguments): void {

		if (!args.levels) {
			args.levels = 0;
		}

		var that = this;

		this.rubyProcess.Enqueue("where\n").then((xml: XMLDocument) => {
			if (xml.documentElement.nodeName !== 'frames') {
				return;
			}

			const frames = new Array<StackFrame>();
			for(let i= 0; i < xml.documentElement.childNodes.length && i < args.levels; i++) {
				var frameNode = xml.documentElement.childNodes.item(i);
				var file = frameNode.attributes.getNamedItem("file");
				var line = frameNode.attributes.getNamedItem("line");
				var bn = basename(file.value);

				//TODO: acutally we should check the workspace
				if (bn === 'ruby-debug-ide.rb' || bn === 'rdebug-ide') {
					break;
				}

				var code = that._sourceLines[that.convertDebuggerLineToClient(+line.value)-1].trim();
				frames.push(new StackFrame(
					i,
					`${code}`,
					new Source(basename(that._sourceFile),
					that.convertDebuggerPathToClient(that._sourceFile)),
					that.convertDebuggerLineToClient(+line.value),
					0
			    ));
			}

			response.body = {
				stackFrames: frames
			};
			that.sendResponse(response);
		});
	}

    /** Scopes request; value of command field is "scopes".
	   The request returns the variable scopes for a given stackframe ID.
	*/
	protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {

		const frameReference = args.frameId;
		const scopes = new Array<Scope>();
		var frameCmd = ["frame", frameReference + 1, "\n"];
		this.rubyProcess.Run(frameCmd.join(" "));
		var variablesCmd = ["var", "local", "\n"];
		this.rubyProcess.Enqueue(variablesCmd.join(" ")).then((xml: XMLDocument) => {
			let variables: IRubyEvaluationResult[] = [];
			for(let i= 0; i < xml.documentElement.childNodes.length; i++) {
				var varNode = xml.documentElement.childNodes.item(i);
				var name = varNode.attributes.getNamedItem("name");
				var value = varNode.attributes.getNamedItem("value");
				var hasChildren = varNode.attributes.getNamedItem("hasChildren");
				var objectId = varNode.attributes.getNamedItem("objectId");
				var kind = varNode.attributes.getNamedItem("kind");

				variables.push({
					Name: name.value,
					IsExpandable: hasChildren == undefined ? false : hasChildren.value === 'true',
					Id: objectId == undefined ? null : objectId.value,
					Value: value == undefined ? 'undefined' : value.value,
					Kind: kind.value
				});
			}

			let localVar: IDebugVariable = { variables: variables };
			scopes.push(new Scope("Local", this._variableHandles.create(localVar), false));

			response.body = {
				scopes: scopes
			};
			this.sendResponse(response);
		});
	}

	/** Variables request; value of command field is "variables".
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

		var varInstanceCmd = ["var", "instance", varRef.variables[0].Id];
		this.rubyProcess.Enqueue(varInstanceCmd.join(" ").concat("\n")).then((xml: XMLDocument) => {
			let children = [];
			let variables: IRubyEvaluationResult[] = [];
			for(let i= 0; i < xml.documentElement.childNodes.length; i++) {
				var varNode = xml.documentElement.childNodes.item(i);
				var name = varNode.attributes.getNamedItem("name");
				var value = varNode.attributes.getNamedItem("value");
				var hasChildren = varNode.attributes.getNamedItem("hasChildren");
				var objectId = varNode.attributes.getNamedItem("objectId");
				var kind = varNode.attributes.getNamedItem("kind");

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
		this.rubyProcess.Run("c\n");
	}

	protected nextRequest(response: DebugProtocol.NextResponse, args: DebugProtocol.NextArguments): void {

		this.sendResponse(response);
		this.rubyProcess.Run("next\n");
	}

	protected stepInRequest(response: DebugProtocol.StepInResponse): void {
        this.sendResponse(response);
        this.rubyProcess.Run("step\n");
    }
    protected stepOutRequest(response: DebugProtocol.StepInResponse): void {
        this.sendResponse(response);

		//Not sure which command we should use, `finish` will execute all frames.
        //this.debugSocketServer.write("\n");
    }

	/** Evaluate request; value of command field is "evaluate".
		Evaluates the given expression in the context of the top most stack frame.
		The expression has access to any variables and arguments that are in scope.
	*/
	protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
		response.body = {
			result: `evaluate(${args.expression})`,
			variablesReference: 0
		};
		this.sendResponse(response);
	}

	protected disconnectRequest(response: DebugProtocol.DisconnectResponse, args: DebugProtocol.DisconnectArguments) {
        this.rubyProcess.Run("quit\n");
        this.sendResponse(response);
    }
}

DebugSession.run(MockDebugSession);

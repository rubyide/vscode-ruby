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
import * as path from 'path';
import {DOMParser} from 'xmldom';
import {RubyProcess} from './ruby';
import {LaunchRequestArguments, AttachRequestArguments, IRubyEvaluationResult, IDebugVariable} from './interface';
import {SocketClientState, Mode} from './common';
import {endsWith, startsWith} from './helper';

class RubyDebugSession extends DebugSession {
    private _breakpointId = 1000;
    private _threadId = 2;
    private _frameId = 0;
    private _firstSuspendReceived = false;
    private _activeFileData = new Map<string, string[]>();
    // maps from sourceFile to array of Breakpoints
    private _breakPoints = new Map<string, DebugProtocol.Breakpoint[]>();
    private _variableHandles: Handles<IDebugVariable>;
    private rubyProcess: RubyProcess;
    private requestArguments: any;
    private debugMode: Mode;

    /**
     * Creates a new debug adapter.
     * We configure the default implementation of a debug adapter here
     * by specifying this this 'debugger' uses zero-based lines and columns.
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
        //response.body.supportsFunctionBreakpoints = true;
        //currently cond bp doesn't work - but that doesn't really matter, because neither does this call
        response.body.supportsConditionalBreakpoints = false;
        this.sendResponse(response);
    }

	protected setupProcessHanlders() {
		this.rubyProcess.on('debuggerComplete', () => {
            this.sendEvent(new TerminatedEvent());
        }).on('executableOutput', (data: Buffer) => {
            this.sendEvent(new OutputEvent(data.toString(), 'stdout'));
        }).on('executableStdErr', (error: Buffer) => {
            this.sendEvent(new OutputEvent(error.toString(), 'stderr'));
        }).on('nonTerminalError', (error: string) => {
            this.sendEvent(new OutputEvent("Debugger error: " + error + '\n', 'stderr'));
        }).on('breakpoint', result => {
            this.sendEvent(new StoppedEvent('breakpoint', result.threadId));
        }).on('exception', result => {
            this.sendEvent(new OutputEvent("\nException raised: [" + result.type + "]: " + result.message + "\n",'stderr'));
            this.sendEvent(new StoppedEvent('exception', result.threadId, result.type + ": " + result.message));
        }).on('terminalError', (error: string) => {
            this.sendEvent(new OutputEvent("Debugger terminal error: " + error))
            this.sendEvent(new TerminatedEvent());
        });
	}


    protected launchRequest(response: DebugProtocol.LaunchResponse, args: LaunchRequestArguments): void {
		this.debugMode = Mode.launch;
		this.requestArguments = args;
        this.rubyProcess = new RubyProcess(Mode.launch, args);

        this.rubyProcess.on('debuggerConnect', () => {
            this.sendEvent(new InitializedEvent());
            this.sendResponse(response);
        }).on('suspended', result => {
            if ( args.stopOnEntry && !this._firstSuspendReceived ) {
                this.sendEvent(new StoppedEvent('entry', result.threadId));
            }
            else {
                this.sendEvent(new StoppedEvent('step', result.threadId));
            }

            this._firstSuspendReceived = true;
        });

		this.setupProcessHanlders();

        if (args.showDebuggerOutput) {
            this.rubyProcess.on('debuggerOutput', (data: Buffer) => {
                this.sendEvent(new OutputEvent(data.toString() + '\n', 'console'));
            });
        }
    }

	protected attachRequest(response: DebugProtocol.AttachResponse, args: AttachRequestArguments): void {
		this.requestArguments = args;
		this.debugMode = Mode.attach;
        this.rubyProcess = new RubyProcess(Mode.attach, args);

        this.rubyProcess.on('debuggerConnect', () => {
            this.sendEvent(new InitializedEvent());
            this.sendResponse(response);
        }).on('suspended', result => {
            this.sendEvent(new StoppedEvent('step', result.threadId));
        });

		this.setupProcessHanlders();
	}

    // Executed after all breakpints have been set by VS Code
    protected configurationDoneRequest(response: DebugProtocol.ConfigurationDoneResponse, args:
    DebugProtocol.ConfigurationDoneArguments): void {
        this.rubyProcess.Run('start');
        this.sendResponse(response);
    }

    protected setExceptionBreakPointsRequest(response: DebugProtocol.SetExceptionBreakpointsResponse, args: DebugProtocol.SetExceptionBreakpointsArguments): void {
        if (args.filters.indexOf('all') >=0){
            //Exception is the root of all (Ruby) exceptions - this is the best we can do
            //If someone makes their own exception class and doesn't inherit from
            //Exception, then they really didn't expect things to work properly
            //anyway.

            //We don't do anything with the return from this, but we
            //have to add an expectation for the output.
            this.rubyProcess.Enqueue('catch Exception').then(()=>1);
        }
        else {
            this.rubyProcess.Run('catch off');
        }
        this.sendResponse(response);
    }

    protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {
        var path = this.convertClientPathToDebugger(args.source.path);

        //to ensure that breakpoints with altered conditions are set, it is
        //best to remove all and add them back.
        //In preperation for when they're working.
        if (this._breakPoints.get(path)) {
            let deletePromises = this._breakPoints.get(path).map(bp => this.rubyProcess.Enqueue('delete ' + bp.id));
            //this will return before the adding (if any) completes
            Promise.all(deletePromises).then(() => this._breakPoints.delete(path));
        }
        var breakpointAddPromises = args.breakpoints.map(b=>{
            //let conditionString =  b.condition ? ' if ' + b.condition : '';
            //return this.rubyProcess.Enqueue('break ' + path + ':' + b.line + conditionString);
            return this.rubyProcess.Enqueue('break ' + path + ':' + b.line);
        });
        Promise.all(breakpointAddPromises).then( values => {
            let breakpoints = values.map(attributes => {
                let bp = <DebugProtocol.Breakpoint> new Breakpoint(true, this.convertDebuggerLineToClient(+attributes.location.split(':')[1]));
                bp.id = +attributes.no;
                return bp;
            });

            this._breakPoints.set(path, breakpoints);

            response.body = {
                breakpoints: breakpoints
            };
            this.sendResponse(response);
        });
    }

    protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {

        this.rubyProcess.Enqueue('thread list').then(results => {
            this._threadId = results[0].id;
            response.body = {
                threads: results.map(thread => new Thread(+thread.id,'Thread ' + thread.id))
            };
            this.sendResponse(response);
        });
    }

    // Called by VS Code after a StoppedEvent
    /** StackTrace request; value of command field is 'stackTrace'.
        The request returns a stacktrace from the current execution state.
    */
    protected stackTraceRequest(response: DebugProtocol.StackTraceResponse, args: DebugProtocol.StackTraceArguments): void {
        this.rubyProcess.Enqueue('where').then(results => {
            //drop rdbug frames
            results = results.filter(stack => !(
				endsWith(stack.file, '/rdebug-ide', null) ||
				endsWith(stack.file, '/ruby-debug-ide.rb', null) ||
				(this.debugMode == Mode.attach &&
				path.normalize(stack.file).toLocaleLowerCase().indexOf(path.normalize(this.requestArguments.remoteWorkspaceRoot).toLocaleLowerCase()) === -1))
			);

            //get the current frame
            results.some(stack=> stack.current ? this._frameId = +stack.no: 0);

            //only read the file if we don't have it already
            results.forEach(stack=>{
                if (!this._activeFileData.has(this.convertDebuggerPathToClient(stack.file))) {
                    this._activeFileData.set(this.convertDebuggerPathToClient(stack.file), readFileSync(this.convertDebuggerPathToClient(stack.file),'utf8').split('\n'))
                }
            });

            response.body = {
                stackFrames: results.filter(stack=>stack.file.indexOf('debug-ide')<0)
                    .map(stack => new StackFrame(+stack.no,
                    this._activeFileData.get(this.convertDebuggerPathToClient(stack.file))[+stack.line-1].trim(),
                    new Source(basename(stack.file), this.convertDebuggerPathToClient(stack.file)),
                    this.convertDebuggerLineToClient(+stack.line), 0))
            };
            if (response.body.stackFrames.length){
                this.sendResponse(response);
            }
            else {
                this.sendEvent(new TerminatedEvent());
            }
            return;
        });
    }

	protected convertClientPathToDebugger(localPath: string): string {
		if (this.debugMode == Mode.launch) {
			return localPath;
		}

		var relativePath = path.join(
			this.requestArguments.remoteWorkspaceRoot, localPath.substring(this.requestArguments.cwd.length)
		);

		var sepIndex = this.requestArguments.remoteWorkspaceRoot.lastIndexOf('/');

		if (sepIndex !== -1) {
			// *inx or darwin
			relativePath = relativePath.replace(/\\/g, '/');
		}

		return relativePath;
	}

	protected convertDebuggerPathToClient(serverPath: string):string{
		if (this.debugMode == Mode.launch) {
			return serverPath;
		}

		// Path.join will convert the path using local OS preferred separator
		var relativePath = path.join(
			this.requestArguments.cwd, serverPath.substring(this.requestArguments.remoteWorkspaceRoot.length)
		);
		return relativePath;
	}

    protected switchFrame(frameId) {
        if (frameId === this._frameId) return;
        this._frameId = frameId;
        this.rubyProcess.Run('frame ' + frameId)
    }

    protected varyVariable(variable){
        if (variable.type === 'String') {
            variable.hasChildren = false;
            variable.value = "'" + variable.value.replace(/'/g,"\\'") + "'";
        }
        else if ( variable.value && startsWith(variable.value, '#<' + variable.type, 0)){
            variable.value = variable.type;
        }
        return variable;
    }

    protected createVariableReference(variables): IRubyEvaluationResult[]{
        return variables.map(this.varyVariable).map(variable=>({
            name: variable.name,
            kind: variable.kind,
            type: variable.type,
            value: variable.value === undefined ? 'undefined' : variable.value,
            id: variable.objectId,
            variablesReference: variable.hasChildren === 'true' ? this._variableHandles.create({objectId:variable.objectId}):0
        }));
    }

    /** Scopes request; value of command field is 'scopes'.
       The request returns the variable scopes for a given stackframe ID.
    */
    protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {

        //this doesn't work properly across threads.

        this.switchFrame(args.frameId);
        Promise.all([
            this.rubyProcess.Enqueue('var local'),
            this.rubyProcess.Enqueue('var global')
        ])
        .then( results =>{
            const scopes = new Array<Scope>();
            scopes.push(new Scope('Local',this._variableHandles.create({variables:this.createVariableReference(results[0])}),false));
            scopes.push(new Scope('Global',this._variableHandles.create({variables:this.createVariableReference(results[1])}),false));
            response.body = {
                scopes: scopes
            };
            this.sendResponse(response);
        });
    }

    protected variablesRequest(response: DebugProtocol.VariablesResponse, args: DebugProtocol.VariablesArguments): void {
        var varRef = this._variableHandles.get(args.variablesReference);
        let varPromise;
        if ( varRef.objectId ){
            varPromise = this.rubyProcess.Enqueue('var i ' + varRef.objectId).then(results => this.createVariableReference(results));
        }
        else {
            varPromise = Promise.resolve(varRef.variables);
        }

        varPromise.then(variables =>{
            response.body = {
                variables: variables
            };
            this.sendResponse(response);
        });
    }

    protected continueRequest(response: DebugProtocol.ContinueResponse, args: DebugProtocol.ContinueArguments): void {
        this.sendResponse(response);
        this.rubyProcess.Run('c');
    }

    protected nextRequest(response: DebugProtocol.NextResponse, args: DebugProtocol.NextArguments): void {
        this.sendResponse(response);
        this.rubyProcess.Run('next');
    }

    protected stepInRequest(response: DebugProtocol.StepInResponse): void {
        this.sendResponse(response);
        this.rubyProcess.Run('step');
    }

    protected pauseRequest(response: DebugProtocol.PauseResponse): void{
        this.sendResponse(response);
        this.rubyProcess.Run('pause');
    }
    protected stepOutRequest(response: DebugProtocol.StepInResponse): void {

        this.sendResponse(response);
        //Not sure which command we should use, `finish` will execute all frames.
        this.rubyProcess.Run('finish');
    }

    /** Evaluate request; value of command field is 'evaluate'.
        Evaluates the given expression in the context of the top most stack frame.
        The expression has access to any variables and arguments this are in scope.
    */
    protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
        // TODO: this will often not work. Will try to call
        // Class.@variable which doesn't work.
        // need to tie it to the existing variablesReference set
        // That will required having ALL variables stored, which will also (hopefully) fix
        // the variable value mismatch between threads
        this.rubyProcess.Enqueue("eval " + args.expression).then(result => {
            if ( startsWith(result.value, '#<', 0)){
                //is an object

            }
            response.body = {
                result: result.value,
                variablesReference: 0
            };
            this.sendResponse(response);
        });
    }

    protected disconnectRequest(response: DebugProtocol.DisconnectResponse, args: DebugProtocol.DisconnectArguments) {
        if (this.rubyProcess.state !== SocketClientState.closed) {
            this.rubyProcess.Run('quit');
        }
        this.sendResponse(response);
    }
}

DebugSession.run(RubyDebugSession);

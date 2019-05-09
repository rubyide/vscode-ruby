'use strict';

import {DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, BreakpointEvent, OutputEvent, Thread, StackFrame, Scope, Source, Handles, Breakpoint} from 'vscode-debugadapter';
import {DebugProtocol} from 'vscode-debugprotocol';
import {readFileSync,existsSync} from 'fs';
import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import * as path from 'path';
import {DOMParser} from 'xmldom';
import {RubyProcess} from './ruby';
import {LaunchRequestArguments, AttachRequestArguments, IRubyEvaluationResult, IDebugVariable} from './interface';
import {SocketClientState, Mode} from './common';
import {endsWith, startsWith} from './helper';

class CachedBreakpoint implements DebugProtocol.SourceBreakpoint {
    public line: number;
    public column: number;
    public condition: string;
    public id: number;

    public constructor(line: number, column?: number, condition?: string, id?: number) {
        this.line = line;
        this.column = column;
        this.condition = condition;
        this.id = id;
    }

    public static fromSourceBreakpoint(sourceBreakpoint: DebugProtocol.SourceBreakpoint): CachedBreakpoint {
        return new CachedBreakpoint(sourceBreakpoint.line, sourceBreakpoint.column, sourceBreakpoint.condition);
    }

    public convertForResponse(): DebugProtocol.Breakpoint {
        var result = <DebugProtocol.Breakpoint> new Breakpoint(true, this.line, this.column);
        result.id = this.id;
        return result;
    }
}

class RubyDebugSession extends DebugSession {
    private _breakpointId = 1000;
    private _threadId = 2;
    private _frameId = 0;
    private _firstSuspendReceived = false;
    private _activeFileData = new Map<string, string[]>();
    private _existingBreakpoints = new Map<string, CachedBreakpoint[]>();
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
        response.body.supportsConditionalBreakpoints = true;
        this.sendResponse(response);
    }

	protected setupProcessHanlders() {
		this.rubyProcess.on('debuggerComplete', () => {
            this.sendEvent(new TerminatedEvent());
        }).on('debuggerProcessExit', () => {
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
        var key = this.convertClientPathToKey(args.source.path);
        var existingBreakpoints = this._existingBreakpoints.get(key) || [];
        var requestedBreakpoints = args.breakpoints.map(bp => CachedBreakpoint.fromSourceBreakpoint(bp));

        var existingLines = existingBreakpoints.map(bp => bp.line);
        var requestedLines = requestedBreakpoints.map(bp => bp.line);

        var breakpointsToRemove = existingBreakpoints.filter(bp => requestedLines.indexOf(bp.line) < 0);
        var breakpointsToAdd = requestedBreakpoints.filter(bp => existingLines.indexOf(bp.line) < 0);

        console.assert(breakpointsToRemove.length > 0 || breakpointsToAdd.length > 0);

        // Handle the removal of old breakpoints.
        if (breakpointsToRemove.length > 0) {
            var linesToRemove = breakpointsToRemove.map(bp => bp.line);
            existingBreakpoints = existingBreakpoints.filter(bp => linesToRemove.indexOf(bp.line) < 0);
            this._existingBreakpoints.set(key, existingBreakpoints);

            var removePromises = breakpointsToRemove.map(bp => this.rubyProcess.Enqueue('delete ' + bp.id));
            Promise.all(removePromises).then(results => {
                let removedIds = results.map(attr => +attr.no);
                let unremovedBreakpoints = breakpointsToRemove.filter(bp => removedIds.indexOf(bp.id) < 0);
                console.assert(unremovedBreakpoints.length == 0);

                response.body = {
                    breakpoints: existingBreakpoints.map(bp => bp.convertForResponse())
                };
                this.sendResponse(response);
            });
        }

        // Handle the addition of new breakpoints.
        if (breakpointsToAdd.length > 0) {
            var path = this.convertClientPathToDebugger(args.source.path);

            var addPromises = breakpointsToAdd.map(bp => {
                let command = 'break ' + path + ':' + bp.line;
                if (bp.condition) command += ' if ' + bp.condition;
                return this.rubyProcess.Enqueue(command);
            });
            Promise.all(addPromises).then(results => {
                var addedBreakpoints = results.map(attr => {
                    var line = +(attr.location + '').split(':').pop();
                    var id = +attr.no;
                    return new CachedBreakpoint(line, null, null, id);
                });

                console.assert(addedBreakpoints.length == breakpointsToAdd.length);
                for (let index = 0; index < addedBreakpoints.length; ++index) {
                    console.assert(addedBreakpoints[index].line == breakpointsToAdd[index].line);
                    breakpointsToAdd[index].id = addedBreakpoints[index].id;
                }

                existingBreakpoints = existingBreakpoints.concat(breakpointsToAdd);
                this._existingBreakpoints.set(key, existingBreakpoints);

                response.body = {
                    breakpoints: existingBreakpoints.map(bp => bp.convertForResponse())
                };
                this.sendResponse(response);
            });
        }
    }

    protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {

        this.rubyProcess.Enqueue('thread list').then(results => {
            if (results && results.length > 0) {
                this._threadId = results[0].id;
            }
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
				endsWith(stack.file, '/ruby-debug-ide.rb', null))
			);

            //get the current frame
            results.some(stack=> stack.current ? this._frameId = +stack.no: 0);

            //only read the file if we don't have it already
            results.forEach(stack=>{
                const filePath = this.convertDebuggerPathToClient(stack.file);
                if (!this._activeFileData.has(filePath) && existsSync(filePath)) {
                    this._activeFileData.set(filePath, readFileSync(filePath,'utf8').split('\n'))
                }
            });

            response.body = {
                stackFrames: results.filter(stack=>stack.file.indexOf('debug-ide')<0&&+stack.line>0)
                    .map(stack => {
                        const filePath = this.convertDebuggerPathToClient(stack.file);
                        const fileData = this._activeFileData.get(filePath);
                        const gemFilePaths = filePath.split('/gems/');
                        const gemFilePath = gemFilePaths[gemFilePaths.length-1];
                        return new StackFrame(+stack.no,
                            fileData ? fileData[+stack.line-1].trim() : (gemFilePath+':'+stack.line),
                            fileData ? new Source(basename(stack.file), filePath) : null,
                            this.convertDebuggerLineToClient(+stack.line), 0);
                    })
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

    protected convertClientPathToKey(localPath: string): string {
        return localPath.replace(/\\/g, '/');
    }

    private isSubPath(subPath: string): boolean {
        return subPath && !subPath.startsWith('..') && !path.isAbsolute(subPath);
    }

    private getPathImplementation(pathToCheck: string): any {
        if (pathToCheck) {
            if (pathToCheck.indexOf(path.posix.sep) >= 0) {
                return path.posix;
            } else if (pathToCheck.indexOf(path.win32.sep) >= 0) {
                return path.win32;
            }
        }

        return path;
    }

    protected convertClientPathToDebugger(localPath: string): string {
        if (this.debugMode === Mode.launch) {
            return localPath;
        }

        let relativeLocalPath = path.relative(this.requestArguments.cwd, localPath);

        if (!this.isSubPath(relativeLocalPath)) {
            return localPath;
        }

        let remoteWorkspaceRoot =
            this.requestArguments.remoteWorkspaceRoot || this.requestArguments.cwd;

        let remotePathImplementation = this.getPathImplementation(remoteWorkspaceRoot);
        let localPathImplementation = this.getPathImplementation(this.requestArguments.cwd);

        let relativePath = remotePathImplementation.join.apply(
            null,
            [remoteWorkspaceRoot].concat(relativeLocalPath.split(localPathImplementation.sep))
        );

        return relativePath;
    }

    protected convertDebuggerPathToClient(serverPath: string): string {
        if (this.debugMode === Mode.launch) {
            return serverPath;
        }

        let remoteWorkspaceRoot =
            this.requestArguments.remoteWorkspaceRoot || this.requestArguments.cwd;

        let remotePathImplementation = this.getPathImplementation(remoteWorkspaceRoot);
        let localPathImplementation = this.getPathImplementation(this.requestArguments.cwd);

        let relativeRemotePath = remotePathImplementation.relative(remoteWorkspaceRoot, serverPath);


        if (!this.isSubPath(relativeRemotePath)) {
            return serverPath;
        }

        let relativePath = localPathImplementation.join.apply(
            null,
	          [this.requestArguments.cwd].concat(relativeRemotePath.split(remotePathImplementation.sep))
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
        if (!Array.isArray(variables)) { variables = []; }
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
            response.body = {
                result: result.value
                    ? result.value
                    : (result.length > 0 && result[0].value
                        ? result[0].value
                        : "Not available"),
                variablesReference: 0,
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

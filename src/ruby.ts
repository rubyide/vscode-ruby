/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

'use strict';

import {basename, dirname} from 'path';
import * as net from 'net';
import * as childProcess from 'child_process';
import {EventEmitter} from 'events';
import {DOMParser} from 'xmldom';
import {LaunchRequestArguments, AttachRequestArguments, IRubyEvaluationResult, IDebugVariable, ICommand} from './interface';
import {SocketClientState, Mode} from './common';
import {includes} from './helper';

var domErrorLocator: any = {};

export class RubyProcess extends EventEmitter {
    private debugSocketClient : net.Socket = null;
    private buffer: string;
    private socketConnected: boolean;
    private parser: DOMParser;
    private debugprocess: childProcess.ChildProcess;
    private pendingResponses: ICommand[];
    private pendingCommands: any[];
    private _state: SocketClientState;

    private domErrors: any;
    private domErrorHandler(type: string, error: string){
        this.domErrors.push({
            lineNumber: domErrorLocator.lineNumber,
            columnNumber: domErrorLocator.columnNumber,
            error: error,
            type: type
        });
    }

    get state(): SocketClientState {
        return this._state;
    }

    set state(newState: SocketClientState) {
        this._state = newState;
    }

    public constructor(mode: Mode, args: any) {
        super();
        this.pendingResponses = [];
        this.pendingCommands = [];
        this.socketConnected = false;
        this.state = SocketClientState.ready;

        this.buffer = '';
        this.parser = new DOMParser({
            errorHandler: (type,msg)=>this.domErrorHandler(type,msg),
            locator: domErrorLocator
        });

        this.debugSocketClient = new net.Socket( {
            type: 'tcp4'
        });

        this.debugSocketClient.on('connect', (buffer: Buffer) => {
            this.state = SocketClientState.connected;
            //first thing we have to send is the start - if stopOnEntry is
            //selected, rdebug-ide stops on the first executable line
            this.pendingCommands.forEach( cmd => {
                this.pendingResponses.push(cmd);
                this.debugSocketClient.write(cmd.command + '\n');
            });
            this.emit('debuggerConnect');
            this.pendingCommands = [];
        });

        this.debugSocketClient.on('end', (ex) => {
            this.state = SocketClientState.closed;
            // Emitted when the other end of the socket sends a FIN packet.
            this.emit('debuggerComplete');
        });

        this.debugSocketClient.on('close', d=> {
            this.state = SocketClientState.closed;
        });

        this.debugSocketClient.on('error', d=> {
            var msg = 'Client: ' + d;
            this.emit('nonTerminalError', msg);
        });

        this.debugSocketClient.on('timeout', d=> {
            var msg = 'Timeout: ' + d;
            this.emit('nonTerminalError', msg);
        });

        this.debugSocketClient.on('data', (buffer: Buffer) => {
            this.buffer += buffer.toString();
            var threadId: any;
            //ensure the dom is stable (complete)
            this.domErrors = [];
            var document: XMLDocument = this.parser.parseFromString(this.buffer,'application/xml');
            if ( this.domErrors.length ){
                //don't report stuff we can deal with happily
                if ( !(
                    includes(this.domErrors[0].error, 'unclosed xml attribute', 0)||
                    includes(this.domErrors[0].error, 'attribute space is required', 0) ||
                    includes(this.domErrors[0].error, "elements closed character '/' and '>' must be connected", 0)
                    ))
                    this.emit('debuggerOutput','Debugger failed to parse: ' + this.domErrors[0].error + "\nFor: " + this.buffer.slice(0,20));
                if ( this.buffer.indexOf('<eval ') >= 0 &&
                    (includes(this.domErrors[0].error, 'attribute space is required', 0) ||
                    includes(this.domErrors[0].error, "elements closed character '/' and '>' must be connected", 0))){
                    //potentially an issue with the 'eval' tagName
                    let start = this.buffer.indexOf('<eval ');
                    let end = this.buffer.indexOf('" />',start);
                    if ( end < 0 ) return; //perhaps not all in yet
                    start = this.buffer.indexOf(' value="',start);
                    if ( start < 0 ) return; //not the right structure
                    start += 8;
                    let inner = this.buffer.slice(start,end).replace(/\"/g,'&quot;');
                    this.buffer = this.buffer.slice(0,start) + inner + this.buffer.slice(end);
                    this.domErrors = [];
                    document = this.parser.parseFromString(this.buffer,'application/xml');
                } else return; //one of the xml elements is incomplete
            }
            //if it's still bad: - we need to do something else with this
            if ( this.domErrors.length ) return;

            for (let idx = 0; idx < document.childNodes.length; idx++){
                let node: any = document.childNodes[idx];
                let attributes: any = {};
                if (node.attributes && node.attributes.length){
                    for (let attrIdx = 0; attrIdx < node.attributes.length; attrIdx++){
                        attributes[node.attributes[attrIdx].name] = node.attributes[attrIdx].value;
                    }
                    if ( attributes.threadId ) attributes.threadId = +attributes.threadId;
                }
                //the structure here only has one or the other
                if (node.childNodes && node.childNodes.length){
                    let finalAttributes = [];
                    //all of the child nodes are the same type in our responses
                    for (let nodeIdx = 0; nodeIdx < node.childNodes.length; nodeIdx++){
                        let childNode = node.childNodes[nodeIdx];
                        attributes = {}
                        if ( childNode.attributes && childNode.attributes.length ){
                            for (let attrIdx = 0; attrIdx < childNode.attributes.length; attrIdx++){
                                attributes[childNode.attributes[attrIdx].name] = childNode.attributes[attrIdx].value;
                            }
                        }
                        finalAttributes.push(attributes);
                    }
                    attributes = finalAttributes;
                }
                if ( ['breakpoint','suspended','exception'].indexOf(node.tagName) >= 0){
                    this.emit(node.tagName, attributes );
                }
                //this just assumes we don't get anything in between
                else this.FinishCmd(attributes);
            }
            this.buffer = "";
        });


        if (mode == Mode.launch) {
            var runtimeArgs = ['--evaluation-timeout', '10'];
            var runtimeExecutable: string;

            if (process.platform === 'win32') {
                runtimeExecutable = 'rdebug-ide.bat';
            }
            else {
                // platform: linux or darwin
                runtimeExecutable = 'rdebug-ide';
            }

            if (args.pathToRDebugIDE && args.pathToRDebugIDE !== 'rdebug-ide'){
                runtimeExecutable = args.pathToRDebugIDE;
            }

            var processCwd = args.cwd || dirname(args.program);
            if (args.showDebuggerOutput){
                runtimeArgs.push('-x');
            }

            if (args.stopOnEntry){
                runtimeArgs.push('--stop');
            }

            if (args.useBundler){
                runtimeArgs.unshift(runtimeExecutable);
                runtimeArgs.unshift('exec');
                runtimeExecutable = 'bundle';

                if (args.pathToBundler && args.pathToBundler !== 'bundle'){
                    runtimeExecutable = args.pathToBundler;
                }
            }

            this.debugprocess = childProcess.spawn(runtimeExecutable, [...runtimeArgs, args.program, ...args.args || []], {cwd: processCwd});

            // redirect output to debug console
            this.debugprocess.stdout.on('data', (data: Buffer) => {
                this.emit('executableOutput', data);
            });

            this.debugprocess.stderr.on('data', (data: Buffer) => {
                if (/^Fast Debugger/.test(data.toString())) {
                    this.debugSocketClient.connect(1234);
                    if (args.showDebuggerOutput) {
                        this.emit('debuggerOutput', data);
                    }
                }
                else {
                    this.emit('executableStdErr', data);
                }
            });

            this.debugprocess.on('exit', () => {
                this.emit('debuggerProcessExit');
            });

            this.debugprocess.on('error', (error: Error) => {
                this.emit('terminalError', "Process failed: " + error.message);
            });
        }
        else {
            this.debugSocketClient.connect(args.remotePort, args.remoteHost);
        }
    }

    public Run(cmd: string): void {
        if (this.state !== SocketClientState.connected) {
            var newCommand = {
                command: cmd,
                resolve: () => 0,
                reject: () => 0
            };
            this.pendingCommands.push(newCommand);
        }
        else {
            this.debugSocketClient.write(cmd + '\n');
        }
    }

    public Enqueue(cmd: string): Promise<any> {
        var pro =  new Promise<any>((resolve, reject) => {
            var newCommand = {
                command: cmd,
                resolve: resolve,
                reject: reject
            };
            if (this.state !== SocketClientState.connected) {
                this.pendingCommands.push(newCommand);
            }
            else {
                this.pendingResponses.push(newCommand);
                this.debugSocketClient.write(newCommand.command + '\n');
            }
        });

        return pro;
    }

    private FinishCmd(result: any): void {
        if (this.pendingResponses.length > 0) {
            this.pendingResponses[0].resolve(result);
            this.pendingResponses.shift();
        }
    }
}

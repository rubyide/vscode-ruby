import { DebugProtocol } from 'vscode-debugprotocol';

/**
 * This interface should always match the schema found in the vscode-ruby extension manifest.
 */
export interface LaunchRequestArguments extends DebugProtocol.LaunchRequestArguments {
    /** An absolute path to the program to debug. */
    program: string;
    /** Optional arguments passed to the program being debugged. */
    args: string[];
    /** Automatically stop target after launch. If not specified, target does not stop. */
    stopOnEntry?: boolean;
    /** Show debugger process output. If not specified, there will only be executable output */
    showDebuggerOutput?: boolean;
    /** Show commands issued by the IDE to the debugger. If not specified, no commands will be shown. */
    showDebuggerCommands?: boolean;
    /** Omit files matching any of these regexes from stack traces, and automatically step through them when debugging. */
    skipFiles: string[];
    /** Automatically step out of files matching these regexes during debugging. */
    finishFiles: string[];
    /** Executable working directory. */
    cwd?: string;
}

export interface AttachRequestArguments extends DebugProtocol.AttachRequestArguments {
    /** Executable working directory. */
    cwd?: string;
    /** Optional host address for remote debugging. */
    remoteHost?: string;
    /** Optional port for remote debugging. */
    remotePort?: string;
    /** Path to UNIX domain socket for remote debugging. */
    localSocketPath?: string;
    /** Optional remote workspace root, this parameter is required for remote debugging */
    remoteWorkspaceRoot?: string;
    /** Show debugger process output. If not specified, there will only be executable output */
    showDebuggerOutput?: boolean;
    /** Show commands issued by the IDE to the debugger. If not specified, no commands will be shown. */
    showDebuggerCommands?: boolean;
    /** Omit files matching any of these regexes from stack traces, and automatically step through them when debugging. */
    skipFiles: string[];
    /** Automatically step out of files matching these regexes during debugging. */
    finishFiles: string[];
}

export interface IRubyEvaluationResult {
    name: string;
    kind: string;
    type: string;
    value: string;
    id: string;
    variablesReference: number;
}

export interface IDebugVariable {
    objectId?: number;
    variables?: IRubyEvaluationResult[];
    variableName?: string;
    variableType?: string;
}

export interface ICommand {
    command: string;
    resolve: (value?: any) => void
    reject: (error?: any) => void
}

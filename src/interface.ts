/**
 * This interface should always match the schema found in the vscode-ruby extension manifest.
 */
export interface LaunchRequestArguments {
    /** An absolute path to the program to debug. */
    program: string;
    /** Optional arguments passed to the program being debugged. */
    args: string[];
    /** Automatically stop target after launch. If not specified, target does not stop. */
    stopOnEntry?: boolean;
    /** Show debugger process output. If not specified, there will only be executable output */
    showDebuggerOutput?: boolean;
    /** Optional arguments passed to the runtime executable. */
    runtimeArgs?: string[];
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
}

export interface ICommand {
    command: string;
    resolve: (value?: any) => void
    reject: (error?: any) => void
}

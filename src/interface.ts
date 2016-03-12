/**
 * This interface should always match the schema found in the vscode-ruby extension manifest.
 */
export interface LaunchRequestArguments {
    /** Debug mode: Launch or Remote. */
    request: string;
    /** An absolute path to the program to debug. */
    program: string;
    /** Optional arguments passed to the program being debugged. */
    args: string[];
    /** Automatically stop target after launch. If not specified, target does not stop. */
    stopOnEntry?: boolean;
    /** Show debugger process output. If not specified, there will only be executable output */
    showDebuggerOutput?: boolean;
    /** Executable working directory. */
    cwd?: string;
    /** Optional host address for remote debugging. */
    remoteHost?: string;
    /** Optional port for remote debugging. */
    remotePort?: string;
    /** Optional remote workspace root, this parameter is required for remote debugging */
    remoteWorkspaceRoot?: string;
    /** Optional local workspace root, this parameter is required for remote debugging */
    localWorkspaceRoot?: string;
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

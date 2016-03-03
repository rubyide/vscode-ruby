/**
 * This interface should always match the schema found in the mock-debug extension manifest.
 */
export interface LaunchRequestArguments {
	/** An absolute path to the program to debug. */
	program: string;
	/** Automatically stop target after launch. If not specified, target does not stop. */
	stopOnEntry?: boolean;
	/** Show debugger process output. If not specified, there will only be executable output */
	showDebuggerOutput?: boolean;
	/** Optional arguments passed to the runtime executable. */
	runtimeArgs?: string[];
}

export interface IRubyEvaluationResult {
	IsExpandable: boolean;
	Id: string;
	Name: string;
	Value: string;
	Kind: string;
}

export interface IDebugVariable {
	variables: IRubyEvaluationResult[];
	evaluateChildren?: Boolean;
}

export interface ICommand {
	command: string;
	resolve: (value?: any) => void
	reject: (error?: any) => void
}
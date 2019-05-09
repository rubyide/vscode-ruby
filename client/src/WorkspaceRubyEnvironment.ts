import {
	ClientCapabilities,
	LanguageClient,
	RequestType,
	StaticFeature,
	InitializeParams,
} from 'vscode-languageclient';
import { Uri, workspace, WorkspaceFolder } from 'vscode';
import { loadEnv, IEnvironment } from './util/env';

interface WorkspaceRubyEnvironmentParams {
	readonly folders: string[];
}

interface WorkspaceRubyEnvironmentResult {
	[key: string]: IEnvironment;
}

namespace WorkspaceRubyEnvironmentRequest {
	export const type = new RequestType<
		WorkspaceRubyEnvironmentParams,
		WorkspaceRubyEnvironmentResult,
		void,
		true
	>('workspace/rubyEnvironment');
}

type WorkspaceRubyEnvironmentCapability = {
	workspace?: {
		rubyEnvironment?: boolean;
	};
};

type ClientCapabilitiesWithRubyEnvironment = ClientCapabilities &
	WorkspaceRubyEnvironmentCapability;

export enum NodeRuntime {
	Electron = 1,
	Node = 2
}

export class WorkspaceRubyEnvironmentFeature implements StaticFeature {
	constructor(private client: LanguageClient, private runtime: NodeRuntime) { }

	public fillInitializeParams(params: InitializeParams): void {
		params.initializationOptions = params.initializationOptions || {};
		params.initializationOptions.runtime = this.runtime;
	}

	public fillClientCapabilities(capabilities: ClientCapabilitiesWithRubyEnvironment): void {
		capabilities.workspace = capabilities.workspace || {};
		capabilities.workspace!.rubyEnvironment = true;
	}

	public initialize(): void {
		this.client.onRequest(
			WorkspaceRubyEnvironmentRequest.type,
			async (params: WorkspaceRubyEnvironmentParams): Promise<WorkspaceRubyEnvironmentResult> => {
				const environments: WorkspaceRubyEnvironmentResult = {};

				for (const uri of params.folders) {
					const workspaceFolder: WorkspaceFolder = workspace.getWorkspaceFolder(Uri.parse(uri));

					if (workspaceFolder && workspaceFolder.uri.fsPath) {
						environments[uri] = await loadEnv(workspaceFolder.uri.fsPath);
					}
				}

				return environments;
			}
		);
	}
}

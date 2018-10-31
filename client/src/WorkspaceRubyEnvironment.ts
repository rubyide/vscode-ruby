import {
	ClientCapabilities,
	LanguageClient,
	RequestType,
	StaticFeature,
} from 'vscode-languageclient';
import { Uri, workspace, WorkspaceFolder } from 'vscode';
import { loadEnv, RubyEnvironment } from './util/env';

interface WorkspaceRubyEnvironmentParams {
	readonly folders: string[];
}

interface WorkspaceRubyEnvironmentResult {
	[key: string]: RubyEnvironment;
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

export class WorkspaceRubyEnvironmentFeature implements StaticFeature {
	constructor(private client: LanguageClient) {}

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

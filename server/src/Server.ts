import {
	Connection,
	InitializeParams,
	InitializeResult,
	RequestType,
} from 'vscode-languageserver';

import { CapabilityCalculator } from './CapabilityCalculator';
import { Forest } from './Forest';
import DocumentHighlightProvider from './providers/DocumentHighlightProvider';
import FoldingRangeProvider from './providers/FoldingRangeProvider';
import ConfigurationProvider from './providers/ConfigurationProvider';
import TextDocumentProvider from './providers/TextDocumentProvider';
import WorkspaceProvider from './providers/WorkspaceProvider';

import { documents } from './DocumentManager';
import {
	documentConfigurationCache,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
	RubyEnvironment,
} from './SettingsCache';
export interface ILanguageServer {
	readonly capabilities: InitializeResult;
	registerInitializeProviders();
	registerInitializedProviders();
}

interface WorkspaceRubyEnvironmentParams {
	readonly folders: string[];
}

interface WorkspaceRubyEnvironmentResult {
	readonly [key: string]: RubyEnvironment;
}

namespace WorkspaceRubyEnvironmentRequest {
	export const type = new RequestType<
		WorkspaceRubyEnvironmentParams,
		WorkspaceRubyEnvironmentResult,
		void,
		true
	>('workspace/rubyEnvironment');
}

export class Server implements ILanguageServer {
	public connection: Connection;
	private calculator: CapabilityCalculator;
	private forest: Forest;

	constructor(connection: Connection, params: InitializeParams) {
		this.connection = connection;
		this.calculator = new CapabilityCalculator(params.capabilities);

		documents.listen(connection);

		if (this.calculator.clientCapabilities.workspace.rubyEnvironment) {
			workspaceRubyEnvironmentCache.fetcher = async (
				folders: string[]
			): Promise<RubyEnvironment[]> => {
				const result: WorkspaceRubyEnvironmentResult = await this.connection.sendRequest(
					WorkspaceRubyEnvironmentRequest.type,
					{
						folders,
					}
				);

				return Object.values(result);
			};
		} else {
			workspaceRubyEnvironmentCache.fetcher = async (
				folders: string[]
			): Promise<RubyEnvironment[]> => {
				return folders.map(_f => process.env as RubyEnvironment);
			};
		}
	}

	get capabilities(): InitializeResult {
		return {
			capabilities: this.calculator.capabilities,
		};
	}

	// registers providers on the initialize step
	public registerInitializeProviders(): void {
		// Handles highlight requests
		DocumentHighlightProvider.register(this.connection, this.forest);

		// Handles folding requests
		FoldingRangeProvider.register(this.connection, this.forest);

		// Handles text document changes and will delegate to other providers that need these events
		TextDocumentProvider.register(this.connection, this.forest);
	}

	// registers providers on the initialized step
	public registerInitializedProviders(): void {
		// Handles configuration changes
		ConfigurationProvider.register(this.connection, this.forest);

		// Handle workspace changes
		WorkspaceProvider.register(this.connection, this.forest);
	}
}

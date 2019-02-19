import {
	ConfigurationItem,
	Connection,
	InitializeParams,
	InitializeResult,
	RequestType,
} from 'vscode-languageserver';

import { CapabilityCalculator } from './CapabilityCalculator';
import DocumentHighlightProvider from './providers/DocumentHighlightProvider';
import FoldingRangeProvider from './providers/FoldingRangeProvider';
import ConfigurationProvider from './providers/ConfigurationProvider';
import WorkspaceProvider from './providers/WorkspaceProvider';
import DocumentSymbolProvider from './providers/DocumentSymbolProvider';

import { documents } from './DocumentManager';
import { LintResult, linter } from './Linter';

import {
	documentConfigurationCache,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
	RubyEnvironment,
} from './SettingsCache';
import DocumentFormattingProvider from './providers/DocumentFormattingProvider';

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

	constructor(connection: Connection, params: InitializeParams) {
		this.connection = connection;
		this.calculator = new CapabilityCalculator(params.capabilities);

		documents.listen(connection);

		linter.subscribe({
			next: (result: LintResult) => {
				connection.sendDiagnostics({ uri: result.document.uri, diagnostics: result.diagnostics });
			},
		});

		documentConfigurationCache.fetcher = async (
			targets: string[]
		): Promise<RubyConfiguration[]> => {
			const items: ConfigurationItem[] = targets.map(t => {
				return {
					scopeUri: t,
					section: 'ruby',
				};
			});
			return this.connection.workspace.getConfiguration(items);
		};

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
		DocumentHighlightProvider.register(this.connection);

		// Handles folding requests
		FoldingRangeProvider.register(this.connection);

		// Handles document symbol requests
		DocumentSymbolProvider.register(this.connection);

		// Handles document formatting requests
		DocumentFormattingProvider.register(this.connection);
	}

	// registers providers on the initialized step
	public registerInitializedProviders(): void {
		// Handles configuration changes
		ConfigurationProvider.register(this.connection);

		// Handle workspace changes
		WorkspaceProvider.register(this.connection);
	}
}

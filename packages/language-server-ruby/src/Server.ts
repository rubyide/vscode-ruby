import {
	ConfigurationItem,
	Connection,
	InitializeParams,
	InitializeResult,
} from 'vscode-languageserver';
import log from 'loglevel';

import { CapabilityCalculator } from './CapabilityCalculator';
import DocumentHighlightProvider from './providers/DocumentHighlightProvider';
import FoldingRangeProvider from './providers/FoldingRangeProvider';
import ConfigurationProvider from './providers/ConfigurationProvider';
import WorkspaceProvider from './providers/WorkspaceProvider';
import DocumentSymbolProvider from './providers/DocumentSymbolProvider';

import { documents } from './DocumentManager';
import { LintResult, linter } from './Linter';

import { documentConfigurationCache, RubyConfiguration } from './SettingsCache';
import DocumentFormattingProvider from './providers/DocumentFormattingProvider';
import { forest } from './Forest';

export interface ILanguageServer {
	readonly capabilities: InitializeResult;
	initialize();
	setup();
	shutdown();
}

export class Server implements ILanguageServer {
	public connection: Connection;
	private calculator: CapabilityCalculator;

	constructor(connection: Connection, params: InitializeParams) {
		this.connection = connection;
		this.calculator = new CapabilityCalculator(params.capabilities);

		documents.listen(connection);

		linter.subscribe({
			next: (result: LintResult): void => {
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
	}

	get capabilities(): InitializeResult {
		return {
			capabilities: this.calculator.capabilities,
		};
	}

	/**
	 * Initialize should be run during the initialization phase of the client connection
	 */
	public initialize(): void {
		this.registerInitializeProviders();
	}

	/**
	 * Setup should be run after the client connection has been initialized. We can do things here like
	 * handle changes to the workspace and query configuration settings
	 */
	public setup(): void {
		this.registerInitializedProviders();
		this.loadGlobalConfig();
	}

	public shutdown(): void {
		forest.release();
	}

	// registers providers on the initialize step
	private registerInitializeProviders(): void {
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
	private registerInitializedProviders(): void {
		// Handle workspace changes
		WorkspaceProvider.register(this.connection);

		// Handle configuration change notifications
		if (this.calculator.supportsWorkspaceConfiguration) {
			ConfigurationProvider.register(this.connection, () => {
				this.loadGlobalConfig();
			});
		}
	}

	/**
	 * Loads configuration from the client and sets up global language server configuration
	 *
	 * Over time we'll use this method to allow users to enable/disable specific features
	 * if they are running this language server alongside another one: eg Solargraph or Sorbet
	 */
	private async loadGlobalConfig(): Promise<void> {
		const config: RubyConfiguration = await this.connection.workspace.getConfiguration('ruby');
		try {
			const { logLevel = 'info' } = config.languageServer;
			log.setLevel(logLevel);
		} catch (e) {
			log.error(e);
		}
	}
}

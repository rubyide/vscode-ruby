import {
	Connection,
	InitializeParams,
	InitializeResult,
	WorkspaceFolder,
} from 'vscode-languageserver';

import { config } from './ServerConfiguration';
import { CapabilityCalculator } from './CapabilityCalculator';
import { Forest } from './Forest';
import DocumentHighlightProvider from './providers/DocumentHighlightProvider';
import FoldingRangeProvider from './providers/FoldingRangeProvider';
import ConfigurationProvider from './providers/ConfigurationProvider';
import TextDocumentProvider from './providers/TextDocumentProvider';
import WorkspaceProvider from './providers/WorkspaceProvider';

export interface ILanguageServer {
	readonly capabilities: InitializeResult;
	registerInitializeProviders();
	registerInitializedProviders();
}

export class Server implements ILanguageServer {
	public connection: Connection;
	private calculator: CapabilityCalculator;
	private forest: Forest;

	constructor(connection: Connection, params: InitializeParams) {
		this.connection = connection;
		this.calculator = new CapabilityCalculator(params.capabilities);
		this.forest = new Forest();
		this.loadWorkspaceEnvironments(params.workspaceFolders);
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

	private async loadWorkspaceEnvironments(folders: WorkspaceFolder[]): Promise<void> {
		const loaders = folders.map(folder => config.loadWorkspaceEnvironment(folder));
		await Promise.all(loaders);
	}
}

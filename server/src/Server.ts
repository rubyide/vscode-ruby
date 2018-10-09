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
import TextDocumentProvider from './providers/TextDocumentProvider';

export interface ILanguageServer {
	readonly capabilities: InitializeResult;
}

export class Server implements ILanguageServer {
	public connection: Connection;
	private calculator: CapabilityCalculator;
	private forest: Forest;

	constructor(connection: Connection, params: InitializeParams) {
		this.connection = connection;
		this.calculator = new CapabilityCalculator(params.capabilities);
		this.forest = new Forest();

		this.registerProviders();
		this.loadWorkspaceEnvironments(params.workspaceFolders);
	}

	get capabilities(): InitializeResult {
		return {
			capabilities: this.calculator.capabilities,
		};
	}

	private registerProviders(): void {
		DocumentHighlightProvider.register(this.connection, this.forest);
		FoldingRangeProvider.register(this.connection, this.forest);
		// Handles text document changes and will delegate to other providers that need these events
		TextDocumentProvider.register(this.connection, this.forest);
	}

	private async loadWorkspaceEnvironments(folders: WorkspaceFolder[]): Promise<void> {
		const loaders = folders.map(folder => config.loadWorkspaceEnvironment(folder));
		await Promise.all(loaders);
	}
}

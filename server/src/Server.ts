import { Connection, InitializeParams, InitializeResult } from 'vscode-languageserver';

import { CapabilityCalculator } from './CapabilityCalculator';
import { Forest } from './Forest';
import ASTProvider from './providers/ASTProvider';
import DocumentHighlightProvider from './providers/DocumentHighlightProvider';
import FoldingRangeProvider from './providers/FoldingRangeProvider';

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
	}

	get capabilities(): InitializeResult {
		return {
			capabilities: this.calculator.capabilities,
		};
	}

	private registerProviders(): void {
		ASTProvider.register(this.connection, this.forest);
		DocumentHighlightProvider.register(this.connection, this.forest);
		FoldingRangeProvider.register(this.connection, this.forest);
	}
}

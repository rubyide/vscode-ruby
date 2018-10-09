import Provider from './Provider';
import ASTProvider from './ASTProvider';
import DiagnosticsProvider from './DiagnosticsProvider';
import {
	IConnection,
	DidChangeTextDocumentParams,
	DidCloseTextDocumentParams,
	DidOpenTextDocumentParams,
} from 'vscode-languageserver';
import { IForest } from '../Forest';

export default class TextDocumentProvider extends Provider {
	private astProvider: ASTProvider;
	private diagnosticsProvider: DiagnosticsProvider;

	static register(connection: IConnection, forest: IForest) {
		return new TextDocumentProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);

		this.astProvider = new ASTProvider(connection, forest);
		this.diagnosticsProvider = new DiagnosticsProvider(connection, forest);

		this.connection.onDidOpenTextDocument(this.handleDidOpenTextDocument);
		this.connection.onDidChangeTextDocument(this.handleDidChangeTextDocument);
		this.connection.onDidCloseTextDocument(this.handleCloseTextDocument);
	}

	private handleDidOpenTextDocument = async (params: DidOpenTextDocumentParams): Promise<void> => {
		this.astProvider.handleOpenTextDocument(params);
		this.diagnosticsProvider.computeDiagnostics(params);
	};

	private handleDidChangeTextDocument = async (
		params: DidChangeTextDocumentParams
	): Promise<void> => {
		this.astProvider.handleChangeTextDocument(params);
		this.diagnosticsProvider.computeDiagnostics(params);
	};

	private handleCloseTextDocument = async (params: DidCloseTextDocumentParams): Promise<void> => {
		this.astProvider.handleCloseTextDocument(params);
	};
}

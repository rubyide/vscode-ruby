import { DocumentSymbol, DocumentSymbolParams, Connection } from 'vscode-languageserver';
import Provider from './Provider';
import { analyses } from '../Analyzer';

export default class DocumentSymbolProvider extends Provider {
	static register(connection: Connection): DocumentSymbolProvider {
		return new DocumentSymbolProvider(connection);
	}

	constructor(connection: Connection) {
		super(connection);
		this.connection.onDocumentSymbol(this.handleDocumentSymbol);
	}

	private handleDocumentSymbol = async (
		params: DocumentSymbolParams
	): Promise<DocumentSymbol[]> => {
		const {
			textDocument: { uri },
		} = params;
		const analysis = analyses.getAnalysis(uri);
		return analysis.documentSymbols;
	};
}

import { DocumentSymbol, DocumentSymbolParams, IConnection } from 'vscode-languageserver';
import Provider from './Provider';
import { analyses } from '../Analyzer';

export default class DocumentSymbolProvider extends Provider {
	static register(connection: IConnection) {
		return new DocumentSymbolProvider(connection);
	}

	constructor(connection: IConnection) {
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
		console.log(JSON.stringify(analysis.documentSymbols));
		return analysis.documentSymbols;
	};
}

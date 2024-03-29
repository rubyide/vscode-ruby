/*
 * DocumentHighlightProvider
 *
 * Super basic highlight provider
 */

import { DocumentHighlight, Connection, TextDocumentPositionParams } from 'vscode-languageserver';
import Position from '../util/Position';
import Provider from './Provider';
import DocumentHighlightAnalyzer from '../analyzers/DocumentHighlightAnalyzer';

// TODO support more highlight use cases than just balanced pairs

export default class DocumentHighlightProvider extends Provider {
	static register(connection: Connection): DocumentHighlightProvider {
		return new DocumentHighlightProvider(connection);
	}

	constructor(connection: Connection) {
		super(connection);
		this.connection.onDocumentHighlight(this.handleDocumentHighlight);
	}

	protected handleDocumentHighlight = async (
		params: TextDocumentPositionParams
	): Promise<DocumentHighlight[]> => {
		const position: Position = Position.fromVSPosition(params.position);
		const {
			textDocument: { uri },
		} = params;
		return DocumentHighlightAnalyzer.analyze(uri, position);
	};
}

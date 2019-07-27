import {
	IConnection,
	DocumentFormattingParams,
	DocumentRangeFormattingParams,
	TextEdit,
} from 'vscode-languageserver';
import Provider from './Provider';
import Formatter from '../Formatter';

export default class DocumentFormattingProvider extends Provider {
	static register(connection: IConnection) {
		return new DocumentFormattingProvider(connection);
	}

	constructor(connection: IConnection) {
		super(connection);
		this.connection.onDocumentFormatting(this.handleDocumentFormattingRequest);
		this.connection.onDocumentRangeFormatting(this.handleDocumentRangeFormattingRequest);
	}

	private handleDocumentFormattingRequest = async (
		params: DocumentFormattingParams
	): Promise<TextEdit[]> => {
		const { textDocument } = params;

		return Formatter.format(textDocument).toPromise();
	};

	private handleDocumentRangeFormattingRequest = async (
		params: DocumentRangeFormattingParams
	): Promise<TextEdit[]> => {
		const { textDocument, range } = params;

		return Formatter.format(textDocument, range).toPromise();
	};
}

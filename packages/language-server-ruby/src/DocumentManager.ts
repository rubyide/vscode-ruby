import { TextDocuments, Connection, TextDocumentIdentifier } from 'vscode-languageserver';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { Subject } from 'rxjs';

export enum DocumentEventKind {
	OPEN,
	CHANGE_CONTENT,
	CLOSE,
}

export interface DocumentEvent {
	kind: DocumentEventKind;
	document: TextDocument;
}

export default class DocumentManager {
	private readonly documents: TextDocuments<TextDocument>;
	public subject: Subject<DocumentEvent>;

	constructor() {
		this.documents = new TextDocuments(TextDocument);
		this.subject = new Subject<DocumentEvent>();

		this.documents.onDidOpen(this.emitDocumentEvent(DocumentEventKind.OPEN));
		this.documents.onDidChangeContent(this.emitDocumentEvent(DocumentEventKind.CHANGE_CONTENT));
		this.documents.onDidClose(this.emitDocumentEvent(DocumentEventKind.CLOSE));
	}

	public get(id: TextDocumentIdentifier | string): TextDocument {
		const docId = typeof id === 'string' ? id : id.uri;
		return this.documents.get(docId);
	}

	public listen(connection: Connection): void {
		this.documents.listen(connection);
	}

	private emitDocumentEvent(kind: DocumentEventKind): ({ document: TextDocument }) => void {
		return ({ document }): void => {
			this.subject.next({
				kind,
				document,
			});
		};
	}
}

export const documents = new DocumentManager();

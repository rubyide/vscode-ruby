/**
 * ASTProvider
 */

import { Document } from 'tree-sitter';
import {
	DidChangeTextDocumentParams,
	DidCloseTextDocumentParams,
	DidOpenTextDocumentParams,
	IConnection,
	TextDocumentIdentifier,
	TextDocumentItem,
	VersionedTextDocumentIdentifier,
} from 'vscode-languageserver';

import { IForest } from '../Forest';
import { Position } from '../Position'

export class ASTProvider {
	private connection: IConnection;
	private forest: IForest;

	constructor(connection: IConnection, forest: IForest) {
		this.connection = connection;
		this.forest = forest;

		this.connection.onDidOpenTextDocument(this.buildTree);
		this.connection.onDidChangeTextDocument(this.updateTree);
		this.connection.onDidCloseTextDocument(this.removeTree);
	}

	protected buildTree = async (params: DidOpenTextDocumentParams): Promise<void> => {
		const document: TextDocumentItem = params.textDocument;
		const ast: Document = this.forest.tree(document.uri);
		ast.setInputString(document.text);
		ast.parse();
	}

	protected updateTree = async (params: DidChangeTextDocumentParams): Promise<void> => {
		const document: VersionedTextDocumentIdentifier = params.textDocument;
		const ast: Document = this.forest.tree(document.uri);
		for (const changeEvent of params.contentChanges) {
			if (changeEvent.range && changeEvent.rangeLength) {
				const {range, rangeLength, text} = changeEvent;
				ast.edit({
					startIndex: range.start.line * range.start.character, // index in old doc the change started
					startPosition: Position.FROM_VS_POSITION(range.start).toTSPosition(), // position in old doc change started
					lengthRemoved: rangeLength, // length removed from old doc
					lengthAdded: text.length, // length added to new doc

					extentRemoved: Position.FROM_VS_POSITION(range.end).toTSPosition(), // position in old doc change ended
					extentAdded: Position.FROM_VS_POSITION(range.end).toTSPosition() // position in new doc change ended
				});
			} else {
				ast.invalidate();
				ast.setInputString(changeEvent.text);
				ast.parse();
			}
		}
	}

	protected removeTree = async (params: DidCloseTextDocumentParams): Promise<void> => {
		const document: TextDocumentIdentifier = params.textDocument;
		this.forest.removeTree(document.uri);
	}
}

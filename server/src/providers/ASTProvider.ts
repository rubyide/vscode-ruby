/**
 * ASTProvider
 */

import Parser, { Point, SyntaxNode, Tree } from 'tree-sitter';
import TreeSitterRuby from 'tree-sitter-ruby';

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
import { Position } from '../Position';
import Provider from './Provider';

export default class ASTProvider extends Provider {
	private parser: Parser;

	static register(connection: IConnection, forest: IForest) {
		return new ASTProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);

		this.parser = new Parser();
		this.parser.setLanguage(TreeSitterRuby);
	}

	public handleOpenTextDocument = async (params: DidOpenTextDocumentParams): Promise<void> => {
		const document: TextDocumentItem = params.textDocument;
		const tree: Tree = this.parser.parse(document.text);
		this.forest.setTree(document.uri, tree);
	};

	public handleChangeTextDocument = async (params: DidChangeTextDocumentParams): Promise<void> => {
		const document: VersionedTextDocumentIdentifier = params.textDocument;
		let tree: Tree = this.forest.getTree(document.uri);
		if (tree !== undefined) {
			for (const changeEvent of params.contentChanges) {
				if (changeEvent.range && changeEvent.rangeLength) {
					// range is range of the change. end is exclusive
					// rangeLength is length of text removed
					// text is new text
					const { range, rangeLength, text } = changeEvent;
					const startIndex: number = range.start.line * range.start.character;
					const oldEndIndex: number = startIndex + rangeLength - 1;
					tree.edit({
						startIndex, // index in old doc the change started
						oldEndIndex, // end index for old version of text
						newEndIndex: range.end.line * range.end.character - 1, // end index for new version of text

						startPosition: Position.FROM_VS_POSITION(range.start).toTSPosition(), // position in old doc change started
						oldEndPosition: this.computeEndPosition(startIndex, oldEndIndex, tree), // position in old doc change ended.
						newEndPosition: Position.FROM_VS_POSITION(range.end).toTSPosition(), // position in new doc change ended
					});
					tree = this.parser.parse(text, tree);
				} else {
					tree = this.buildTree(changeEvent.text);
				}
			}
		}

		this.forest.setTree(document.uri, tree);
	};

	public handleCloseTextDocument = async (params: DidCloseTextDocumentParams): Promise<void> => {
		const document: TextDocumentIdentifier = params.textDocument;
		this.forest.removeTree(document.uri);
	};

	private buildTree = (text: string): Tree => {
		return this.parser.parse(text);
	};

	private computeEndPosition = (startIndex: number, endIndex: number, tree: Tree): Point => {
		// TODO handle case where this method call fails for whatever reason
		const node: SyntaxNode = tree.rootNode.descendantForIndex(startIndex, endIndex);

		return node.endPosition;
	};
}

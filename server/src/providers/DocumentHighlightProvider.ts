/*
 * DocumentHighlightProvider
 *
 * Super basic highlight provider
 */

import { ASTNode, Document } from 'tree-sitter';
import {DocumentHighlight, DocumentHighlightKind, IConnection, Range, TextDocumentPositionParams} from 'vscode-languageserver';
import { IForest } from '../Forest';
import { Position } from '../Position'

export class DocumentHighlightProvider {
	private readonly BEGIN_TYPES: Set<string> = new Set(['begin', 'def', 'if', 'case', 'unless', 'do', 'class', 'module']);

	private connection: IConnection;
	private forest: IForest;

	constructor(connection: IConnection, forest: IForest) {
		this.connection = connection;
		this.forest = forest;

		this.connection.onDocumentHighlight(this.handleDocumentHighlight);
	}

	protected handleDocumentHighlight = async (textDocumentPosition: TextDocumentPositionParams): Promise<DocumentHighlight[]> => {
		const ast: Document = this.forest.tree(textDocumentPosition.textDocument.uri);
		const rootNode: ASTNode = ast.rootNode;
		const position: Position = Position.FROM_VS_POSITION(textDocumentPosition.position);
		const node: ASTNode = rootNode.descendantForPosition(position.toTSPosition());

		return this.computeHighlights(node);
	}

	private computeHighlights(node: ASTNode): DocumentHighlight[] {
		let highlights: DocumentHighlight[] = [];

		if (node.type === 'end') {
			highlights = highlights.concat(this.computeEndHighlight(node));
		}
		if (!node.isNamed && this.BEGIN_TYPES.has(node.type)) {
			highlights = highlights.concat(this.computeBeginHighlight(node));
		}

		return highlights;
	}

	private computeBeginHighlight(node: ASTNode): DocumentHighlight[] {
		const endNode: ASTNode = node.parent.lastChild;

		return [
			DocumentHighlight.create(
				Range.create(
					Position.FROM_TS_POSITION(node.startPosition).toVSPosition(),
					Position.FROM_TS_POSITION(node.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
			DocumentHighlight.create(
				Range.create(
					Position.FROM_TS_POSITION(endNode.startPosition).toVSPosition(),
					Position.FROM_TS_POSITION(endNode.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			)
		];
	}

	private computeEndHighlight(node: ASTNode): DocumentHighlight[] {
		const startNode: ASTNode = node.parent.firstChild;

		return [
			DocumentHighlight.create(
				Range.create(
					Position.FROM_TS_POSITION(startNode.startPosition).toVSPosition(),
					Position.FROM_TS_POSITION(startNode.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
			DocumentHighlight.create(
				Range.create(
					Position.FROM_TS_POSITION(node.startPosition).toVSPosition(),
					Position.FROM_TS_POSITION(node.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			)
		];
	}
}
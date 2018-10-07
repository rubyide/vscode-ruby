/*
 * DocumentHighlightProvider
 *
 * Super basic highlight provider
 */

import { SyntaxNode, Tree } from 'tree-sitter';
import {
	DocumentHighlight,
	DocumentHighlightKind,
	IConnection,
	Range,
	TextDocumentPositionParams,
} from 'vscode-languageserver';
import { IForest } from '../Forest';
import { Position } from '../Position';
import Provider from './Provider';

// TODO support more highlight use cases than just balanced pairs

export default class DocumentHighlightProvider extends Provider {
	private readonly BEGIN_TYPES: Set<string> = new Set([
		'begin',
		'def',
		'if',
		'case',
		'unless',
		'do',
		'class',
		'module',
	]);

	static register(connection: IConnection, forest: IForest) {
		return new DocumentHighlightProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);

		this.connection.onDocumentHighlight(this.handleDocumentHighlight);
	}

	protected handleDocumentHighlight = async (
		textDocumentPosition: TextDocumentPositionParams
	): Promise<DocumentHighlight[]> => {
		const tree: Tree = this.forest.getTree(textDocumentPosition.textDocument.uri);
		const rootNode: SyntaxNode = tree.rootNode;
		const position: Position = Position.FROM_VS_POSITION(textDocumentPosition.position);
		const node: SyntaxNode = rootNode.descendantForPosition(position.toTSPosition());

		return this.computeHighlights(node);
	};

	private computeHighlights(node: SyntaxNode): DocumentHighlight[] {
		let highlights: DocumentHighlight[] = [];

		if (node.type === 'end') {
			highlights = highlights.concat(this.computeEndHighlight(node));
		}
		if (!node.isNamed && this.BEGIN_TYPES.has(node.type)) {
			highlights = highlights.concat(this.computeBeginHighlight(node));
		}

		return highlights;
	}

	private computeBeginHighlight(node: SyntaxNode): DocumentHighlight[] {
		const endNode: SyntaxNode = node.parent.lastChild;

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
			),
		];
	}

	private computeEndHighlight(node: SyntaxNode): DocumentHighlight[] {
		const startNode: SyntaxNode = node.parent.firstChild;

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
			),
		];
	}
}

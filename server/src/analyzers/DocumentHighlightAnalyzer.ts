import { DocumentHighlight, DocumentHighlightKind, Range } from 'vscode-languageserver';
import { SyntaxNode, Tree } from 'tree-sitter';
import Position from '../util/Position';
import { forest } from '../Forest';

export default class DocumentHighlightAnalyzer {
	private static readonly BEGIN_TYPES: Set<string> = new Set([
		'begin',
		'def',
		'if',
		'case',
		'unless',
		'do',
		'class',
		'module',
	]);

	public static async analyze(uri: string, position: Position): Promise<DocumentHighlight[]> {
		const tree: Tree = forest.getTree(uri);

		return this.computeHighlights(tree, position);
	}

	private static computeHighlights(tree: Tree, position: Position): DocumentHighlight[] {
		const rootNode: SyntaxNode = tree.rootNode;
		const node: SyntaxNode = rootNode.descendantForPosition(position.toTSPosition());
		let highlights: DocumentHighlight[] = [];
		if (node.type === 'end') {
			highlights = highlights.concat(this.computeEndHighlight(node));
		}
		if (!node.isNamed && this.BEGIN_TYPES.has(node.type)) {
			highlights = highlights.concat(this.computeBeginHighlight(node));
		}
		return highlights;
	}

	private static computeBeginHighlight(node: SyntaxNode): DocumentHighlight[] {
		const endNode: SyntaxNode = node.parent.lastChild;
		return [
			DocumentHighlight.create(
				Range.create(
					Position.fromTSPosition(node.startPosition).toVSPosition(),
					Position.fromTSPosition(node.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
			DocumentHighlight.create(
				Range.create(
					Position.fromTSPosition(endNode.startPosition).toVSPosition(),
					Position.fromTSPosition(endNode.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
		];
	}
	private static computeEndHighlight(node: SyntaxNode): DocumentHighlight[] {
		const startNode: SyntaxNode = node.parent.firstChild;
		return [
			DocumentHighlight.create(
				Range.create(
					Position.fromTSPosition(startNode.startPosition).toVSPosition(),
					Position.fromTSPosition(startNode.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
			DocumentHighlight.create(
				Range.create(
					Position.fromTSPosition(node.startPosition).toVSPosition(),
					Position.fromTSPosition(node.endPosition).toVSPosition()
				),
				DocumentHighlightKind.Text
			),
		];
	}
}

/*
 * FoldingProvider
 *
 * Super basic highlight provider
 */

import { SyntaxNode, Tree } from 'tree-sitter';
import {
	FoldingRange,
	FoldingRangeKind,
	FoldingRangeRequest,
	FoldingRangeRequestParam,
	IConnection,
} from 'vscode-languageserver';
import { IForest } from '../Forest';

export class FoldingRangeProvider {
	private connection: IConnection;
	private forest: IForest;
	private readonly FOLD_CONSTRUCTS: Set<string> = new Set([
		'begin',
		'def',
		'if',
		'case',
		'unless',
		'do',
		'class',
		'module',
	]);

	constructor(connection: IConnection, forest: IForest) {
		this.connection = connection;
		this.forest = forest;

		this.connection.onRequest(FoldingRangeRequest.type, this.handleFoldingRange);
	}

	protected handleFoldingRange = async (
		param: FoldingRangeRequestParam
	): Promise<FoldingRange[]> => {
		this.connection.console.log('Fold request!');
		const folds: FoldingRange[] = [];

		const tree: Tree = this.forest.getTree(param.textDocument.uri);

		const traverse: (node: SyntaxNode) => void = (node: SyntaxNode): void => {
			if (!node.isNamed && this.FOLD_CONSTRUCTS.has(node.type)) {
				const endNode: SyntaxNode = node.parent.lastChild;
				folds.push({
					startLine: node.startPosition.row,
					startCharacter: node.startPosition.column,
					endLine: endNode.endPosition.row,
					endCharacter: node.endPosition.column,
					kind: FoldingRangeKind.Region,
				});
			}
			for (const childNode of node.children) {
				traverse(childNode);
			}
		};
		traverse(tree.rootNode);

		return folds;
	};
}

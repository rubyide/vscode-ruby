import { FoldingRange, FoldingRangeKind } from 'vscode-languageserver';
import { SyntaxNode } from 'tree-sitter';
import BaseAnalyzer from './BaseAnalyzer';

interface IFoldHeuristic {
	start?: {
		row?: number;
		column?: number;
	};
	end?: {
		row?: number;
		column?: number;
	};
}

class FoldHeuristic {
	private heuristic: IFoldHeuristic;
	private readonly defaultHeuristic = {
		row: 0,
		column: 0,
	};

	constructor(heuristic = {}) {
		this.heuristic = heuristic;
	}

	get start() {
		return {
			...this.defaultHeuristic,
			...this.heuristic.start,
		};
	}

	get end() {
		return {
			...this.defaultHeuristic,
			...this.heuristic.end,
		};
	}
}

export default class FoldingRangeAnalyzer extends BaseAnalyzer<FoldingRange> {
	private FOLD_NODES: Map<string, FoldHeuristic> = new Map([
		[
			'array',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		['block', new FoldHeuristic()],
		[
			'case',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		[
			'class',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		['comment', new FoldHeuristic()],
		[
			'begin',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		['do_block', new FoldHeuristic()],
		[
			'hash',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		[
			'heredoc_body',
			new FoldHeuristic({
				start: {
					row: -1,
				},
				end: {
					row: -1,
				},
			}),
		],
		['then', new FoldHeuristic()], // body of an if and unless statement
		['else', new FoldHeuristic()],
		[
			'method',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		[
			'module',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		[
			'singleton_method',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
	]);
	private lastNodeAnalyzed: SyntaxNode;

	get foldingRanges() {
		return this.diagnostics;
	}

	public analyze(node: SyntaxNode): void {
		if (this.FOLD_NODES.has(node.type)) {
			const heuristic: IFoldHeuristic = this.FOLD_NODES.get(node.type);
			if (this.determineImplicitBlock(node, this.lastNodeAnalyzed) && this.diagnostics.length > 0) {
				const foldingRange: FoldingRange = this.diagnostics[this.diagnostics.length - 1];
				foldingRange.endLine = node.endPosition.row;
				foldingRange.endCharacter = node.endPosition.column;
			} else {
				this.diagnostics.push({
					startLine: node.startPosition.row + heuristic.start.row,
					startCharacter: node.startPosition.column + heuristic.start.column,
					endLine: node.endPosition.row + heuristic.end.row,
					endCharacter: node.endPosition.column + heuristic.end.column,
					kind: this.getFoldKind(node.type),
				});
			}
			this.lastNodeAnalyzed = node;
		}
	}

	private getFoldKind(nodeType: string): FoldingRangeKind {
		switch (nodeType) {
			case 'comment':
				return FoldingRangeKind.Comment;
			case 'require':
				return FoldingRangeKind.Imports;
			default:
				return FoldingRangeKind.Region;
		}
	}

	private determineImplicitBlock(node: SyntaxNode, lastNode: SyntaxNode): boolean {
		return (
			node.type === 'comment' &&
			node.text[0] === '#' &&
			lastNode &&
			lastNode.type === 'comment' &&
			lastNode.text[0] === '#'
		);
	}
}

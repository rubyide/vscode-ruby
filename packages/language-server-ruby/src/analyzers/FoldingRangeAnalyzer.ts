import { FoldingRange, FoldingRangeKind } from 'vscode-languageserver';
import Parser, { Query, SyntaxNode } from 'web-tree-sitter';
import BaseAnalyzer from './BaseAnalyzer';
import FOLDS_QUERY from './queries/folds';

interface IFoldLocation {
	row?: number;
	column?: number;
}

interface IFoldHeuristic {
	start?: IFoldLocation;
	end?: IFoldLocation;
}

export class FoldHeuristic {
	private readonly heuristic: IFoldHeuristic;
	private readonly defaultHeuristic = {
		row: 0,
		column: 0,
	};

	constructor(heuristic = {}) {
		this.heuristic = heuristic;
	}

	get start(): IFoldLocation {
		return {
			...this.defaultHeuristic,
			...this.heuristic.start,
		};
	}

	get end(): IFoldLocation {
		return {
			...this.defaultHeuristic,
			...this.heuristic.end,
		};
	}
}

/**
 * This is an analyzer for determining fold regions for VSCode
 *
 * The FOLD_NODES map is used to offset the tree-sitter end points to make sure
 * keywords like "end" are not folded. This works similarly to the way {} are folded
 * for languages like JavaScript in VSCode
 */

export default class FoldingRangeAnalyzer extends BaseAnalyzer<FoldingRange> {
	private readonly tsQuery: Query;

	constructor(language: Parser.Language) {
		super();
		this.tsQuery = language.query(FOLDS_QUERY);
	}

	private readonly FOLD_NODES: Map<string, FoldHeuristic> = new Map([
		[
			'array',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
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
		[
			'begin',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
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
				end: {
					row: -1,
				},
			}),
		],
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
		[
			'if',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
		[
			'unless',
			new FoldHeuristic({
				end: {
					row: -1,
				},
			}),
		],
	]);

	// Used to build "implicit blocks", such as a block comment
	// made up of multiple lines of # style comments
	private lastNodeAnalyzed: SyntaxNode;

	get foldingRanges(): FoldingRange[] {
		return this.diagnostics;
	}

	public analyze(node: SyntaxNode): void {
		const captures = this.tsQuery.captures(node);
		for (const capture of captures) {
			const { name, node } = capture;

			// The tree-sitter query captures the call and the identifier nodes
			// just skip the named identifier node
			if (name === 'require') continue;

			// eslint-disable-next-line @typescript-eslint/strict-boolean-expressions
			const heuristic: IFoldHeuristic = this.FOLD_NODES.get(node.type) || new FoldHeuristic();
			if (this.determineImplicitBlock(node, this.lastNodeAnalyzed) && this.diagnostics.length > 0) {
				const foldingRange: FoldingRange = this.diagnostics[this.diagnostics.length - 1];
				foldingRange.endLine = node.endPosition.row;
				foldingRange.endCharacter = node.endPosition.column;
			} else {
				const foldingRange: FoldingRange = {
					startLine: node.startPosition.row + heuristic.start.row,
					startCharacter: node.startPosition.column + heuristic.start.column,
					endLine: node.endPosition.row + heuristic.end.row,
					endCharacter: node.endPosition.column + heuristic.end.column,
					kind: this.getFoldKind(node.type),
				};

				// handle shortening a fold for nested nodes
				if (node.type === 'begin') {
					this.handleNestedNode(node, 'rescue', foldingRange);
				} else if (node.type === 'if') {
					this.handleNestedNode(node, 'else', foldingRange);
				}

				this.diagnostics.push(foldingRange);
			}
			this.lastNodeAnalyzed = node;
		}
	}

	private getFoldKind(nodeType: string): FoldingRangeKind {
		switch (nodeType) {
			case 'comment':
				return FoldingRangeKind.Comment;
			case 'call':
				return FoldingRangeKind.Imports;
			default:
				return FoldingRangeKind.Region;
		}
	}

	private handleNestedNode(node: SyntaxNode, nodeType: string, range: FoldingRange): void {
		const descendants = node.descendantsOfType(nodeType);
		if (descendants.length > 0) {
			const {
				startPosition: { row },
			} = descendants[0];
			range.endLine = row - 1;
			delete range.endCharacter;
		}
	}

	/**
	 * Tree Sitter does not identify block comments as blocks. This will collect them together
	 * into one fold
	 */
	private determineImplicitBlock(node: SyntaxNode, lastNode: SyntaxNode): boolean {
		return (
			lastNode !== undefined &&
			((node.type === 'comment' &&
				node.text[0] === '#' &&
				lastNode.type === 'comment' &&
				lastNode.text[0] === '#') ||
				(node.type === 'call' &&
					node.text.indexOf('require') === 0 &&
					lastNode.type === 'call' &&
					lastNode.text.indexOf('require') === 0))
		);
	}
}

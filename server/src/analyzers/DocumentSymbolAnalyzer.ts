import { DocumentSymbol } from 'vscode-languageserver';
import { SyntaxNode } from 'tree-sitter';
import BaseAnalyzer from './BaseAnalyzer';
import { Position, Stack } from '../util';
import RubyDocumentSymbol, { isWrapper } from '../util/RubyDocumentSymbol';

export default class DocumentSymbolAnalyzer extends BaseAnalyzer<DocumentSymbol> {
	private symbolStack: Stack<DocumentSymbol>;
	private nodeStack: Stack<SyntaxNode>;

	constructor() {
		super();
		this.symbolStack = new Stack();
		this.nodeStack = new Stack();
	}

	get symbols() {
		return this.diagnostics;
	}

	public analyze(node: SyntaxNode): void {
		const symbol = RubyDocumentSymbol.build(node);

		if (symbol) {
			// empty nodeStack means we are at document root
			if (this.nodeStack.empty()) {
				this.diagnostics = this.diagnostics.concat(symbol);
			} else {
				const topSymbol = this.symbolStack.peek();
				topSymbol.children = topSymbol.children.concat(symbol);
			}
		}

		// Stack management
		if (isWrapper(node) && symbol && !Array.isArray(symbol)) {
			this.symbolStack.push(symbol);
			this.nodeStack.push(node);
		} else if (
			!this.nodeStack.empty() &&
			Position.tsPositionIsEqual(this.nodeStack.peek().endPosition, node.endPosition)
		) {
			this.nodeStack.pop();
			this.symbolStack.pop();
		}
	}
}

import { DocumentSymbol, Range, SymbolKind } from 'vscode-languageserver';
import { SyntaxNode } from 'tree-sitter';
import Position from './Position';

const SYMBOLKINDS = {
	method: SymbolKind.Method,
	class: SymbolKind.Class,
	module: SymbolKind.Module,
	assignment: SymbolKind.Constant,
	method_call: SymbolKind.Property,
};

const IDENTIFIER_NODES = {
	module: 'constant',
	class: 'constant',
	method: 'identifier',
	assignment: 'constant',
	method_call: 'identifier',
};

export function isWrapper(node: SyntaxNode): boolean {
	return IDENTIFIER_NODES.hasOwnProperty(node.type);
}

export default class RubyDocumentSymbol {
	static build(node: SyntaxNode): DocumentSymbol | DocumentSymbol[] | void {
		const symbolKind = SYMBOLKINDS[node.type];
		if (!symbolKind) return;

		let symbol = new DocumentSymbol();
		symbol.range = Range.create(
			Position.fromTSPosition(node.startPosition).toVSPosition(),
			Position.fromTSPosition(node.endPosition).toVSPosition()
		);
		symbol.kind = symbolKind;

		if (isWrapper(node)) {
			if (!node.childCount) return;
			const identifierNode = node.descendantsOfType(IDENTIFIER_NODES[node.type])[0];
			if (identifierNode) {
				symbol.children = [];
				symbol.name = identifierNode.text;
				if (symbol.name === 'initialize') {
					symbol.kind = SymbolKind.Constructor;
				}

				// detect attr_ method calls
				if (symbol.name.indexOf('attr_') === 0) {
					const argumentList = node.descendantsOfType('argument_list')[0];
					const symbols = [];
					for (const child of argumentList.children) {
						if (!child.isNamed) continue;
						const newSymbol = {
							...symbol,
						};
						newSymbol.name = child.text[0] === ':' ? child.text.substring(1) : child.text;
						newSymbol.selectionRange = Range.create(
							Position.fromTSPosition(child.startPosition).toVSPosition(),
							Position.fromTSPosition(child.endPosition).toVSPosition()
						);

						symbols.push(newSymbol);
					}

					return symbols;
				} else if (node.type !== 'method_call') {
					symbol.selectionRange = Range.create(
						Position.fromTSPosition(identifierNode.startPosition).toVSPosition(),
						Position.fromTSPosition(identifierNode.endPosition).toVSPosition()
					);
				} else {
					return;
				}
			} else {
				return;
			}
		} else {
			symbol.selectionRange = symbol.range;
			symbol.name = node.text;
		}

		return symbol;
	}
}

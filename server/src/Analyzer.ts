import { DocumentSymbol, FoldingRange } from 'vscode-languageserver';
import { Observer } from 'rxjs';
import { map } from 'rxjs/operators';
import { Tree, SyntaxNode } from 'tree-sitter';
import DocumentSymbolAnalyzer from './analyzers/DocumentSymbolAnalyzer';
import { forestStream, ForestEventKind } from './Forest';
import FoldingRangeAnalyzer from './analyzers/FoldingRangeAnalyzer';

type Analysis = {
	uri: string;
	foldingRanges?: FoldingRange[];
	documentSymbols?: DocumentSymbol[];
};

class Analyzer {
	private foldingRangeAnalyzer: FoldingRangeAnalyzer;
	private documentSymbolAnalyzer: DocumentSymbolAnalyzer;

	constructor(public uri: string) {
		this.foldingRangeAnalyzer = new FoldingRangeAnalyzer();
		this.documentSymbolAnalyzer = new DocumentSymbolAnalyzer();
	}

	get analysis() {
		return {
			uri: this.uri,
			foldingRanges: this.foldingRangeAnalyzer.foldingRanges,
			documentSymbols: this.documentSymbolAnalyzer.symbols,
		};
	}

	public analyze(tree: Tree): Analysis {
		const cursor = tree.walk();
		const walk = depth => {
			this.analyzeNode(cursor.currentNode);
			if (cursor.gotoFirstChild()) {
				do {
					walk(depth + 1);
				} while (cursor.gotoNextSibling());
				cursor.gotoParent();
			}
		};
		walk(0);

		return this.analysis;
	}

	private analyzeNode(node: SyntaxNode): void {
		this.foldingRangeAnalyzer.analyze(node);
		this.documentSymbolAnalyzer.analyze(node);
	}
}

class Analyses implements Observer<Analysis> {
	public closed: boolean;
	private analyses: Map<string, Analysis>;

	constructor() {
		this.closed = false;
		this.analyses = new Map();
	}

	public next(analysis: Analysis): void {
		this.analyses.set(analysis.uri, analysis);
	}

	public error(err: any): void {
		console.log(err);
	}

	public complete(): void {
		this.closed = true;
	}

	public getAnalysis(uri: string): Analysis {
		return this.analyses.get(uri);
	}
}

export const analyses = new Analyses();
forestStream
	.pipe(
		map(
			({ kind, document, tree }): Analysis => {
				if (kind === ForestEventKind.DELETE) {
					return { uri: document.uri };
				} else {
					const analyzer = new Analyzer(document.uri);
					return analyzer.analyze(tree);
				}
			}
		)
	)
	.subscribe(analyses);

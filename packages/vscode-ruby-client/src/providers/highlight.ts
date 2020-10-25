import * as vscode from 'vscode';
import { DocumentSelector, ExtensionContext } from 'vscode';
import * as fs from 'fs';
import * as path from 'path';
import * as vsctm from 'vscode-textmate';
import * as oniguruma from 'vscode-oniguruma';

const pairs = {
	'keyword.control.class.begin.ruby': 'keyword.control.class.end.ruby',
	'keyword.control.module.begin.ruby': 'keyword.control.module.end.ruby',
	'keyword.control.do.begin.ruby': 'keyword.control.do.end.ruby',
	'keyword.control.for.begin.ruby': 'keyword.control.for.end.ruby',
	'keyword.control.begin.begin.ruby': 'keyword.control.begin.end.ruby',
	'keyword.control.conditional.case.begin.ruby': 'keyword.control.conditional.case.end.ruby',
	'keyword.control.conditional.if.begin.ruby': 'keyword.control.conditional.if.end.ruby',
	'keyword.control.conditional.unless.begin.ruby': 'keyword.control.conditional.unless.end.ruby',
	'keyword.control.while.begin.ruby': 'keyword.control.while.end.ruby',
	'keyword.control.until.begin.ruby': 'keyword.control.until.end.ruby',
	'keyword.control.def.begin.ruby': 'keyword.control.def.end.ruby',
};

const entries: string[] = Object.keys(pairs);

const wasmBin = fs.readFileSync(
	path.join(__dirname, '../../node_modules/vscode-oniguruma/release/onig.wasm')
).buffer;

const vscodeOnigurumaLib = oniguruma.loadWASM(wasmBin).then(() => {
	return {
		createOnigScanner(patterns: string[]): oniguruma.OnigScanner {
			return new oniguruma.OnigScanner(patterns);
		},
		createOnigString(s: string): oniguruma.OnigString {
			return new oniguruma.OnigString(s);
		},
	};
});

const registry: vsctm.Registry = new vsctm.Registry({
	onigLib: vscodeOnigurumaLib,
	loadGrammar: (scopeName: string) => {
		if (scopeName === 'source.ruby') {
			let grammarPath: string = path.resolve(
				__dirname,
				'../../../vscode-ruby/syntaxes/',
				'ruby.cson.json'
			);
			return readFile(grammarPath).then(data =>
				vsctm.parseRawGrammar(data.toString(), grammarPath)
			);
		}
		console.log(`Unknown scope name: ${scopeName}`);
		return null;
	},
});

export function registerHighlightProvider(
	ctx: ExtensionContext,
	documentSelector: DocumentSelector
) {
	// highlight provider
	let pairedEnds = [];
	let grammar = null;

	const balancePairs = async function(doc) {
		pairedEnds = [];
		if (doc.languageId !== 'ruby') return;
		let waitingEntries = [];

		if (!grammar) {
			grammar = await registry.loadGrammar('source.ruby');
		}

		let ruleStack = vsctm.INITIAL;
		for (let i = 0; i < doc.lineCount; i++) {
			const line = doc.lineAt(i);

			const lineTokens = grammar.tokenizeLine(line.text, ruleStack);

			for (let j = 0; j < lineTokens.tokens.length; j++) {
				const token = lineTokens.tokens[j];

				let entryScope = token.scopes.find(scope => entries.some(e => e == scope));
				if (entryScope) {
					waitingEntries.push({
						range: new vscode.Range(
							line.lineNumber,
							token.startIndex,
							line.lineNumber,
							token.endIndex
						),
						scope: entryScope,
					});
					continue;
				}

				if (waitingEntries.length) {
					const lastEntryScope = waitingEntries[waitingEntries.length - 1].scope;
					if (token.scopes.find(scope => scope == pairs[lastEntryScope])) {
						pairedEnds.push({
							entry: waitingEntries.pop().range,
							end: new vscode.Range(
								line.lineNumber,
								token.startIndex,
								line.lineNumber,
								token.endIndex
							),
						});
					}
				}
			}
			ruleStack = lineTokens.ruleStack;
		}
	};

	const balanceEvent = function(event) {
		if (event && event.document) balancePairs(event.document);
	};

	ctx.subscriptions.push(
		vscode.languages.registerDocumentHighlightProvider(documentSelector, {
			provideDocumentHighlights: (doc, pos) => {
				let result = pairedEnds.find(
					pair => posWithinRange(pos, pair.entry) || posWithinRange(pos, pair.end)
				);
				if (result) {
					return [
						new vscode.DocumentHighlight(result.entry, 2),
						new vscode.DocumentHighlight(result.end, 2),
					];
				}
			},
		})
	);

	ctx.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(balanceEvent));
	ctx.subscriptions.push(vscode.workspace.onDidChangeTextDocument(balanceEvent));
	ctx.subscriptions.push(vscode.workspace.onDidOpenTextDocument(balancePairs));
	if (vscode.window && vscode.window.activeTextEditor) {
		balancePairs(vscode.window.activeTextEditor.document);
	}
}

function posWithinRange(pos, range) {
	return (
		range.start.line === pos.line &&
		range.start.character <= pos.character &&
		range.end.character >= pos.character
	);
}

function readFile(path) {
	return new Promise((resolve, reject) => {
		fs.readFile(path, (error, data) => (error ? reject(error) : resolve(data)));
	});
}

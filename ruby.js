"use strict";
let vscode = require('vscode');
let linters = require('./lint/lint');
const severities = {
	refactor: vscode.DiagnosticSeverity.Hint,
	convention: vscode.DiagnosticSeverity.Information,
	info: vscode.DiagnosticSeverity.Information,
	warning: vscode.DiagnosticSeverity.Warning,
	error: vscode.DiagnosticSeverity.Error,
	fatal: vscode.DiagnosticSeverity.Error
};
let timer;

function deferReport(uri, lint, diagnostic) {
	if (lint.error) {
		console.log("Linter error:", lint.source, lint.error);
		return;
	}
	if ((!lint.result || !lint.result.length) && (!lint.lintError || !lint.lintError.length)) return;
	let allOf = lint.result.concat(lint.lintError)
		.map(offense => {
			let tail = offense.location.column + offense.location.length;
			let d = new vscode.Diagnostic(new vscode.Range(
					offense.location.line - 1, offense.location.column - 1,
					offense.location.line - 1, tail - 1),
				offense.message, severities[offense.severity] || vscode.DiagnosticSeverity.Error);
			d.source = offense.cop_name || lint.linter;
			return d;
		});
	diagnostic.set(uri, allOf);
}

const langConfig = {
	comments: {
		lineComment: "#",
		blockComment: ["=begin", "=end"]
	},
	brackets: [
		["{", "}"],
		["[", "]"],
		["(", ")"]
	],
	indentationRules: {
		increaseIndentPattern: /^\s*(begin|class|def|else|elsif|ensure|for|if|module|rescue|unless|until|when|while)\b[^\{;]*$/
	},
	wordPattern: /(-?\d+\.\d\w*)|([:]?[^\`\~\@\#\%\^\&\*\(\)\-\=\+\[\{\]\}\\\|\;\:\'\"\,\.\<\>\/\s\!\?]+[\!\?]?)/
};

let pairedEnds = [];

const highligher = {
	provideDocumentHighlights: (doc, pos) => {
		const word = doc.getText(doc.getWordRangeAtPosition(pos));
		let result;
		if (
			(/\b(begin|class|def|for|if|module|unless|until|case|while|do)\b/.test(doc.lineAt(pos.line)
					.text) &&
				pairedEnds.some(pair => (result = (pair.entry.start.line === pos.line) ? pair : null))) ||
			(word === 'end' && pairedEnds.some(pair => (result = (pair.end.start.line === pos.line) ? pair : null)))
		) {
			return [new vscode.DocumentHighlight(result.entry,2), new vscode.DocumentHighlight(result.end,2)];
		}
	}
};

function getEnd(line) {
	//end must be on a line by itself, or followed directly by a dot
	let match = line.text.match(/^(\s*)(end|(end\..*))\s*$/);
	if (match) {
		return new vscode.Range(line.lineNumber, match[1].length, line.lineNumber, match[1].length + 3);
	}
}

function getEntry(line) {
	//only lines that start with the entry
	let match = line.text.match(/^(\s*)(begin|class|def|for|if|module|unless|until|case|while)\b[^\{;]*$/);
	if (match) {
		return new vscode.Range(line.lineNumber, match[1].length, line.lineNumber, match[1].length + match[2].length);
	} else {
		//check for do
		match = line.text.match(/\b(do)\b\s*(\|.*\|[^;]*)?$/);
		if (match) {
			return new vscode.Range(line.lineNumber, match.index, line.lineNumber, match.index + 2);
		}
	}
}

function balancePairs(doc) {
	pairedEnds = [];
	if (doc.languageId !== 'ruby') return;

	let waitingEntries = [];
	let entry, end;
	for (let i = 0; i < doc.lineCount; i++) {
		if ((entry = getEntry(doc.lineAt(i)))) {
			waitingEntries.push(entry);
		} else if (waitingEntries.length && (end = getEnd(doc.lineAt(i)))) {
			pairedEnds.push({
				entry: waitingEntries.pop(),
				end: end
			});
		}
	}
}

function balanceEvent(event) {
	pairedEnds = [];
	if (event && event.document) balancePairs(event.document);
}

function activate(context) {
	//add language config
	vscode.languages.setLanguageConfiguration('ruby', langConfig);

	let activeLinters = {};
	let linterTimers = {};
	let activeDiagnostics = {};

	function changeTrigger(changed) {
		timer = process.hrtime();
		if (!changed || !changed.document) return;
		if (changed.document.languageId !== 'ruby') return;

		const doc = changed.document;
		let lintConfig = vscode.workspace.getConfiguration("ruby.lint");

		if (lintConfig) {
			clearTimeout(linterTimers[doc.fileName]);

			if (activeLinters[doc.fileName]) {
				try {
					activeLinters[doc.fileName].send('stop');
				} catch (e) {}
				delete activeLinters[doc.fileName];
			}
			linterTimers[doc.fileName] = setTimeout(() => {
				activeLinters[doc.fileName] = linters.runCollection(lintConfig, doc.fileName, doc.getText(), result => {
					if (!activeDiagnostics[result.linter]) {
						activeDiagnostics[result.linter] = vscode.languages.createDiagnosticCollection(result.linter);
						context.subscriptions.push(activeDiagnostics[result.linter]);
					}
					activeDiagnostics[result.linter].delete(doc.uri);
					deferReport(doc.uri, result, activeDiagnostics[result.linter]);
				});
			}, 200);
		}
	}
	context.subscriptions.push(vscode.languages.registerDocumentHighlightProvider('ruby', highligher));

	context.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(changeTrigger));
	context.subscriptions.push(vscode.workspace.onDidChangeTextDocument(changeTrigger));
	context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(
		() => vscode.window.visibleTextEditors.forEach(changeTrigger)));
	vscode.window.visibleTextEditors.forEach(changeTrigger);

	context.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(balanceEvent));
	context.subscriptions.push(vscode.workspace.onDidChangeTextDocument(balanceEvent));
	context.subscriptions.push(vscode.workspace.onDidOpenTextDocument(balancePairs));

	balancePairs(vscode.window.activeTextEditor);

}

exports.activate = activate;

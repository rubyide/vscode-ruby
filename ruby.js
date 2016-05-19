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

function activate(context) {

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
					if (!activeDiagnostics[result.linter]){
						activeDiagnostics[result.linter] = vscode.languages.createDiagnosticCollection(result.linter);
						context.subscriptions.push(activeDiagnostics[result.linter]);
					}
					activeDiagnostics[result.linter].delete(doc.uri);
					deferReport(doc.uri, result, activeDiagnostics[result.linter]);
				});
			}, 200);
		}
	}
	context.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(changeTrigger));
	context.subscriptions.push(vscode.workspace.onDidChangeTextDocument(changeTrigger));
	context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(
		() => vscode.window.visibleTextEditors.forEach(changeTrigger)));
	vscode.window.visibleTextEditors.forEach(changeTrigger);
}

exports.activate = activate;

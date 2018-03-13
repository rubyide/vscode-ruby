import * as vscode from 'vscode';
import * as path from 'path';
import { AutoCorrect } from './RuboCop';


export class RubyDocumentFormattingEditProvider implements vscode.DocumentFormattingEditProvider {
	private autoCorrect: AutoCorrect;

	constructor() {
		this.autoCorrect = new AutoCorrect();
	}

	public register(ctx: vscode.ExtensionContext) {
		this.autoCorrect.test().then(
			() => ctx.subscriptions.push(
				vscode.languages.registerDocumentFormattingEditProvider('ruby', this)
			),
			() => console.log("Rubocop not installed")
		);
	}

	public provideDocumentFormattingEdits(document: vscode.TextDocument, options: vscode.FormattingOptions, token: vscode.CancellationToken): Thenable<vscode.TextEdit[]> {
		const root = document.fileName ? path.dirname(document.fileName) : vscode.workspace.rootPath;
		const input = document.getText();
		return this.autoCorrect.correct(input, root)
			.then(
				result => {
					return [new vscode.TextEdit(document.validateRange(new vscode.Range(0, 0, Infinity, Infinity)), result)];
				},
				err => {
					console.log("Failed to format:", err);
					return [];
				}
			);
	}
}

/**
 * vscode-ruby main
 */
import { ExtensionContext, languages, workspace } from 'vscode';
import * as utils from './utils';
<<<<<<< HEAD
import { registerTaskProvider } from './task/rake';

export function activate(context: ExtensionContext) {
	const subs = context.subscriptions;
	// register language config
	vscode.languages.setLanguageConfiguration('ruby', {
		indentationRules: {
			increaseIndentPattern: /^\s*((begin|class|def|else|elsif|ensure|for|if|module|rescue|unless|until|when|while)|(.*\sdo\b))\b[^;]*$/,
			decreaseIndentPattern: /^\s*([}\]]([,)]?\s*(#|$)|\.[a-zA-Z_]\w*\b)|(end|rescue|ensure|else|elsif|when)\b)/
		},
		wordPattern: /(-?\d+(?:\.\d+))|(:?[A-Za-z][^-`~@#%^&()=+[{}|;:'",<>/.*\]\s\\!?]*[!?]?)/
	});

	registerHighlightProvider(context);
	registerLinters(context);
	registerCompletionProvider(context);
	registerFormatter(context);
	registerIntellisenseProvider(context);
	registerTaskProvider(context);
	utils.loadEnv();
}

function getGlobalConfig() {
	let globalConfig = {};
	let rubyInterpreterPath = vscode.workspace.getConfiguration("ruby.interpreter").commandPath;
	if (rubyInterpreterPath) {
		globalConfig["rubyInterpreterPath"] = rubyInterpreterPath;
	}
	return globalConfig;
}

function registerHighlightProvider(ctx: ExtensionContext) {
	// highlight provider
	let pairedEnds = [];

	const getEnd = function (line) {
		//end must be on a line by itself, or followed directly by a dot
		let match = line.text.match(/^(\s*)end\b[\.\s#]?\s*$/);
		if (match) {
			return new vscode.Range(line.lineNumber, match[1].length, line.lineNumber, match[1].length + 3);
		}
	}

	const getEntry = function(line) {
		let match = line.text.match(/^(.*\b)(begin|class|def|for|if|module|unless|until|case|while)\b[^;]*$/);
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

	const balancePairs = function (doc) {
		pairedEnds = [];
		if (doc.languageId !== 'ruby') return;
=======

import languageConfiguration from './languageConfiguration';
import { registerCompletionProvider } from './providers/completion';
import { registerFormatter } from './providers/formatter';
import { registerHighlightProvider } from './providers/highlight';
import { registerIntellisenseProvider } from './providers/intellisense';
import { registerLinters } from './providers/linters';
import { registerTaskProvider } from './task/rake';
>>>>>>> 6799da0da2e66e6b9b0fae3c1d53ae1b1df6974e

const DOCUMENT_SELECTOR: { language: string; scheme: string }[] = [
	{ language: 'ruby', scheme: 'file' },
	{ language: 'ruby', scheme: 'untitled' },
];

let client;

export function activate(context: ExtensionContext): void {
	// register language config
	languages.setLanguageConfiguration('ruby', languageConfiguration);

	if (workspace.getConfiguration('ruby').useLanguageServer) {
		client = require('../client/out/extension');
		client.activate(context);
	} else {
		// Register legacy providers
		registerHighlightProvider(context, DOCUMENT_SELECTOR);
	}

	// Register providers
	registerCompletionProvider(context, DOCUMENT_SELECTOR);
	registerFormatter(context, DOCUMENT_SELECTOR);

	if (workspace.rootPath) {
		registerLinters(context);
		registerIntellisenseProvider(context);
		registerTaskProvider(context);
	}

	utils.loadEnv();
}

export function deactivate(): void {
	if (workspace.getConfiguration('ruby').useLanguageServer) {
		client.deactivate();
	}

	return undefined;
}
<<<<<<< HEAD

function registerIntellisenseProvider(ctx: ExtensionContext) {
	// for locate: if it's a project, use the root, othewise, don't bother
	if (vscode.workspace.rootPath) {
		const refreshLocate = () => {
			let progressOptions = { location: vscode.ProgressLocation.Window, title: 'Indexing Ruby source files' };
			vscode.window.withProgress(progressOptions, () => locate.walk());
		};
		const settings: any = vscode.workspace.getConfiguration("ruby.locate") || {};
		let locate = new Locate(vscode.workspace.rootPath, settings);
		refreshLocate();
		ctx.subscriptions.push(vscode.commands.registerCommand('ruby.reloadProject', refreshLocate));

		const watch = vscode.workspace.createFileSystemWatcher(settings.include);
		watch.onDidChange(uri => locate.parse(uri.fsPath));
		watch.onDidCreate(uri => locate.parse(uri.fsPath));
		watch.onDidDelete(uri => locate.rm(uri.fsPath));
		const locationConverter = match => new vscode.Location(vscode.Uri.file(match.file), new vscode.Position(match.line, match.char));
		const defProvider = {
			provideDefinition: (doc, pos) => {
				const txt = doc.getText(doc.getWordRangeAtPosition(pos));
				return locate.find(txt).then(matches => matches.map(locationConverter));
			}
		};
		ctx.subscriptions.push(vscode.languages.registerDefinitionProvider(['ruby', 'erb'], defProvider));
		const symbolKindTable = {
			class: () => SymbolKind.Class,
			module: () => SymbolKind.Module,
			method: symbolInfo => symbolInfo.name === 'initialize' ? SymbolKind.Constructor : SymbolKind.Method,
			classMethod: () => SymbolKind.Method,
		};
		const defaultSymbolKind = symbolInfo => {
			console.warn(`Unknown symbol type: ${symbolInfo.type}`);
			return SymbolKind.Variable;
		};
		// NOTE: Workaround for high CPU usage on IPC (channel.onread) when too many symbols returned.
		// For channel.onread see issue like this: https://github.com/Microsoft/vscode/issues/6026
		const numOfSymbolLimit = 3000;
		const symbolsConverter = matches => matches.slice(0, numOfSymbolLimit).map(match => {
			const symbolKind = (symbolKindTable[match.type] || defaultSymbolKind)(match);
			return new SymbolInformation(match.name, symbolKind, match.containerName, locationConverter(match));
		});
		const docSymbolProvider = {
			provideDocumentSymbols: (document, token) => {
				return locate.listInFile(document.fileName).then(symbolsConverter);
			}
		};
		ctx.subscriptions.push(vscode.languages.registerDocumentSymbolProvider(['ruby', 'erb'], docSymbolProvider));
		const workspaceSymbolProvider = {
			provideWorkspaceSymbols: (query, token) => {
				return locate.query(query).then(symbolsConverter);
			}
		};
		ctx.subscriptions.push(vscode.languages.registerWorkspaceSymbolProvider(workspaceSymbolProvider));
	}
}
=======
>>>>>>> 6799da0da2e66e6b9b0fae3c1d53ae1b1df6974e

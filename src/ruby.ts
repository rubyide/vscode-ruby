"use strict";

import * as vscode from 'vscode';
import { Location, ExtensionContext, Position, SymbolKind, SymbolInformation } from 'vscode';
import * as Locate from './locate/locate';
import * as path from 'path';
import * as cp from 'child_process';
import { LintCollection } from './lint/lintCollection';
import { RubyDocumentFormattingEditProvider } from './format/rubyFormat';
import * as utils from './utils';
import { registerTaskProvider } from './task/rake';
import { Config as LintConfig } from './lint/lintConfig';
import * as debounce from 'lodash/debounce';

export function activate(context: ExtensionContext) {
	const subs = context.subscriptions;
	// register language config
	vscode.languages.setLanguageConfiguration('ruby', {
		indentationRules: {
			increaseIndentPattern: /^(\s*(module|class|((private|protected)\s+)?def|unless|if|else|elsif|case|when|begin|rescue|ensure|for|while|until|(?=.*?\b(do|begin|case|if|unless)\b)("(\\.|[^\\"])*"|'(\\.|[^\\'])*'|[^#"'])*(\s(do|begin|case)|[-+=&|*/~%^<>~]\s*(if|unless)))\b(?![^;]*;.*?\bend\b)|("(\\.|[^\\"])*"|'(\\.|[^\\'])*'|[^#"'])*(\((?![^\)]*\))|\{(?![^\}]*\})|\[(?![^\]]*\]))).*$/,
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

function getGlobalLintConfig() : LintConfig {
	let globalConfig = new LintConfig();

	let pathToRuby = vscode.workspace.getConfiguration("ruby.interpreter").commandPath;
	if (pathToRuby) {
		globalConfig.pathToRuby = pathToRuby;
	}

	let useBundler = vscode.workspace.getConfiguration("ruby").get<boolean | null>("useBundler");
	if (useBundler !== null) {
		globalConfig.useBundler = useBundler;
	}

	let pathToBundler = vscode.workspace.getConfiguration("ruby").pathToBundler;
	if (pathToBundler) {
		globalConfig.pathToBundler = pathToBundler;
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

	const balanceEvent = function (event) {
		if (event && event.document) balancePairs(event.document);
	}

	ctx.subscriptions.push(vscode.languages.registerDocumentHighlightProvider('ruby', {
		provideDocumentHighlights: (doc, pos) => {
			let result = pairedEnds.find(pair => (
				pair.entry.start.line === pos.line ||
				pair.end.start.line === pos.line));
			if (result) {
				return [new vscode.DocumentHighlight(result.entry, 2), new vscode.DocumentHighlight(result.end, 2)];
			}
		}
	}));

	ctx.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(balanceEvent));
	ctx.subscriptions.push(vscode.workspace.onDidChangeTextDocument(balanceEvent));
	ctx.subscriptions.push(vscode.workspace.onDidOpenTextDocument(balancePairs));
	if (vscode.window && vscode.window.activeTextEditor) {
		balancePairs(vscode.window.activeTextEditor.document);
	}
}

function registerLinters(ctx: ExtensionContext) {
	const globalConfig = getGlobalLintConfig();
	const linters = new LintCollection(globalConfig, vscode.workspace.getConfiguration("ruby").lint, vscode.workspace.rootPath);
	ctx.subscriptions.push(linters);

	function executeLinting(e: vscode.TextEditor | vscode.TextDocumentChangeEvent) {
		if (!e) return;
		linters.run(e.document);
	}

	// Debounce linting to prevent running on every keypress, only run when typing has stopped
	const lintDebounceTime = vscode.workspace.getConfiguration('ruby').lintDebounceTime;
	const executeDebouncedLinting = debounce(executeLinting, lintDebounceTime);

	ctx.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(executeLinting));
	ctx.subscriptions.push(vscode.workspace.onDidChangeTextDocument(executeDebouncedLinting));
	ctx.subscriptions.push(vscode.workspace.onDidChangeConfiguration(() => {
		const docs = vscode.window.visibleTextEditors.map(editor => editor.document);
		console.log("Config changed. Should lint:", docs.length);
		const globalConfig = getGlobalLintConfig();
		linters.cfg(vscode.workspace.getConfiguration("ruby").lint, globalConfig);
		docs.forEach(doc => linters.run(doc));
	}));

	// run against all of the current open files
	vscode.window.visibleTextEditors.forEach(executeLinting);
}

function registerCompletionProvider(ctx: ExtensionContext) {
	if (vscode.workspace.getConfiguration('ruby').codeCompletion == 'rcodetools') {
		const completeCommand = function (args) {
			let rctCompletePath = vscode.workspace.getConfiguration('ruby.rctComplete').get('commandPath', 'rct-complete');
			args.push('--interpreter');
			args.push(vscode.workspace.getConfiguration('ruby.interpreter').get('commandPath', 'ruby'));
			if (process.platform === 'win32')
				return cp.spawn('cmd', ['/c', rctCompletePath].concat(args));
			return cp.spawn(rctCompletePath, args);
		}

		const completeTest = completeCommand(['--help']);
		completeTest.on('exit', () => {
			ctx.subscriptions.push(
				vscode.languages.registerCompletionItemProvider(
					/** selector */'ruby',
					/** provider */{
						provideCompletionItems: function completionProvider(document, position, token) {
							return new Promise((resolve, reject) => {
								const line = position.line + 1;
								const column = position.character;
								let child = completeCommand([
									'--completion-class-info',
									'--dev',
									'--fork',
									'--line=' + line,
									'--column=' + column
								]);
								let outbuf = [],
									errbuf = [];
								child.stderr.on('data', (data) => errbuf.push(data));
								child.stdout.on('data', (data) => outbuf.push(data));
								child.stdout.on('end', () => {
									if (errbuf.length > 0) return reject(Buffer.concat(errbuf).toString());
									let completionItems = [];
									Buffer.concat(outbuf).toString().split('\n').forEach(function (elem) {
										let items = elem.split('\t');
										if (/^[^\w]/.test(items[0])) return;
										if (items[0].trim().length === 0) return;
										let completionItem = new vscode.CompletionItem(items[0]);
										completionItem.detail = items[1];
										completionItem.documentation = items[1];
										completionItem.filterText = items[0];
										completionItem.insertText = items[0];
										completionItem.label = items[0];
										completionItem.kind = vscode.CompletionItemKind.Method;
										completionItems.push(completionItem);
									}, this);
									if (completionItems.length === 0)
										return reject([]);
									return resolve(completionItems);
								});
								child.stdin.end(document.getText());
							});
						}
					},
					/** triggerCharacters */ ...['.']
				)
			)
		});
		completeTest.on('error', () => 0);
	}
}

function registerFormatter(ctx: ExtensionContext) {
	new RubyDocumentFormattingEditProvider().register(ctx);
}

function registerIntellisenseProvider(ctx: ExtensionContext) {
	// for locate: if it's a project, use the root, othewise, don't bother
	if (vscode.workspace.getConfiguration('ruby').intellisense == 'rubyLocate') {
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
		} else {
			var rubyLocateUnavailable = () => {
				vscode.window.showInformationMessage('There is not an open workspace for rubyLocate to reload.');
			};
			ctx.subscriptions.push(vscode.commands.registerCommand('ruby.reloadProject', rubyLocateUnavailable));
		}
	} else {
		var rubyLocateDisabled = () => {
			vscode.window.showInformationMessage('The `ruby.intellisense` configuration is not set to use rubyLocate.')
		};
		ctx.subscriptions.push(vscode.commands.registerCommand('ruby.reloadProject', rubyLocateDisabled));
	}
}

"use strict";
let vscode = require('vscode');

let Locate = require('./locate/locate');
let cp = require('child_process');
let path = require('path');

let LintCollection = require('./lint/lintCollection');
let AutoCorrect = require('./format/RuboCop');

const langConfig = {
	indentationRules: {
		increaseIndentPattern: /^\s*((begin|class|def|else|elsif|ensure|for|if|module|rescue|unless|until|when|while)|(.*\sdo\b))\b[^\{;]*$/
	},
	wordPattern: /(-?\d+(?:\.\d+))|(:?[A-Za-z][^-`~@#%^&()=+[{}|;:'",<>/.*\]\s\\!?]*[!?]?)/
};

let pairedEnds = [];
const highligher = {
	provideDocumentHighlights: (doc, pos) => {
		let result = pairedEnds.find(pair => (
			pair.entry.start.line === pos.line ||
			pair.end.start.line === pos.line));
		if (result) {
			return [new vscode.DocumentHighlight(result.entry, 2), new vscode.DocumentHighlight(result.end, 2)];
		}
	}
};

function getEnd(line) {
	//end must be on a line by itself, or followed directly by a dot
	let match = line.text.match(/^(\s*)end\b[\.\s#]?\s*$/);
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
	if (event && event.document) balancePairs(event.document);
}

function completeCommand(args) {
	let rctCompletePath = vscode.workspace.getConfiguration('ruby.rctComplete').get('commandPath', 'rct-complete');
	args.push('--interpreter');
	args.push(vscode.workspace.getConfiguration('ruby.interpreter').get('commandPath', 'ruby'));
	if (process.platform === 'win32')
		return cp.spawn('cmd', ['/c', rctCompletePath].concat(args));
	return cp.spawn(rctCompletePath, args);
}

const completionProvider = {
	provideCompletionItems: function completionProvider(document, position) {
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
};

let autoCorrect;
const formatter = {
	provideDocumentFormattingEdits: function (doc) {
		let opts = vscode.workspace.getConfiguration("ruby.lint.rubocop");
		if (!opts || opts === true) opts = {};
		const root = doc.fileName ? path.dirname(doc.fileName) : vscode.workspace.rootPath;
		const input = doc.getText();
		return autoCorrect.correct(input, root, opts).then(result => [new vscode.TextEdit(doc.validateRange(new vscode.Range(0, 0, Infinity, Infinity)), result)]).catch(err => console.log("Failed to format:", err));
	}
};

function activate(context) {
	const subs = context.subscriptions;
	//add language config
	vscode.languages.setLanguageConfiguration('ruby', langConfig);

	const linters = new LintCollection(vscode.workspace.getConfiguration("ruby").lint);
	subs.push(linters);

	function changeTrigger(changed) {
		if (!changed) return;
		linters.run(changed.document);
	}

	subs.push(vscode.languages.registerDocumentHighlightProvider('ruby', highligher));

	subs.push(vscode.window.onDidChangeActiveTextEditor(changeTrigger));
	subs.push(vscode.workspace.onDidChangeTextDocument(changeTrigger));
	subs.push(vscode.workspace.onDidChangeConfiguration(() => {
		const docs = vscode.window.visibleTextEditors.map(editor => editor.document);
		console.log("Config changed. Should lint:", docs.length);
		linters.cfg(vscode.workspace.getConfiguration("ruby").lint);
		docs.forEach(doc => linters.run(doc));
	}));

	// run against all of the current open files
	vscode.window.visibleTextEditors.forEach(changeTrigger);

	//for locate: if it's a project, use the root, othewise, don't bother
	let locate;
	if (vscode.workspace.rootPath) {
		const settings = vscode.workspace.getConfiguration("ruby.locate") || {};
		locate = new Locate(vscode.workspace.rootPath, settings);
		const watch = vscode.workspace.createFileSystemWatcher(settings.include);
		watch.onDidChange(uri => locate.parse(uri.fsPath));
		watch.onDidCreate(uri => locate.parse(uri.fsPath));
		watch.onDidDelete(uri => locate.rm(uri.fsPath));
		const defProvider = {
			provideDefinition: (doc, pos) => {
				const txt = doc.getText(doc.getWordRangeAtPosition(pos));
				const matches = locate.find(txt);
				return matches.map(m => new vscode.Location(vscode.Uri.file(m.file), new vscode.Position(m.line, m.char)));
			}
		};
		subs.push(vscode.languages.registerDefinitionProvider(['ruby', 'erb'], defProvider));
	}

	subs.push(vscode.window.onDidChangeActiveTextEditor(balanceEvent));
	subs.push(vscode.workspace.onDidChangeTextDocument(balanceEvent));
	subs.push(vscode.workspace.onDidOpenTextDocument(balancePairs));
	if (vscode.window && vscode.window.activeTextEditor) {
		balancePairs(vscode.window.activeTextEditor.document);
	}
	autoCorrect = new AutoCorrect(vscode.workspace.getConfiguration("ruby").get("lint.rubocop") || {});
	autoCorrect.test().then(
		() => subs.push(vscode.languages.registerDocumentFormattingEditProvider('ruby', formatter)),
		() => console.log("Rubocop not installed"));

	const completeTest = completeCommand(['--help']);
	completeTest.on('exit', () => subs.push(vscode.languages.registerCompletionItemProvider('ruby', completionProvider, ['.'])));
	completeTest.on('error', () => 0);

}

exports.activate = activate;
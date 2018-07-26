/**
 * vscode-ruby main
 */
import { ExtensionContext, languages, workspace } from 'vscode';
import * as utils from './utils';

import languageConfiguration from './languageConfiguration';
import { registerCompletionProvider } from './providers/completion';
import { registerFormatter } from './providers/formatter';
import { registerHighlightProvider } from './providers/highlight';
import { registerIntellisenseProvider } from './providers/intellisense';
import { registerLinters } from './providers/linters';
import { registerTaskProvider } from './task/rake';

const DOCUMENT_SELECTOR: { language: string; scheme: string }[] = [
	{ language: 'ruby', scheme: 'file' },
	{ language: 'ruby', scheme: 'untitled' },
];

const client = require('../client/out/extension');

export function activate(context: ExtensionContext): void {
	// register language config
	languages.setLanguageConfiguration('ruby', languageConfiguration);

	if (workspace.getConfiguration('ruby').useLanguageServer) {
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
	client.deactivate();

	return undefined;
}

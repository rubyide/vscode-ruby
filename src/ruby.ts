'use strict';

import { ExtensionContext, languages, workspace } from 'vscode';

import * as utils from './utils';

import languageConfiguration from './languageConfiguration';
import { registerCompletionProvider } from './providers/completion';
import { registerFormatter } from './providers/formatter';
import { registerHighlightProvider } from './providers/highlight';
import { registerIntellisenseProvider } from './providers/intellisense';
import { registerLinters } from './providers/linters';
import { registerTaskProvider } from './task/rake';

const DOCUMENT_SELECTOR = [
	{ language: 'ruby', scheme: 'file' },
	{ language: 'ruby', scheme: 'untitled' }
];

export function activate(context: ExtensionContext) {
	const subs = context.subscriptions;

	// register language config
	languages.setLanguageConfiguration('ruby', languageConfiguration);

	// Register providers
	registerHighlightProvider(context, DOCUMENT_SELECTOR);
	registerCompletionProvider(context, DOCUMENT_SELECTOR);
	registerFormatter(context, DOCUMENT_SELECTOR);

	if (workspace.rootPath) {
		registerLinters(context);
		registerIntellisenseProvider(context);
		registerTaskProvider(context);
	}

	utils.loadEnv();
}

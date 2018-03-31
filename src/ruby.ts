'use strict';

import * as path from 'path';
import { ExtensionContext, languages, Location, Position } from 'vscode';
import * as Locate from './locate/locate';
import { registerTaskProvider } from './task/rake';
import * as utils from './utils';

import { registerCompletionProvider } from './providers/completion';
import { registerFormatter } from './providers/formatter';
import { registerHighlightProvider } from './providers/highlight';
import { registerIntellisenseProvider } from './providers/intellisense';
import { registerLinters } from './providers/linters';

export function activate(context: ExtensionContext) {
	const subs = context.subscriptions;

	// register language config
	languages.setLanguageConfiguration('ruby', {
		indentationRules: {
			increaseIndentPattern: /^(\s*(module|class|((private|protected)\s+)?def|unless|if|else|elsif|case|when|begin|rescue|ensure|for|while|until|(?=.*?\b(do|begin|case|if|unless)\b)("(\\.|[^\\"])*"|'(\\.|[^\\'])*'|[^#"'])*(\s(do|begin|case)|[-+=&|*/~%^<>~]\s*(if|unless)))\b(?![^;]*;.*?\bend\b)|("(\\.|[^\\"])*"|'(\\.|[^\\'])*'|[^#"'])*(\((?![^\)]*\))|\{(?![^\}]*\})|\[(?![^\]]*\]))).*$/,
			decreaseIndentPattern: /^\s*([}\]]([,)]?\s*(#|$)|\.[a-zA-Z_]\w*\b)|(end|rescue|ensure|else|elsif|when)\b)/,
		},
		wordPattern: /(-?\d+(?:\.\d+))|(:?[A-Za-z][^-`~@#%^&()=+[{}|;:'",<>/.*\]\s\\!?]*[!?]?)/,
	});

	// Register providers
	registerHighlightProvider(context);
	registerLinters(context);
	registerCompletionProvider(context);
	registerFormatter(context);
	registerIntellisenseProvider(context);
	registerTaskProvider(context);

	utils.loadEnv();
}

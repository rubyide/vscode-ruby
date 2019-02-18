import { Range, TextDocument, TextDocumentIdentifier, TextEdit } from 'vscode-languageserver';
import {
	documentConfigurationCache,
	RubyEnvironment,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
} from './SettingsCache';
import { documents } from './DocumentManager';
import URI from 'vscode-uri';
import { from, Observable } from 'rxjs';
import { mergeMap, switchMap } from 'rxjs/operators';
import { IFormatter, FormatterConfig, NullFormatter, RuboCop, Standard, Rufo } from './formatters';

const FORMATTER_MAP = {
	rubocop: RuboCop,
	standard: Standard,
	rufo: Rufo,
};

function getFormatter(
	document: TextDocument,
	env: RubyEnvironment,
	config: RubyConfiguration,
	range?: Range
): IFormatter {
	if (typeof config.format === 'string') {
		const formatterConfig: FormatterConfig = {
			env,
			executionRoot: URI.parse(config.workspaceFolderUri).fsPath,
			config: {
				command: config.format,
				useBundler: config.useBundler,
			},
		};

		if (range) {
			formatterConfig.range = range;
		}

		return new FORMATTER_MAP[config.format](document, formatterConfig);
	} else {
		return new NullFormatter();
	}
}

export default class Formatter {
	static format(ident: TextDocumentIdentifier, range?: Range): Observable<TextEdit[]> {
		const document = documents.get(ident.uri);

		return from(documentConfigurationCache.get(ident.uri)).pipe(
			mergeMap(
				config => workspaceRubyEnvironmentCache.get(config.workspaceFolderUri),
				(config, env) => {
					return { config, env };
				}
			),
			switchMap(({ config, env }) => {
				return getFormatter(document, env, config, range).format();
			})
		);
	}
}

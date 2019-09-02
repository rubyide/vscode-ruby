import { Range, TextDocument, TextDocumentIdentifier, TextEdit } from 'vscode-languageserver';
import {
	documentConfigurationCache,
	IEnvironment,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
} from './SettingsCache';
import { documents } from './DocumentManager';
import URI from 'vscode-uri';
import { from, Observable } from 'rxjs';
import { mergeMap } from 'rxjs/operators';
import {
	IFormatter,
	FormatterConfig,
	NullFormatter,
	RuboCop,
	Standard,
	Rufo,
	RubyFMT,
} from './formatters';

const FORMATTER_MAP = {
	rubocop: RuboCop,
	standard: Standard,
	rufo: Rufo,
	rubyfmt: RubyFMT,
};

function getFormatter(
	document: TextDocument,
	env: IEnvironment,
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

const Formatter = {
	format(ident: TextDocumentIdentifier, range?: Range): Observable<TextEdit[]> {
		const document = documents.get(ident.uri);

		return from(documentConfigurationCache.get(ident.uri)).pipe(
			mergeMap(config =>
				from(workspaceRubyEnvironmentCache.get(config.workspaceFolderUri)).pipe(
					mergeMap(env => {
						return getFormatter(document, env, config, range).format();
					})
				)
			)
		);
	},
};
export default Formatter;

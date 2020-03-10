import path from 'path';
import { URI } from 'vscode-uri';
import { iif, from, forkJoin, of, Observable } from 'rxjs';
import { map, mergeMap, switchMap } from 'rxjs/operators';
import { Diagnostic, TextDocument } from 'vscode-languageserver';
import {
	documentConfigurationCache,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
	RubyCommandConfiguration,
} from './SettingsCache';
import { RubyEnvironment } from 'vscode-ruby-common';
import { ILinter, LinterConfig, RuboCop, Reek, Standard, NullLinter } from './linters';
import { documents, DocumentEvent, DocumentEventKind } from './DocumentManager';

const LINTER_MAP = {
	rubocop: RuboCop,
	reek: Reek,
	standard: Standard,
};

export interface LintResult {
	document: TextDocument;
	diagnostics: Diagnostic[];
	error?: string;
}

function getLinter(
	name: string,
	document: TextDocument,
	env: RubyEnvironment,
	config: RubyConfiguration
): ILinter {
	if (!config.workspaceFolderUri) {
		return new NullLinter(
			`unable to lint ${document.uri} with ${name} as its workspace root folder could not be determined`
		);
	}
	const linter = LINTER_MAP[name];
	if (!linter) return new NullLinter(`attempted to lint with unsupported linter: ${name}`);
	const lintConfig: RubyCommandConfiguration =
		typeof config.lint[name] === 'object' ? config.lint[name] : {};
	const executionRoot = path.dirname(URI.parse(document.uri).fsPath);
	const linterConfig: LinterConfig = {
		env,
		executionRoot,
		config: {
			pathToBundler: config.pathToBundler,
			...lintConfig,
		},
	};
	return new linter(document, linterConfig); // eslint-disable-line new-cap
}

function lint(document: TextDocument): Observable<LintResult> {
	return from(documentConfigurationCache.get(document)).pipe(
		mergeMap(config => {
			return from(workspaceRubyEnvironmentCache.get(config.workspaceFolderUri)).pipe(
				map(env => {
					return { config, env };
				})
			);
		}),
		mergeMap(({ config, env }) => {
			const linters = Object.keys(config.lint)
				.filter(l => config.lint[l] !== false)
				.map(l => getLinter(l, document, env, config).lint());
			return forkJoin(linters).pipe(
				map(diagnostics => {
					return {
						document,
						diagnostics: [].concat(...diagnostics),
					};
				})
			);
		})
	);
}

export const linter = documents.subject.pipe(
	switchMap((event: DocumentEvent) =>
		iif(
			() =>
				event.kind === DocumentEventKind.OPEN || event.kind === DocumentEventKind.CHANGE_CONTENT,
			lint(event.document),
			of({
				document: event.document,
				diagnostics: [],
			})
		)
	)
);

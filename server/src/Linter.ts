import URI from 'vscode-uri';
import { empty, iif, from, Observable } from 'rxjs';
import { map, mergeMap, switchMap } from 'rxjs/operators';
import { Diagnostic, TextDocument } from 'vscode-languageserver';
import {
	documentConfigurationCache,
	RubyEnvironment,
	workspaceRubyEnvironmentCache,
	RubyConfiguration,
	RubyLintConfiguration,
} from './SettingsCache';
import { ILinter, LinterConfig, RuboCop, Reek } from './linters';
import { documents, DocumentEvent, DocumentEventKind } from './DocumentManager';

const LINTER_MAP = {
	rubocop: RuboCop,
	reek: Reek,
};

export type LintResult = {
	document: TextDocument;
	diagnostics: Diagnostic[];
	error?: string;
};

function getLinter(
	name: string,
	document: TextDocument,
	env: RubyEnvironment,
	config: RubyConfiguration
): ILinter {
	const lintConfig: RubyLintConfiguration =
		typeof config.lint[name] === 'object' ? config.lint[name] : {};
	const linterConfig: LinterConfig = {
		env,
		executionRoot: URI.parse(config.workspaceFolderUri).fsPath,
		config: lintConfig,
	};
	return new LINTER_MAP[name](document, linterConfig);
}

function lint(document: TextDocument): Observable<LintResult> {
	return from(documentConfigurationCache.get(document)).pipe(
		mergeMap(
			config => workspaceRubyEnvironmentCache.get(config.workspaceFolderUri),
			(config, env) => {
				return { config, env };
			}
		),
		switchMap(({ config, env }) => {
			return from(Object.keys(config.lint)).pipe(
				mergeMap(l => {
					return iif(() => config.lint[l], getLinter(l, document, env, config).lint(), empty());
				})
			);
		}),
		map(diagnostics => {
			return {
				document,
				diagnostics,
			};
		})
	);
}

export const linter = documents.subject.pipe(
	switchMap((event: DocumentEvent) =>
		iif(
			() =>
				event.kind === DocumentEventKind.OPEN || event.kind === DocumentEventKind.CHANGE_CONTENT,
			lint(event.document)
		)
	)
);

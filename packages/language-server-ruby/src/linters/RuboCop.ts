import { URI } from 'vscode-uri';
import { Diagnostic, DiagnosticSeverity, Range } from 'vscode-languageserver';
import log from 'loglevel';
import BaseLinter from './BaseLinter';
import { RuboCopLintConfiguration } from '../SettingsCache';

interface RuboCopOffenseLocation {
	start_line: number;
	start_column: number;
	last_line: number;
	last_column: number;
	line: number;
	column: number;
	length: number;
}

interface RuboCopOffense {
	severity: string; // FIXME make this a fixed option set
	message: string;
	cop_name: string;
	corrected: boolean;
	location: RuboCopOffenseLocation;
}

export interface IRuboCopResults {
	summary: {
		offense_count: number;
		target_file_count: number;
		inspected_file_count: number;
	};
	files: [
		{
			path: string;
			offenses: RuboCopOffense[];
		}
	];
}

export default class RuboCop extends BaseLinter {
	protected code = 'RuboCop';

	private readonly DIAGNOSTIC_SEVERITIES = {
		refactor: DiagnosticSeverity.Hint,
		convention: DiagnosticSeverity.Information,
		warning: DiagnosticSeverity.Warning,
		error: DiagnosticSeverity.Error,
		fatal: DiagnosticSeverity.Error,
	};

	get cmd(): string {
		if (this.lintConfig.command) {
			return this.lintConfig.command;
		} else {
			const command = 'rubocop';
			return this.isWindows() ? command + '.bat' : command;
		}
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		let args = ['-s', documentPath.fsPath, '-f', 'json'];
		if (this.lintConfig.rails) args.push('-R');
		if (this.lintConfig.forceExclusion) args.push('--force-exclusion');
		if (this.lintConfig.lint) args.push('-l');
		if (this.lintConfig.only) args = args.concat('--only', this.lintConfig.only.join(','));
		if (this.lintConfig.except) args = args.concat('--except', this.lintConfig.except.join(','));
		if (this.lintConfig.require) args = args.concat('-r', this.lintConfig.require.join(','));
		return args;
	}

	get lintConfig(): RuboCopLintConfiguration {
		return this.config.config;
	}

	protected processResults(data: string): Diagnostic[] {
		let results = [] as Diagnostic[];
		try {
			const offenses: IRuboCopResults = JSON.parse(data);

			for (const file of offenses.files) {
				const diagnostics = file.offenses.map(o => this.rubocopOffenseToDiagnostic(o));
				results = results.concat(diagnostics);
			}
		} catch (e) {
			log.error(`Lint: Received invalid JSON from rubocop:\n\n${data}`);
		}

		return results;
	}

	protected rubocopOffenseToDiagnostic(offense: RuboCopOffense): Diagnostic {
		const range = this.mapRubocopOffenseToRange(offense.location);
		return {
			range,
			severity: this.DIAGNOSTIC_SEVERITIES[offense.severity],
			message: offense.message,
			source: offense.cop_name,
			code: this.code,
		};
	}

	private mapRubocopOffenseToRange(location: RuboCopOffenseLocation): Range {
		// RuboCop >= v0.52.0
		if (location.start_line) {
			return {
				start: {
					line: location.start_line - 1,
					character: location.start_column - 1,
				},
				end: {
					line: location.last_line - 1,
					character: location.last_column,
				},
			};
		} else {
			const line = location.line - 1;
			const offenseCharacter = location.column - 1;

			return {
				start: {
					line,
					character: offenseCharacter,
				},
				end: {
					line,
					character: offenseCharacter + location.length,
				},
			};
		}
	}
}

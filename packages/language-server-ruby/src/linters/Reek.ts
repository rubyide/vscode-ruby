import BaseLinter from './BaseLinter';
import { Diagnostic, DiagnosticSeverity } from 'vscode-languageserver';

type ReekOffense = {
	context: string;
	lines: number[];
	message: string;
	smell_type: string;
	source: string;
	depth: number;
	wiki_link: string;
};

export default class Reek extends BaseLinter {
	protected code = 'Reek';

	get cmd(): string {
		if (this.lintConfig.command) {
			return this.lintConfig.command;
		} else {
			const command = 'reek';
			return this.isWindows() ? command + '.bat' : command;
		}
	}

	get args(): string[] {
		return ['-f', 'json'];
	}

	protected processResults(data): Diagnostic[] {
		let results = [] as Diagnostic[];
		try {
			const offenses: ReekOffense[] = JSON.parse(data);
			for (const offense of offenses) {
				const diagnostics = this.reekOffenseToDiagnostic(offense);
				results = results.concat(diagnostics);
			}
		} catch (e) {
			console.error(`Lint: Received invalid JSON from reek:\n\n${data}`);
		}

		return results;
	}

	private reekOffenseToDiagnostic(offense: ReekOffense): Diagnostic[] {
		const baseDiagnostic = {
			severity: DiagnosticSeverity.Warning,
			message: offense.message,
			source: offense.smell_type,
			code: this.code,
		};
		return offense.lines.map(l => {
			return {
				...baseDiagnostic,
				range: {
					start: {
						line: l,
						character: 1,
					},
					end: {
						line: l,
						character: 1,
					},
				},
			};
		});
	}
}

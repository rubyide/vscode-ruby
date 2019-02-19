import { Diagnostic } from 'vscode-languageserver';
import RuboCop, { IRuboCopResults } from './RuboCop';

export default class Standard extends RuboCop {
	protected code = 'Standard';

	get cmd(): string {
		if (this.lintConfig.command) {
			return this.lintConfig.command;
		} else {
			const command = 'standardrb';
			return this.isWindows() ? command + '.bat' : command;
		}
	}

	// This method is overridden to deal with the "notice" that is
	// currently output
	protected processResults(data): Diagnostic[] {
		const lastCurly = data.lastIndexOf('}') + 1;
		let results = [] as Diagnostic[];
		try {
			const offenses: IRuboCopResults = JSON.parse(data.substring(0, lastCurly));

			for (const file of offenses.files) {
				const diagnostics = file.offenses.map(o => this.rubocopOffenseToDiagnostic(o));
				results = results.concat(diagnostics);
			}
		} catch (e) {
			console.error(`Lint: Received invalid JSON from standardrb:\n\n${data}`);
		}

		return results;
	}
}

import URI from 'vscode-uri';
import { TextEdit } from 'vscode-languageserver';
import BaseFormatter from './BaseFormatter';

export default class RuboCop extends BaseFormatter {
	protected FORMATTED_OUTPUT_DELIMITER = '====================';
	protected FORMATTED_OUTPUT_REGEX = new RegExp(`^${this.FORMATTED_OUTPUT_DELIMITER}$`, 'm');

	get cmd(): string {
		const command = 'rubocop';
		return this.isWindows() ? command + '.bat' : command;
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		const args = ['-s', documentPath.fsPath, '-a'];
		return args;
	}

	protected processResults(output: string): TextEdit[] {
		let endOfDiagnostics = output.search(this.FORMATTED_OUTPUT_REGEX);
		if (endOfDiagnostics <= -1) {
			throw new Error(output);
		}
		endOfDiagnostics += this.FORMATTED_OUTPUT_DELIMITER.length;
		const cleanOutput = output.substring(endOfDiagnostics).trimLeft();
		return super.processResults(cleanOutput);
	}

	protected processError(error: any, formatStr: string): Error {
		const code = error.code || error.toString().match(/code: (\d+)/)[1] || null;
		if (code === '1') return null;
		return super.processError(error, formatStr);
	}
}

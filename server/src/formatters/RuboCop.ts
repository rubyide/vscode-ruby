import URI from 'vscode-uri';
import { TextEdit } from 'vscode-languageserver';
import BaseFormatter from './BaseFormatter';

export default class RuboCop extends BaseFormatter {
	protected FORMATTED_OUTPUT_DELIMITER = '====================';

	get cmd(): string {
		const command = 'rubocop';
		return this.isWindows() ? command + '.bat' : command;
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		let args = ['-s', documentPath.fsPath, '-a'];
		return args;
	}

	protected processResults(output: string): TextEdit[] {
		const endOfDiagnostics =
			output.lastIndexOf(this.FORMATTED_OUTPUT_DELIMITER) + this.FORMATTED_OUTPUT_DELIMITER.length;
		const cleanOutput = output.substring(endOfDiagnostics).trimLeft();
		return super.processResults(cleanOutput);
	}
}

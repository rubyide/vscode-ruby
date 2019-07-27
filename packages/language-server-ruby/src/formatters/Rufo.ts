import URI from 'vscode-uri';
import BaseFormatter from './BaseFormatter';

export default class Rubocop extends BaseFormatter {
	get cmd(): string {
		const command = 'rufo';
		return this.isWindows() ? command + '.bat' : command;
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		return [`--filename=${documentPath.fsPath}`, '-x'];
	}
}

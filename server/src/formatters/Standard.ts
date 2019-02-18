import URI from 'vscode-uri';
import RuboCop from './RuboCop';

export default class Standard extends RuboCop {
	get cmd(): string {
		const command = 'standardrb';
		return this.isWindows() ? command + '.bat' : command;
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		let args = ['-s', documentPath.fsPath, '--fix'];
		return args;
	}
}

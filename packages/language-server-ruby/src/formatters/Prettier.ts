import cp from 'child_process';
import { URI } from 'vscode-uri';
import BaseFormatter from './BaseFormatter';

enum PrettierKind {
	RbPrettier = 'rbprettier',
	Prettier = 'prettier',
}

export default class Prettier extends BaseFormatter {
	private _cmd: string = '';

	get cmd(): string {
		if (this._cmd === '') return this.buildCmd();
		return this._cmd;
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		return [`${documentPath.fsPath}`];
	}

	private buildCmd(): string {
		let prettierExecutable = this.getPrettierExecutable();
		if (prettierExecutable === PrettierKind.RbPrettier) {
			this._cmd = prettierExecutable;
			return prettierExecutable;
		}

		prettierExecutable = this.isWindows() ? prettierExecutable + '.bat' : prettierExecutable;
		this._cmd = prettierExecutable;
		return prettierExecutable;
	}

	private getPrettierExecutable(): string {
		let args = [];
		if (this.useBundler) {
			args = [...args, 'bundle', 'exec'];
		}
		args = [...args, 'rbprettier', '--version'];
		const rbPrettierCommand = args.shift();
		const rbPrettierProcess = cp.spawnSync(rbPrettierCommand, args);
		if (rbPrettierProcess.stderr.length !== 0) return PrettierKind.Prettier;

		return PrettierKind.RbPrettier;
	}
}

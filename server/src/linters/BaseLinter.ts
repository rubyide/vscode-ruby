import { Diagnostic, TextDocument } from 'vscode-languageserver';
import execa from 'execa';
import { from, Observable, empty } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { RubyEnvironment, RubyLintConfiguration } from '../SettingsCache';

export interface ILinter {
	lint(): Observable<Diagnostic[]>;
}

export type LinterConfig = {
	env: RubyEnvironment;
	executionRoot: string;
	config: RubyLintConfiguration;
};

export default abstract class BaseLinter implements ILinter {
	protected document: TextDocument;
	protected config: LinterConfig;

	constructor(document: TextDocument, config: LinterConfig) {
		this.document = document;
		this.config = config;
	}

	get cmd(): string {
		return this.lintConfig.command;
	}

	get args(): string[] {
		return [this.document.uri];
	}

	get lintConfig(): RubyLintConfiguration {
		return this.config.config;
	}

	public lint(): Observable<Diagnostic[]> {
		let { cmd, args } = this;

		if (!this.lintConfig.command && this.lintConfig.useBundler) {
			args.unshift('exec', cmd);
			cmd = 'bundle';
		}

		console.info(`Lint: executing ${cmd} ${args.join(' ')}...`);

		return from(
			execa(cmd, args, {
				env: this.config.env,
				cwd: this.config.executionRoot,
				input: this.document.getText(),
				reject: false, // important since linters return non-zero error codes
			})
		).pipe(
			map(result => {
				return this.processResults(result.stdout);
			}),
			catchError(error => {
				console.log(error);
				return empty();
			})
		);
	}

	protected processResults(_output): Diagnostic[] {
		return [];
	}

	protected isWindows(): boolean {
		return process.platform === 'win32';
	}
}

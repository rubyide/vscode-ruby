import { Diagnostic } from 'vscode-languageserver';
import { TextDocument } from 'vscode-languageserver-textdocument';
import log from 'loglevel';
import { spawn } from '../util/spawn';
import { EMPTY, of, Observable } from 'rxjs';
import { catchError, map, reduce } from 'rxjs/operators';
import { RubyCommandConfiguration } from '../SettingsCache';
import { IEnvironment } from 'vscode-ruby-common';

export interface ILinter {
	lint(): Observable<Diagnostic[]>;
}

export interface LinterConfig {
	env: IEnvironment;
	executionRoot: string;
	config: RubyCommandConfiguration;
}

export default abstract class BaseLinter implements ILinter {
	protected document: TextDocument;
	protected config: LinterConfig;
	protected code = 'BaseLinter';

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

	get lintConfig(): RubyCommandConfiguration {
		return this.config.config;
	}

	public lint(): Observable<Diagnostic[]> {
		let { cmd, args } = this;

		if (!this.lintConfig.command && this.lintConfig.useBundler) {
			args.unshift('exec', cmd);
			cmd = 'bundle';
		}

		log.info(`Lint: executing ${cmd} ${args.join(' ')}...`);
		log.debug(`Lint environment: ${JSON.stringify(this.config.env, null, 2)}`);
		return spawn(cmd, args, {
			env: this.config.env,
			cwd: this.config.executionRoot,
			stdin: of(this.document.getText()),
		}).pipe(
			catchError(error => {
				this.processError(error);
				return EMPTY;
			}),
			reduce((acc: string, value: any) => {
				if (value.source === 'stdout') {
					return `${acc}${value.text}`;
				} else {
					log.error(value.text);
					return acc;
				}
			}, ''),
			map((result: string) => {
				return result.length ? this.processResults(result) : [];
			})
		);
	}

	protected processResults(_output): Diagnostic[] {
		return [];
	}

	protected isWindows(): boolean {
		return process.platform === 'win32';
	}

	protected processError(error: any): void {
		switch (error.code) {
			case 'ENOENT':
				log.warn(
					`Lint: unable to execute ${error.path} ${error.spawnargs.join(
						' '
					)} as the command could not be found`
				);
				break;
		}
	}
}

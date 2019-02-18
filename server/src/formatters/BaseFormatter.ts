import { TextDocument, TextEdit } from 'vscode-languageserver';
import { spawn } from 'spawn-rx';
import { of, Observable, empty } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import {
	diff_match_patch as DiffMatchPatch,
	Diff,
	DIFF_DELETE,
	DIFF_INSERT,
	DIFF_EQUAL,
} from 'diff-match-patch';
import { RubyEnvironment, RubyCommandConfiguration } from '../SettingsCache';

export interface IFormatter {
	format(): Observable<TextEdit[]>;
}

export type FormatterConfig = {
	env: RubyEnvironment;
	executionRoot: string;
	config: RubyCommandConfiguration;
};

export default abstract class BaseFormatter implements IFormatter {
	protected document: TextDocument;
	protected config: FormatterConfig;
	private differ: DiffMatchPatch;

	constructor(document: TextDocument, config: FormatterConfig) {
		this.document = document;
		this.config = config;
		this.differ = new DiffMatchPatch();
	}

	get cmd(): string {
		return 'echo';
	}

	get args(): string[] {
		return [this.document.uri];
	}

	get useBundler(): boolean {
		return this.config.config.useBundler;
	}

	public format(): Observable<TextEdit[]> {
		let { cmd, args } = this;

		if (this.useBundler) {
			args.unshift('exec', cmd);
			cmd = 'bundle';
		}

		console.info(`Format: executing ${cmd} ${args.join(' ')}...`);
		return spawn(cmd, args, {
			env: this.config.env,
			cwd: this.config.executionRoot,
			stdin: of(this.document.getText()),
			split: true,
		}).pipe(
			catchError(error => {
				this.processError(error);
				return empty();
			}),
			map((result: any) => {
				const { source, text } = result;
				if (source === 'stdout') {
					return this.processResults(text);
				} else {
					this.processError({
						code: source,
						spawnargs: args,
						message: text,
					});
					return [];
				}
			})
		);
	}

	protected processResults(output: string): TextEdit[] {
		const originalText = this.document.getText();
		const diffs: Diff[] = this.differ.diff_main(originalText, output);
		const edits: TextEdit[] = [];
		// VSCode wants TextEdits on the original document
		// this means position only gets moved for DIFF_EQUAL and DIFF_DELETE
		// as insert is new and doesn't have a position in the original
		let position = 0;
		for (let diff of diffs) {
			const [num, str] = diff;
			const startPos = this.document.positionAt(position);
			switch (num) {
				case DIFF_DELETE:
					edits.push({
						range: {
							start: startPos,
							end: this.document.positionAt(position + str.length),
						},
						newText: '',
					});
					position += str.length;
					break;
				case DIFF_INSERT:
					edits.push({
						range: { start: startPos, end: startPos },
						newText: str,
					});
					break;
				case DIFF_EQUAL:
					position += str.length;
					break;
			}
		}

		return edits;
	}

	protected isWindows(): boolean {
		return process.platform === 'win32';
	}

	protected processError(error: any) {
		switch (error.code) {
			case 'ENOENT':
				console.error(
					`Format: unable to execute ${error.path} ${error.spawnargs.join(
						' '
					)} as the command could not be found`
				);
				break;
			case 'stderr':
				console.error(
					`Format: unable to execute ${error.path} ${error.spawnargs.join(' ')}. Got error:\n\n${
						error.message
					}`
				);
		}
	}
}

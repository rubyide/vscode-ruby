import { Position, Range, TextDocument, TextEdit } from 'vscode-languageserver';
import { spawn } from 'spawn-rx';
import { of, Observable, throwError } from 'rxjs';
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
	range?: Range;
};

export default abstract class BaseFormatter implements IFormatter {
	protected document: TextDocument;
	private originalText: string;
	protected config: FormatterConfig;
	private differ: DiffMatchPatch;

	constructor(document: TextDocument, config: FormatterConfig) {
		this.document = document;
		this.originalText = document.getText();
		this.config = config;
		this.differ = new DiffMatchPatch();

		if (this.range) {
			this.modifyRange();
		}
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

	get range(): Range {
		return this.config.range;
	}

	public format(): Observable<TextEdit[]> {
		let { cmd, args } = this;

		if (this.useBundler) {
			args.unshift('exec', cmd);
			cmd = 'bundle';
		}

		const formatStr = `${cmd} ${args.join(' ')}`;
		console.info(`Format: executing ${formatStr}...`);
		return spawn(cmd, args, {
			env: this.config.env,
			cwd: this.config.executionRoot,
			stdin: of(this.originalText),
		}).pipe(
			catchError(error => {
				const err: Error | null = this.processError(error, formatStr);
				return err ? throwError(err) : of('');
			}),
			map((result: string) => {
				return this.processResults(result);
			})
		);
	}

	protected processResults(output: string): TextEdit[] {
		const diffs: Diff[] = this.differ.diff_main(this.originalText, output);
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

			// If we have a range we are doing a selection format. Thus,
			// only apply patches that start within the selected range
			if (this.range && num !== DIFF_EQUAL && !this.checkPositionInRange(startPos)) {
				edits.pop();
			}
		}

		return edits;
	}

	protected isWindows(): boolean {
		return process.platform === 'win32';
	}

	protected processError(error: any, formatStr: string): Error {
		let code = error.code || error.toString().match(/code: (\d+)/)[1] || null;
		let message = `\n    unable to execute ${formatStr}:\n    ${error.toString()} - ${this.messageForCode(
			code
		)}`;
		return new Error(message);
	}

	protected messageForCode(code: string) {
		switch (code) {
			case '127':
				return 'missing gem executables';
			case 'ENOENT':
				return 'command not found';
			default:
				return 'unknown error';
		}
	}

	// Modified from https://github.com/Microsoft/vscode/blob/master/src/vs/editor/common/core/range.ts#L90
	private checkPositionInRange(position: Position) {
		const { start, end } = this.range;

		if (position.line < start.line || position.line > end.line) {
			return false;
		}

		if (position.line === start.line && position.character < start.character) {
			return false;
		}

		if (position.line === end.line && position.character > end.character) {
			return false;
		}

		return true;
	}

	// If the selection range just has whitespace before it in the line,
	// extend the range to account for that whitespace
	private modifyRange() {
		const { start } = this.range;
		const offset = this.document.offsetAt(start);
		const prefixLineText = this.originalText.substring(offset - start.character, offset);

		if (/^\s+$/.test(prefixLineText)) {
			this.range.start.character = 0;
		}
	}
}

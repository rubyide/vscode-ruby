import { ILinter } from './BaseLinter';
import { Observable, of } from 'rxjs';
import { Diagnostic } from 'vscode-languageserver';
import log from 'loglevel';

export default class NullLinter implements ILinter {
	private readonly msg: string;

	constructor(msg: string) {
		this.msg = msg;
	}

	lint(): Observable<Diagnostic[]> {
		log.warn(`Lint: ${this.msg}`);
		return of([]);
	}
}

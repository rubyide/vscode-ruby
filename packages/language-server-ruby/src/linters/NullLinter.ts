import { ILinter } from './BaseLinter';
import { Observable, of } from 'rxjs';
import { Diagnostic } from 'vscode-languageserver';

export default class NullLinter implements ILinter {
	private msg: string;

	constructor(msg: string) {
		this.msg = msg;
	}

	lint(): Observable<Diagnostic[]> {
		console.error(`Lint: ${this.msg}`);
		return of([]);
	}
}

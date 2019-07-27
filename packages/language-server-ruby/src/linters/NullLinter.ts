import { ILinter } from './BaseLinter';
import { Observable, of } from 'rxjs';
import { Diagnostic } from 'vscode-languageserver';

export default class NullLinter implements ILinter {
	private name: string;

	constructor(name: string) {
		this.name = name;
	}

	lint(): Observable<Diagnostic[]> {
		console.error(`Lint: attempted to lint with unsupported linter: ${this.name}`);
		return of([]);
	}
}

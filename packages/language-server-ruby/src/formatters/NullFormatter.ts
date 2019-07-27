import { IFormatter } from './BaseFormatter';
import { Observable, of } from 'rxjs';
import { TextEdit } from 'vscode-languageserver';

export default class NullFormatter implements IFormatter {
	format(): Observable<TextEdit[]> {
		return of([]);
	}
}

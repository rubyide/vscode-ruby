import { URI } from 'vscode-uri'
import BaseFormatter from './BaseFormatter';

export default class RubyFMT extends BaseFormatter {
	get cmd(): string {
		return 'rubyfmt';
	}

	get args(): string[] {
		const documentPath = URI.parse(this.document.uri);
		return [documentPath.fsPath];
	}

	get useBundler(): boolean {
		return false;
	}
}

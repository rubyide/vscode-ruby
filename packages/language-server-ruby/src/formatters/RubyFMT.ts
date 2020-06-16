import BaseFormatter from './BaseFormatter';

export default class RubyFMT extends BaseFormatter {
	get cmd(): string {
		return 'rubyfmt';
	}

	get args(): string[] {
		return [];
	}

	get useBundler(): boolean {
		return false;
	}
}

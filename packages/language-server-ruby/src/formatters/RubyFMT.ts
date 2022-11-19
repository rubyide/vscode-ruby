import BaseFormatter from './BaseFormatter';

export default class RubyFMT extends BaseFormatter {
	get cmd(): string {
		return 'rubyfmt';
	}

	get args(): string[] {
		const args = ['--header-opt-out'];
		return args;
	}

	get useBundler(): boolean {
		return false;
	}
}

import path from 'path';
import BaseFormatter from './BaseFormatter';

const RUBYFMT_PATH = path.resolve(__dirname, 'rubyfmt.rb');

export default class RubyFMT extends BaseFormatter {
	get cmd(): string {
		return 'ruby';
	}

	get args(): string[] {
		return ['--disable=gems', RUBYFMT_PATH];
	}

	get useBundler(): boolean {
		return false;
	}
}

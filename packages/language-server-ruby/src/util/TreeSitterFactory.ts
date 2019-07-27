import path from 'path';
import Parser from 'web-tree-sitter';

const TREE_SITTER_RUBY_WASM = path.join(__dirname, '..', 'tree-sitter-ruby.wasm');

export default class TreeSitterFactory {
	static language: any;

	static async initalize() {
		await Parser.init();
		console.debug(`Loading Ruby tree-sitter syntax from ${TREE_SITTER_RUBY_WASM}`);
		this.language = await Parser.Language.load(TREE_SITTER_RUBY_WASM);
	}

	static build() {
		const parser = new Parser();
		parser.setLanguage(this.language);
		return parser;
	}
}

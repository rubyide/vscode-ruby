import path from 'path';
import fs from 'fs';
import Parser from 'web-tree-sitter';

const TREE_SITTER_RUBY_WASM = ((): string => {
	let wasmPath = path.resolve(__dirname, 'tree-sitter-ruby.wasm');
	if (!fs.existsSync(wasmPath)) {
		wasmPath = path.resolve(__dirname, '..', 'tree-sitter-ruby.wasm');
	}

	return wasmPath;
})();

const TreeSitterFactory = {
	language: null,

	async initalize(): Promise<void> {
		await Parser.init();
		console.debug(`Loading Ruby tree-sitter syntax from ${TREE_SITTER_RUBY_WASM}`);
		this.language = await Parser.Language.load(TREE_SITTER_RUBY_WASM);
	},

	build(): Parser {
		const parser = new Parser();
		parser.setLanguage(this.language);
		return parser;
	},
};
export default TreeSitterFactory;

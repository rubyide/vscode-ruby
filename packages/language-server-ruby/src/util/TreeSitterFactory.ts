import log from 'loglevel';
import Parser from 'web-tree-sitter';
import Ruby from 'web-tree-sitter-ruby';

const TreeSitterFactory = {
	language: null,

	async initalize(): Promise<void> {
		await Parser.init();
		log.debug(`Loading Ruby tree-sitter syntax from ${Ruby}`);
		this.language = await Parser.Language.load(Ruby);
	},

	build(): Parser {
		const parser = new Parser();
		parser.setLanguage(this.language);
		return parser;
	},
};
export default TreeSitterFactory;

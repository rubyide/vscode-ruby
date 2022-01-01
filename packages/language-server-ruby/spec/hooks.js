const path = require('path');
const fs = require('fs');
const Parser = require('web-tree-sitter');
const Ruby = require('web-tree-sitter-ruby').default;

class FixtureLoader {
	async initialize() {
		await Parser.init();
		const language = await Parser.Language.load(Ruby);
		this.parser = new Parser();
		this.parser.setLanguage(language);
	}

	load(name) {
		const content = fs.readFileSync(path.join(__filename, '..', 'fixtures', name)).toString();

		return {
			content,
			tree: this.parser.parse(content),
		};
	}
}
exports.mochaHooks = {
	async beforeAll() {
		global.loader = new FixtureLoader();
		await global.loader.initialize();
	}
}


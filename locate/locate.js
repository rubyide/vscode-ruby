'use strict';
const locator = require('ruby-method-locate'),
	minimatch = require('minimatch');
const fs = require('fs'),
	path = require('path');
const _ = require('lodash');

const DECLARATION_TYPES = ['class', 'module', 'method', 'classMethod'];

function flatten(locateInfo, file, containerName = '') {
	return _.flatMap(locateInfo, (symbols, type) => {
		if (!_.includes(DECLARATION_TYPES, type)) {
			// Skip top-level include or posn property etc.
			return [];
		}
		return _.flatMap(symbols, (inner, name) => {
			const posn = inner.posn || { line: 0, char: 0 };
			const symbolInfo = {
				name: name,
				type: type,
				file: file,
				line: posn.line,
				char: posn.char,
				containerName: containerName || ''
			};
			_.extend(symbolInfo, _.omit(inner, DECLARATION_TYPES));
			const sep = { method: '#', classMethod: '.' }[type] || '::';
			const fullName = containerName ? `${containerName}${sep}${name}` : name;
			return [symbolInfo].concat(flatten(inner, file, fullName));
		});
	});
}
function camelCaseRegExp(query) {
	const escaped = _.escapeRegExp(query)
	const prefix = escaped.charAt(0);
	return new RegExp(
		`[${prefix.toLowerCase()}${prefix.toUpperCase()}]` +
		escaped.slice(1).replace(/[A-Z]|([a-z])/g, (char, lower) => {
			if (lower) return `[${char.toUpperCase()}${char}]`;
			const lowered = char.toLowerCase()
			return `.*(?:${char}|_${lowered})`;
		})
	);
}
function filter(symbols, query, matcher) {
	// TODO: Ask MS to expose or separate matchesFuzzy method.
	// https://github.com/Microsoft/vscode/blob/a1d3c8a3006d0a3d68495122ea09a2a37bca69db/src/vs/base/common/filters.ts
	const isLowerCase = (query.toLowerCase() === query)
	const exact = new RegExp('^' + _.escapeRegExp(query) + '$', 'i');
	const prefix = new RegExp('^' + _.escapeRegExp(query), 'i');
	const substring = new RegExp(_.escapeRegExp(query), isLowerCase ? 'i' : '');
	const camelCase = camelCaseRegExp(query);
	return _([exact, prefix, substring, camelCase])
		.flatMap(regexp => symbols.filter(symbolInfo => matcher(symbolInfo, regexp)))
		.uniq()
		.value();
}
module.exports = class Locate {
	constructor(root, settings) {
		this.settings = settings;
		this.root = root;
		this.tree = {};
		// begin the build ...
		this.walk(this.root);
		// add edit hooks
		// always: do this file now (if it's in the tree)
		// add lookup hooks
	}
	listInFile(absPath) {
		const waitForParse = (absPath in this.tree) ? Promise.resolve() : this.parse(absPath);
		return waitForParse.then(() => _.clone(this.tree[absPath] || []));
	}
	find(name) {
		// because our word pattern is designed to match symbols
		// things like Gem::RequestSet may request a search for ':RequestSet'
		const escapedName = _.escapeRegExp(_.trimStart(name, ':'));
		const regexp = new RegExp(`^${escapedName}=?\$`);
		return _(this.tree)
			.values()
			.flatten()
			.filter(symbol => regexp.test(symbol.name))
			.map(_.clone)
			.value();
	}
	query(query) {
		const segmentMatch = query.match(/^(?:([^.#:]+)(.|#|::))([^.#:]+)$/) || [];
		const containerQuery = segmentMatch[1];
		const separator = segmentMatch[2];
		const nameQuery = segmentMatch[3];
		const separatorToTypesTable = {
			'.': ['classMethod', 'method'],
			'#': ['method'],
			'::': ['class', 'module'],
		};
		const segmentTypes = separatorToTypesTable[separator];
		const symbols = _(this.tree).values().flatten().value();

		// query whole name (matches `class Foo::Bar` or `def File.read`)
		const plainMatches = filter(symbols, query, (symbolInfo, regexp) => regexp.test(symbolInfo.name));
		if (!containerQuery) return plainMatches;

		// query name and containerName separatedly (matches `def foo` in `class Bar`)
		const nameMatches = filter(symbols, nameQuery, (symbolInfo, regexp) => {
			return _.includes(segmentTypes, symbolInfo.type) && regexp.test(symbolInfo.name);
		});
		const containerMatches = filter(nameMatches, containerQuery, (symbolInfo, regexp) => regexp.test(symbolInfo.containerName))
		return _.uniq(plainMatches.concat(containerMatches));
	}
	rm(absPath) {
		if (absPath in this.tree) delete this.tree[absPath];
	}
	parse(absPath) {
		const relPath = path.relative(this.root, absPath);
		if (this.settings.exclude && minimatch(relPath, this.settings.exclude)) return;
		if (this.settings.include && !minimatch(relPath, this.settings.include)) return;
		return locator(absPath)
			.then(result => {
				this.tree[absPath] = result ? flatten(result, absPath) : [];
			}, err => {
				if (err.code === 'EMFILE') {
					// if there are too many open files
					// try again after somewhere between 0 & 50 milliseconds
					setTimeout(this.parse.bind(this, absPath), Math.random() * 50);
				} else {
					// otherwise, report it
					console.log(err);
					this.rm(absPath);
				}
			});
	}
	walk(root) {
		fs.readdir(root, (err, files) => {
			if (err) return;
			files.forEach(file => {
				const absPath = path.join(root, file);
				const relPath = path.relative(this.root, absPath);
				fs.stat(absPath, (err, stats) => {
					if (err) return;
					if (stats.isDirectory()) {
						if (this.settings.exclude && minimatch(relPath, this.settings.exclude)) return;
						this.walk(absPath);
					} else {
						this.parse(absPath);
					}
				});
			});
		});
	}
};

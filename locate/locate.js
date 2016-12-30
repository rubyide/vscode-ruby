'use strict';
const locator = require('ruby-method-locate'),
	minimatch = require('minimatch');
const fs = require('fs'),
	path = require('path');
const _ = require('lodash');

const DECLARATION_TYPES = ['class', 'module', 'method', 'classMethod'];

function flatten(locateInfo, file, parent) {
	return _.flatMap(locateInfo, (symbols, type) => {
		if (!_.includes(DECLARATION_TYPES, type)) {
			// Skip top-level include or posn property etc.
			return [];
		}
		return _.flatMap(symbols, (inner, name) => {
			const sep = { method: '#', classMethod: '.' }[type] || '::';
			const posn = inner.posn || { line: 0, char: 0 };
			const fullName = parent ? `${parent.fullName}${sep}${name}` : name;
			const symbolInfo = {
				name: name,
				type: type,
				file: file,
				line: posn.line,
				char: posn.char,
				parent: parent,
				fullName: fullName
			};
			_.extend(symbolInfo, _.omit(inner, DECLARATION_TYPES));
			return [symbolInfo].concat(flatten(inner, file, symbolInfo));
		});
	});
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

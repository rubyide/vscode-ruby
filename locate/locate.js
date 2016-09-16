'use strict';
const locator = require('ruby-method-locate'),
	minimatch = require('minimatch');
const fs = require('fs'),
	path = require('path');

function find(name, tree, prefix, result) {
	if (typeof tree === 'number' || typeof tree === 'string') return;
	prefix = prefix || [];
	result = result || [];
	let block;
	let set;
	for (let b in tree) {
		if (b === 'posn' || b === 'args' || b === 'inherit') continue;
		block = tree[b];
		if (name in block && block[name].posn) {
			result.push({
					[prefix.concat(name)
					.join('::')]: {
						line: block[name].posn.line,
						char: block[name].posn.char
			}});
		}
		for (let n in block) {
			set = block[n];
			find(name, set, prefix.concat(n), result);
		}
	}
	return result;
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
	find(name) {
		let result = [];
		let tree;
		let inner;
		for (let file in this.tree) {
			tree = this.tree[file];
			// every second step may be the thing we want
			inner = find(name, tree);
			// jshint -W083
			result = result.concat(inner.map(i => {
				for (let a in i) i[a].file = file;
				return i;
			}));
			// jshint +W083
		}
		return result;
	}
	walk(root) {
		fs.readdir(root, (err, files) => {
			if (err) return;
			files.forEach(file => {
				const absPath = path.join(root, file);
				const relPath = path.relative(this.root, absPath);
				if (this.settings.ignore) {
					if (typeof this.settings.ignore === "string") {
						if (minimatch(relPath, this.settings.ignore)) return;
					} else if (this.settings.ignore.some(pattern => minimatch(relPath, pattern))) return;
				}
				fs.stat(absPath, (err, stats) => {
					if (err) return;
					if (stats.isDirectory()) {
						if (this.settings.includeDirectory) {
							if (typeof this.settings.includeDirectory === "string") {
								if (!minimatch(relPath, this.settings.includeDirectory)) return;
							} else if (!this.settings.includeDirectory.some(pattern => minimatch(relPath, pattern))) return;
						}
						this.walk(absPath);
					} else {
						if (this.settings.include) {
							if (typeof this.settings.include === "string") {
								if (!minimatch(relPath, this.settings.include)) return;
							} else if (!this.settings.include.some(pattern => minimatch(relPath, pattern))) return;
						}
						locator(absPath)
							.then(result => {
								if (!result) return;
								this.tree[absPath] = result;
							}, (err) => console.log(err));
					}
				});
			});
		});
	}
};

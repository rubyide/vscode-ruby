'use strict';
const locator = require('ruby-method-locate'),
	minimatch = require('minimatch');
const fs = require('fs'),
	path = require('path');

function flatten(tree, result) {
	let t;
	for (let a in tree) {
		t = tree[a];
		if (typeof t === 'string' || typeof t === 'number') continue;
		if (t.posn) {
			if (a in result) result[a].push({
				line: t.posn.line,
				char: t.posn.char
			});
			else result[a] = [{
				line: t.posn.line,
				char: t.posn.char
			}];
		}
		flatten(t, result);
	}
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
		for (let file in this.tree) {
			tree = this.tree[file];
			//jshint -W083
			const extract = obj => ({
				file: file,
				line: obj.line,
				char: obj.char
			});
			//jshint +W083
			for (let n in tree) {
				// because our word pattern is designed to match symbols
				// things like Gem::RequestSet may request a search for ':RequestSet'
				if (n === name || n === name + '=' || ':' + n === name) {
					result = result.concat(tree[n].map(extract));
				}
			}
		}
		return result;
	}
	rm(absPath) {
		if (absPath in this.tree) delete this.tree[absPath];
	}
	parse(absPath) {
		const relPath = path.relative(this.root, absPath);
		if (this.settings.exclude && minimatch(relPath, this.settings.exclude)) return;
		if (this.settings.include && !minimatch(relPath, this.settings.include)) return;
		this.rm(absPath);
		locator(absPath)
			.then(result => {
				if (!result) return;
				this.tree[absPath] = {};
				flatten(result, this.tree[absPath]);
			}, err => {
				if (err.code === 'EMFILE') {
					// if there are too many open files
					// try again after somewhere between 0 & 50 milliseconds
					setTimeout(this.parse.bind(this, absPath), Math.random() * 50);
				} else {
					// otherwise, report it
					console.log(err);
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
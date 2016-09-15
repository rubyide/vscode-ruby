'use strict';
const locator = require('ruby-method-locate'),
	minimatch = require('minimatch');
const fs = require('fs'),
	path = require('path');

function find(name, tree, result) {
	if (typeof tree === 'number' || typeof tree === 'string') return;
	let block;
	let set;
	for (let b in tree) {
		block = tree[b];
		for (let n in block) {
			if (n === name) {
				result.push({
					[n]: block[n]
				});
			}
			set = block[n];
			let myRes = [];
			find(name, set, myRes);
			result = result.concat(myRes.map(r => n +  ))
		}
	}
}
module.exports = class Locate {
	constructor(root, settings) {
		this.settings = settings;
		this.root = root;
		this.tree = {};
		// begin the build ...
		// add edit hooks
		// always: do this file now (if it's in the root)
		// add lookup hooks
	}
	find(name) {
		const result = [];
		let tree;
		for (let file in this.tree) {
			tree = this.tree[file];
			// every second step may be the thing we want
		}
	}
	walk(root) {
		fs.readDir(root, (err, files) => {
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
						fs.readFile(absPath, (err, buffer) => {
							if (err) return;
							locator(buffer.toString(), absPath)
								.then(result => {
									if (!result) return;
									this.tree[relPath] = result;
								}, err => 0);
						});
					}
				});
			});
		});
	}
};

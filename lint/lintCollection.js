'use strict';

const Linter = require('./lib/linter');
const LintResults = require('./lib/lintResults');

class LintCollection {
	constructor(config) {
		this._results = {};
		this._docLinters = {};
		this._cfg = {};
		this.cfg(config);
	}
	run(doc) {
		if (!doc) return;
		if (doc.languageId !== 'ruby') return;
		if (!this._docLinters[doc.fileName]) this._docLinters[doc.fileName] = new Linter(doc, this._update.bind(this, doc));
		this._docLinters[doc.fileName].run(this._cfg);
	}
	_update(doc, result) {
		const linter = result.linter;
		if (!this._results[linter]) this._results[linter] = new LintResults(linter);
		this._results[linter].updateForFile(doc.uri, result);
		return Promise.resolve();
	}
	cfg(newConfig) {
		let activeLinters = Object.keys(this._cfg);
		let toRemove = activeLinters.filter(l => !(l in newConfig) || !newConfig[l]);
		toRemove.forEach(l => {
			if (this._results[l]) {
				this._results[l].dispose();
				delete this._results[l];
			}
			delete this._cfg[l];
		});
		// we change the config internally, so that the config of any (awaiting) linters will be updated by reference
		for (let l in newConfig) {
			if (newConfig[l]) this._cfg[l] = newConfig[l];
		}
	}
	dispose() {
		for (let l in this._results) this._results[l].dispose();
	}
}

module.exports = LintCollection;
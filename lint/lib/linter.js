'use strict';

const fs = require('./fsPromise'),
	path = require('path'),
	os = require('os'),
	cp = require('child_process');

//load linters
let lintBuilders = {};

fs.readdirSync(path.join(__dirname, 'linters'))
	.forEach(file => {
		if (!file.endsWith(".js")) return;
		lintBuilders[file.slice(0, -3).toLowerCase()] = require(path.join(__dirname, 'linters', file));
	});

class Linter {
	constructor(doc, cb) {
		this.doc = doc;
		this.cb = cb;
		this.linting = {};
		this.cfg = {};
	}
	run(cfg) { // cfg can change over time
		if (this.timer) clearTimeout(this.timer);
		this.cfg = cfg;
		for (let l in cfg) {
			if (!this.linting[l]) this.linting[l] = {};
			this.linting[l].pend = true;
		}
		return this._runLinters();
	}
	_copySettings(settings, basePath, tmpDir) {
		const opName = path.join(tmpDir, settings);
		let sourcePath = basePath.slice();
		let sourceFile;
		while (!sourceFile) {
			try {
				fs.accessSync(path.join(sourcePath, settings), fs.R_OK);
				sourceFile = path.join(sourcePath, settings);
			} catch (e) {
				const tmpPath = path.dirname(sourcePath);
				if (tmpPath === sourcePath) break;
				sourcePath = tmpPath;
			}
		}
		if (!sourceFile) {
			//try home
			try {
				sourceFile = path.join(process.env.HOME, (settings.startsWith('.') ? '' : '.') + settings);
				fs.accessSync(sourceFile, fs.R_OK);
			} catch (e) {
				return Promise.resolve(); //none to be had
			}
		}
		return fs.link(sourceFile, opName).then(() => opName);
	}
	_exeLinter(svc, cmdOpts) {
		return new Promise((resolve, reject) => {
				const args = svc.args.map(arg => arg.replace("{path}", cmdOpts.file || ""));
				const spawned = cp.spawn(path.join(svc.path || "", svc.exe + svc.ext), args, {
					cwd: cmdOpts.dir,
					env: process.env
				});
				let result = "";
				let error = "";
				spawned[svc.responsePath].on("data", d => result += d.toString());
				if (svc.errorPath)
					spawned[svc.errorPath].on("data", d => error += d.toString());
				spawned.on("exit", () => {
					resolve({
						linter: svc.exe,
						lintError: svc.processError ? svc.processError(error) : [],
						result: svc.processResult(result)
					});
				});
				spawned.on("error", e => reject(e));
				if (cmdOpts.data) spawned.stdin.end(cmdOpts.data);
			})
			.catch(e => ({
				error: e,
				linter: svc.exe,
				source: svc.exe
			}));
	}
	_runLinters() {
		const toRun = [];
		for (let l in this.linting) {
			// if the config has changed, and we're not in it, delete
			if (!(l in this.cfg)) {
				delete this.linting[l];
				continue;
			}
			if (!this.linting[l].active && this.linting[l].pend) {
				toRun.push(new lintBuilders[l](this.cfg[l]));
				this.linting[l].active = true;
				this.linting[l].pend = false;
			}
		}
		if (toRun.length === 0) return;
		const doc = this.doc;
		const sourceDir = path.dirname(doc.fileName);

		const final = result => this.cb(result)
			.then(() => {
				this.linting[result.linter].active = false;
				if (this.linting[result.linter].pend) this._runLinters();
			});

		// if any of the runs need a temp file:
		const needsTmpFile = toRun.some(svc => svc.tmp);
		const tmpFileSvc = tmpDir => toRun.filter(svc => svc.tmp).map(svc => {
			let prom;
			if (svc.settings) {
				prom = this._copySettings(svc.settings, sourceDir, tmpDir)
					.then(settingsFile => this._exeLinter(svc, {
							dir: tmpDir,
							file: '1.rb'
						})
						.then(result => {
							if (settingsFile) fs.unlink(settingsFile);
							return result;
						}));
			} else prom = this._exeLinter(svc, {
				dir: tmpDir,
				file: '1.rb'
			});
			return prom.then(final);
		});
		const noTmpFileSvc = () => toRun.filter(svc => !svc.tmp).map(svc => this._exeLinter(svc, {
			dir: sourceDir,
			data: doc.getText()
		}).then(final));

		let executor = Promise.resolve();

		if (needsTmpFile) {
			const tmpDir = path.join(os.tmpdir(), 'vscode_ruby_lint');
			executor = fs.mkdir(tmpDir).then(() => {
				const tmpFile = path.join(tmpDir, '1.rb');
				return fs.writeFile(tmpFile, doc.getText())
					.then(() => Promise.all(tmpFileSvc(tmpDir).concat(noTmpFileSvc())))
					.then(() => fs.unlink(tmpFile));
			}).then(() => fs.rmdir(tmpDir));
		} else executor.then(() => Promise.all(noTmpFileSvc()));

		return executor.catch(e => console.log("Error linting:", e));
	}
}

module.exports = Linter;
"use strict";
const fs = require('fs'),
	path = require('path'),
	cp = require('child_process'),
	os = require('os');

const findCfg = checkPath => {
	try {
		fs.accessSync(path.join(checkPath, '.rubocop.yml'));
		return checkPath;
	} catch (e) {
		let nextCheckPath = path.dirname(checkPath);
		if (nextCheckPath && nextCheckPath !== checkPath) return findCfg(nextCheckPath);
	}
};

class AutoCorrect {
	constructor(opts) {
		this.exe = "rubocop";
		this.ext = process.platform === 'win32' ? ".bat" : "";
		this.exe += this.ext;
		if (opts.exe) this.exe = opts.exe;
	}
	test() {
		return new Promise((resolve, reject) => {
			const rubo = cp.spawn(this.exe, ['-v']);
			let rejected = false;
			rubo.on("error", () => {
				rejected = true;
				reject();
			});
			rubo.on("exit", e => {
				if (rejected) return;
				if (e) return reject();
				resolve();
			});
		});
	}
	correct(data, root, opts) {
		// we get opts again here, incase it has changed
		let cfgPath;
		let exe = "rubocop" + this.ext;
		let args = ["-a", "-f", "simple"];
		if (root) cfgPath = findCfg(root);
		if (cfgPath) args = args.concat(["-c", path.join(cfgPath, '.rubocop.yml')]);
		if (opts.exe) exe = opts.exe;
		if (opts.lint) args.push("-l");
		if (opts.only) args = args.concat("--only", opts.only.join(','));
		if (opts.except) args = args.concat("--except", opts.except.join(','));
		if (opts.rails) args.push('-R');
		if (opts.require) args = args.concat("-r", opts.require.join(','));
		return new Promise((resolve, reject) => fs.mkdtemp(path.join(os.tmpdir(), 'rubocop'), (err, folder) => {
			if (err) return reject(err);
			let file = path.join(folder, 'tmp.rb');
			args.push(file);
			fs.writeFile(file, data, err => {
				if (err) return reject(err);
				const rubo = cp.spawn(exe, args, {
					cwd: root || process.cwd(),
					env: process.env
				});
				let rejected = false;
				rubo.on("exit", (e) => {
					if (rejected) return;
					fs.readFile(file, 'utf8', (err, result) => {
						if (err) reject(err);
						resolve(result);
					});
				});
				rubo.on("error", e => {
					rejected = true;
					reject(e);
				});
			});
		}));
	}
}

module.exports = AutoCorrect;
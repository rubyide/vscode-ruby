"use strict";
const fs = require('fs'),
	path = require('path'),
	cp = require('child_process'),
	os = require('os');

function ruboCopAutoCorrect(data, root, opts) {
	let exe = "rubocop",
		ext = process.platform === 'win32' ? ".bat" : "";
	exe += ext;
	let args = ["-a", "-f", "simple"];
	if (opts.exe) exe = opts.exe;
	if (opts.lint) args.push("-l");
	if (opts.only) args = args.concat("--only", opts.only.join(','));
	if (opts.except) args = args.concat("--except", opts.except.join(','));
	if (opts.rails) args.push('-R');
	if (opts.require) args = args.concat("-r", opts.require.join(','));
	return new Promise((resolve, reject) => fs.mkdtemp(path.join(os.tmpdir(), 'rubocop'), (err, folder) => {
		if (err) return reject(err);
		let file = path.join(folder, 'tmp.rb');
		args.push(file)
		fs.writeFile(file, data, err => {
			if (err) return reject(err);
			console.log("Wrote file");
			let rubo = cp.spawn(exe, args, {
				cwd: root,
				env: process.env
			});
			rubo.on("exit", () => {
				console.log("finished thanks");
				fs.readFile(file, 'utf8', (err, result) => {
					if (err) reject(err);
					console.log("Read and cleaned", data.length, result.length);
					resolve(result);
				});
			});
			rubo.on("error", e => reject(result));
		});
	}));
}
module.exports = ruboCopAutoCorrect;

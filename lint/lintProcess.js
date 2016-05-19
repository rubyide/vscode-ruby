"use strict";

const cp = require("child_process"),
	fs = require('./fsPromise'),
	path = require('path'),
	os = require('os');

//load linters
let lintBuilders = {};
let activeProcesses = {};
fs.readdirSync(path.join(__dirname, 'linters'))
	.forEach(file => {
		if (!file.endsWith(".js")) return;
		lintBuilders[file.slice(0, -3)
			.toLowerCase()] = require(`./linters/${file}`);
	});

let tDirNr = 0;

function exeLinter(svc, cmdOpts) {
	let timer = process.hrtime();
	return new Promise((resolve, reject) => {
			const args = svc.args.map(arg => arg.replace("{path}", cmdOpts.file || ""));
			const spawned = cp.spawn(path.join(svc.path || "", svc.exe + svc.ext), args, {
				cwd: cmdOpts.dir,
				env: process.env
			});
			activeProcesses[svc.exe] = spawned;
			let result = "";
			let error = "";
			spawned[svc.responsePath].on("data", d => result += d.toString());
			if (svc.errorPath)
				spawned[svc.errorPath].on("data", d => error += d.toString());
			spawned.on("exit", () => {
				delete activeProcesses[svc.exe];
				resolve({
					linter: svc.exe,
					lintError: svc.processError ? svc.processError(error) : [],
					result: svc.processResult(result),
					time: process.hrtime(timer)
				});
			});
			spawned.on("error", e => {
				delete activeProcesses[svc.exe];
				reject(e);
			});
			if (cmdOpts.data) spawned.stdin.end(cmdOpts.data);
		})
		.then(result => process.send(result))
		.catch(e => process.send({
			error: e,
			source: svc.exe
		}));
}

function copySettings(settings, tmpDir) {
	const opName = path.join(tmpDir, settings);
	let sourcePath = process.cwd()
		.slice();
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
			sourceFile = path.join(process.env.HOME, (settings.startsWith('.') ? "" : '.') + settings);
			fs.accessSync(sourceFile, fs.R_OK);
		} catch (e) {
			return Promise.resolve(); //none to be had
		}
	}
	return fs.link(sourceFile, opName)
		.then((e) => {
			if (e) throw e;
			return opName;
		});
}

function run(opts) {
	let lintOptions = opts.linters;
	let lintServices = [];
	for (let lintName in lintOptions) {
		if (lintName in lintBuilders) {
			lintServices.push(new lintBuilders[lintName](lintOptions[lintName]));
		}
	}
	let tmpDir;
	let tmpData;
	let tempFileSvc = lintServices.filter(svc => svc.temp);
	if (tempFileSvc.length) {
		tmpDir = path.join(os.tmpdir(), process.pid + "_" + (tDirNr++));
		fs.mkdir(tmpDir)
			.then(() => {
				tmpData = path.join(tmpDir, "1.rb");
				return fs.writeFile(tmpData, opts.data)
					.then(() =>
						Promise.all(tempFileSvc.map(svc => {
							if (svc.settings) {
								return copySettings(svc.settings, tmpDir)
									.then(fName => exeLinter(svc, {
											dir: tmpDir,
											file: '1.rb'
										})
										.then(() => fName ? fs.unlink(fName) : 0));
							} else return exeLinter(svc, {
								dir: tmpDir,
								file: '1.rb'
							});
						})))
					.then(() => fs.unlink(tmpData));
			})
			.then(() => fs.rmdir(tmpDir))
			.catch(e => {
				process.send({
					error: e,
					source: 'main_temp'
				});
			});
	}
	Promise.all(lintServices.filter(svc => !svc.temp)
			.map(svc => {
				return exeLinter(svc, {
					dir: process.cwd(),
					data: opts.data
				});
			}))
		.catch(e => {
			process.send({
				error: e,
				source: 'main_local'
			});
		});
}

let stop = () => {
	for (let proc in activeProcesses) {
		activeProcesses[proc].kill();
		delete activeProcesses[proc];
	}
	process.exit();
};

process.on('message', t => t === 'stop' ? stop() : run(t));

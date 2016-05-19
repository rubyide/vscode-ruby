"use strict";

const cp = require('child_process'),
	path = require('path');

function lintCollectionClient(linters, filePath, data, cb) {
	const service = cp.fork(path.join(__dirname, 'lintProcess.js'), {
		cwd: path.dirname(filePath),
		env: process.env,
		execArgv: [],
		silent: true
	});
	service.on('error', (e) => console.log("ERROR:", e));
	service.send({
		linters: linters,
		data: data
	});

	service.on('message', cb);
	return service;
}

exports.runCollection = lintCollectionClient;

/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *
 *  Modified for use in vscode-ruby
 *  Original file here: https://github.com/Microsoft/vscode/blob/master/build/npm/update-grammar.js
 *--------------------------------------------------------------------------------------------*/

'use strict';

var path = require('path');
var fs = require('fs');
var cson = require('cson-parser');
var https = require('https');
var url = require('url');

function getOptions(urlString) {
	var _url = url.parse(urlString);
	var headers = {
		'User-Agent': 'VSCode'
	};
	var token = process.env['GITHUB_TOKEN'];
	if (token) {
		headers['Authorization'] = 'token ' + token
	}
	return {
		protocol: _url.protocol,
		host: _url.host,
		port: _url.port,
		path: _url.path,
		headers: headers
	};
}

function download(url, redirectCount) {
	return new Promise((c, e) => {
		var content = '';
		https.get(getOptions(url), function (response) {
			response.on('data', function (data) {
				content += data.toString();
			}).on('end', function () {
				let count = redirectCount || 0;
				if (count < 5 && response.statusCode >= 300 && response.statusCode <= 303 || response.statusCode === 307) {
					let location = response.headers['location'];
					if (location) {
						console.log("Redirected " + url + " to " + location);
						download(location, count+1).then(c, e);
						return;
					}
				}
				c(content);
			});
		}).on('error', function (err) {
			e(err.message);
		});
	});
}

function grammarToTmLanguage(grammar) {
	grammar = grammar.toLowerCase();
	switch(grammar) {
		case 'ruby':
			var file = 'ruby.cson';
			break;
		case 'gemfile':
			file = 'gemfile.cson';
			break;
		case 'erb':
			file = 'html (ruby - erb).cson';
			break;
	}

	return 'grammars/' + file;
}

function getCommitSha(repoId, repoPath) {
	var commitInfo = 'https://api.github.com/repos/' + repoId + '/commits?path=' + repoPath;
	return download(commitInfo).then(function (content) {
		try {
			let lastCommit = JSON.parse(content)[0];
			return Promise.resolve({
				commitSha: lastCommit.sha,
				commitDate: lastCommit.commit.author.date
			});
		} catch (e) {
			console.error("Failed extracting the SHA: " + content);
			return Promise.resolve(null);
		}
	}, function () {
		console.error('Failed loading ' + commitInfo);
		return Promise.resolve(null);
	});
}

function modifyRubyGrammar(grammar) {
	const metaFunctionCallRuby = require('./meta.function-call.ruby.json');
	const variableOtherRuby = require('./variable.other.ruby.json');

	// Replace the constant.other.symbol scope with constant.language.symbol
	// this is technically incorrect per the docs but a lot of themes do not
	// have colors defined for constant.other.symbol resulting in users
	// believing there is no syntax highlighting
	let stringPatterns = JSON.stringify(grammar.patterns);
	stringPatterns = stringPatterns.replace(/constant\.other\.symbol/g, 'constant.language.symbol');
	grammar.patterns = JSON.parse(stringPatterns);

	// Insert meta.function-call.ruby and variable.other.ruby at end
	grammar.patterns.push(metaFunctionCallRuby, variableOtherRuby);
}

function getGrammarModifier(grammarName) {
	switch(grammarName) {
		case 'ruby':
			return modifyRubyGrammar;
	}
}

exports.update = function (repoId, repoPath, dest, modifyGrammar, version = 'master') {
	var contentPath = 'https://raw.githubusercontent.com/' + repoId + `/${version}/` + repoPath;
	console.log('Reading from ' + contentPath);
	return download(contentPath).then(function (content) {
		var ext = path.extname(repoPath);
		var grammar;
		if (ext === '.cson') {
			grammar = cson.parse(content);
		} else {
			console.error('Unknown file extension: ' + ext);
			return;
		}
		if (modifyGrammar) {
			modifyGrammar(grammar);
		}
		return getCommitSha(repoId, repoPath).then(function (info) {
			let result = {
				information_for_contributors: [
					'This file has been converted from https://github.com/' + repoId + '/blob/master/' + repoPath,
					'If you want to provide a fix or improvement, please create a pull request against the original repository.',
					'Once accepted there, we are happy to receive an update request.'
				]
			};

			if (info) {
				result.version = 'https://github.com/' + repoId + '/commit/' + info.commitSha;
			}
			for (let key in grammar) {
				if (!result.hasOwnProperty(key)) {
					result[key] = grammar[key];
				}
			}

			try {
				fs.writeFileSync(dest, JSON.stringify(result, null, '\t'));
				if (info) {
					console.log('Updated ' + path.basename(dest) + ' to ' + repoId + '@' + info.commitSha.substr(0, 7) + ' (' + info.commitDate.substr(0, 10) + ')');
				} else {
					console.log('Updated ' + path.basename(dest));
				}
			} catch (e) {
				console.error(e);
			}
		});

	}, console.error);
};

if (path.basename(process.argv[1]).indexOf('update-grammar') !== -1) {
	let repo = process.argv[2];
	let grammar = process.argv[3];
	let outputFile = path.join('syntaxes', grammar + '.cson.json');
	let repoFile = grammarToTmLanguage(grammar);
	exports.update(repo, repoFile, outputFile, getGrammarModifier(grammar));
}

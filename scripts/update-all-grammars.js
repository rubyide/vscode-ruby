/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *
 *  Modified for use in vscode-ruby
 *  Original file here: https://github.com/Microsoft/vscode/blob/master/build/npm/update-all-grammars.js
 *--------------------------------------------------------------------------------------------*/

const cp = require('child_process');
const npm = process.platform === 'win32' ? 'npm.cmd' : 'npm';

function updateGrammar(grammar) {
	const result = cp.spawnSync(npm, ['run', 'update-grammar', grammar], {
		stdio: 'inherit'
	});

	if (result.error || result.status !== 0) {
		process.exit(1);
	}
}

const extensions = [
	'erb',
	'gemfile',
	'ruby'
];

extensions.forEach(extension => updateGrammar(extension));
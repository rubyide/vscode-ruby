import execa from 'execa';
import defaultShell from 'default-shell';
import fs from 'fs';
import path from 'path';

const SHIM_DIR = path.resolve(__dirname, 'shims');
if (!fs.existsSync(SHIM_DIR)) {
	fs.mkdirSync(SHIM_DIR);
}

function mkShim(shell: string, shimPath: string): boolean {
	const template = `#!${shell} -i\nexport`;
	let result = false;

	try {
		fs.writeFileSync(shimPath, template);
		fs.chmodSync(shimPath, 0o744);
		result = true;
	} catch (e) {
		console.log(e);
	}

	return result;
}

function getShim(): string {
	const shellName: string = path.basename(defaultShell);
	const shimPath = path.join(SHIM_DIR, `env.${shellName}`);
	if (!fs.existsSync(shimPath)) {
		mkShim(defaultShell, shimPath);
	}

	return shimPath;
}

// Based on the dotenv parse function:
// https://github.com/motdotla/dotenv/blob/master/lib/main.js#L32
// modified to not have to deal with Buffers and to handle stuff
// like export and declare -x at the start of the line
function processExportLine(line: string): string[] {
	const result = [];
	// matching "KEY' and 'VAL' in 'KEY=VAL' with support for arbitrary prefixes
	const keyValueArr = line.match(/^(?:[\w-]*\s+)*([\w.-]+)\s*=\s*(.*)?\s*$/);
	if (keyValueArr != null) {
		const key = keyValueArr[1];

		// default undefined or missing values to empty string
		let value = keyValueArr[2] || '';

		// expand newlines in quoted values
		const len = value ? value.length : 0;
		if (len > 0 && value.charAt(0) === '"' && value.charAt(len - 1) === '"') {
			value = value.replace(/\\n/gm, '\n');
		}

		// remove any surrounding quotes and extra spaces
		value = value.replace(/(^['"]|['"]$)/g, '').trim();

		result.push(key, value);
	}

	return result;
}

const RUBY_ENVIRONMENT_VARIABLES = [
	'PATH',
	'RUBY_VERSION',
	'RUBY_ROOT',
	'GEM_HOME',
	'GEM_PATH',
	'GEM_ROOT',
	'HOME',
	'RUBOCOP_OPTS',
];

export type RubyEnvironment = {
	PATH: string;
	RUBY_VERSION: string;
	RUBY_ROOT: string;
	GEM_HOME: string;
	GEM_PATH: string;
	GEM_ROOT: string;
	HOME: string;
	RUBOCOP_OPTS?: string;
};

export interface IEnvironment {
	[key: string]: string;
}

export function loadEnv(cwd: string): RubyEnvironment {
	const shim: string = getShim();
	const env: IEnvironment = {};
	const { stdout, stderr } = execa.sync(shim, [], {
		cwd,
	});

	console.error(stderr);

	for (const line of stdout.split('\n')) {
		const result: string[] = processExportLine(line);
		if (RUBY_ENVIRONMENT_VARIABLES.indexOf(result[0]) >= 0) {
			env[result[0]] = result[1];
		}
	}

	return env as RubyEnvironment;
}

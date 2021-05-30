import spawn from 'cross-spawn';
import fs from 'fs';
import path from 'path';

const SHIM_DIR = path.resolve(__dirname, 'shims');

function isWindows(): boolean {
	return process.platform === 'win32';
}

function defaultShell(): string {
	if (isWindows()) {
		return process.env.COMSPEC || 'cmd.exe';
	}

	if (!process.env.SHELL) {
		return process.platform === 'darwin' ? '/bin/bash' : '/bin/sh';
	}

	return process.env.SHELL;
}

function shimExtension(shell: string): string {
	let extension = 'sh';
	if (shell.indexOf('fish') >= 0) extension = 'fish';
	else if (isWindows()) extension = 'cmd';
	return extension;
}

function getTemplate(shell: string): string {
	let template;
	if (isWindows()) {
		template = 'SET';
	} else if (shell.indexOf('fish') >= 0) {
		template = `#!${shell}
for name in (set -nx)
	if string match --quiet '*PATH' $name
		echo $name=(string join : -- $$name)
	else
		echo $name="$$name"
	end
end`;
	} else {
		template = `#!${shell} -i\nexport`;
	}

	return template;
}

function mkShim(shell: string, shimPath: string): boolean {
	const template = getTemplate(shell);
	let result = false;

	try {
		fs.writeFileSync(shimPath, template);
		fs.chmodSync(shimPath, 0o744);
		result = true;
	} catch (e) {
		console.error(e);
	}

	return result;
}

function getShellName(shell: string): string {
	const cleanShell = isWindows() ? path.basename(shell) : shell;
	return cleanShell.replace(/[\/\\]/g, '.');
}

function getShim(shell: string, shimDir: string): string {
	let shellName: string = getShellName(shell);
	if (shellName[0] === '.') shellName = shellName.slice(1);
	const shimPath = path.join(shimDir, `env.${shellName}.${shimExtension(shellName)}`);
	if (!fs.existsSync(shimDir)) {
		fs.mkdirSync(shimDir);
	}
	if (!fs.existsSync(shimPath)) {
		mkShim(shell, shimPath);
	}

	return shimPath;
}

// Based on the dotenv parse function:
// https://github.com/motdotla/dotenv/blob/main/lib/main.js#L32
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

function processEnvironment(output: string): IEnvironment {
	const env: IEnvironment = {};
	for (const line of output.split('\n')) {
		const result: string[] = processExportLine(line);
		const name = result[0];
		if (RUBY_ENVIRONMENT_VARIABLES.indexOf(name) >= 0) {
			env[name] = result[1];
		}
	}

	return env;
}

// Whitelist environment variables to pass on
// Don't want to pull in potentially secret variables
// If updating this make sure the RubyEnvironment interface
// also gets updated.
//
// It'd be really nice if there was a way
// of generating the correct constant and/or TypeScript interface
// from a single declaration
const RUBY_ENVIRONMENT_VARIABLES = [
	'PATH',
	'Path', // Windows
	'PATHEXT', // Windows
	'RUBY_VERSION',
	'RUBY_ROOT',
	'RUBY_ENGINE',
	'RUBYOPT',
	'GEM_HOME',
	'GEM_PATH',
	'GEM_ROOT',
	'HOME',
	'RUBOCOP_OPTS',
	'LANG',
	'BUNDLE_PATH',
	'RBENV_ROOT',
	'ASDF_DATA_DIR',
	'ASDF_CONFIG_FILE',
	'ASDF_DEFAULT_TOOL_VERSIONS_FILENAME',
];

export interface IEnvironment {
	[key: string]: string;
}

export interface RubyEnvironment extends IEnvironment {
	PATH: string;
	Path?: string; // Windows
	PATHEXT?: string; // Windows
	RUBY_VERSION: string;
	RUBY_ROOT: string;
	RUBY_ENGINE: string;
	RUBYOPT: string;
	GEM_HOME: string;
	GEM_PATH: string;
	GEM_ROOT: string;
	HOME: string;
	RUBOCOP_OPTS: string;
	LANG: string;
	BUNDLE_PATH?: string;
	RBENV_ROOT?: string;
	ASDF_DATA_DIR?: string;
	ASDF_CONFIG_FILE?: string;
	ASDF_DEFAULT_TOOL_VERSIONS_FILENAME?: string;
}

export interface LoadEnvOptions {
	shell?: string;
	shimDir?: string;
}

export function loadEnv(cwd: string, options = {} as LoadEnvOptions): IEnvironment {
	const { shell = defaultShell(), shimDir = SHIM_DIR } = options;
	const shim: string = getShim(shell, shimDir);

	const { stdout, stderr, status } = spawn.sync(shim, [], {
		cwd,
	});

	if (status !== 0) {
		console.error(stderr.toString());
	}

	return processEnvironment(stdout.toString());
}

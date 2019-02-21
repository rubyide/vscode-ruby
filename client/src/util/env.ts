import execa from 'execa';
import defaultShell from 'default-shell';
import fs from 'fs';
import path from 'path';

const SHIM_DIR = path.resolve(__dirname, 'shims');
if (!fs.existsSync(SHIM_DIR)) {
	fs.mkdirSync(SHIM_DIR);
}

const RUBY_ENVIRONMENT_VARIABLES = [
	'PATH',
	'RUBY_VERSION',
	'RUBY_ROOT',
	'GEM_HOME',
	'GEM_PATH',
	'GEM_ROOT',
	'HOME',
];

function mkShim(shell: string, shimPath: string): boolean {
	const template = `#!/usr/bin/env ${shell} -i\nexport`;
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

function getShim(shell): string {
	const shellName = path.basename(shell);
	const shimPath = path.join(SHIM_DIR, `env.${shell}`);
	if (!fs.existsSync(shimPath)) {
		mkShim(shellName, shimPath);
	}

	return shimPath;
}

export type RubyEnvironment = {
	PATH: string;
	RUBY_VERSION: string;
	RUBY_ROOT: string;
	GEM_HOME: string;
	GEM_PATH: string;
	GEM_ROOT: string;
	RUBOCOP_OPTS?: string;
};

export interface IEnvironment {
	[key: string]: string;
}

export function loadEnv(cwd: string): RubyEnvironment {
	const shellName: string = path.basename(defaultShell);
	const env: IEnvironment = {};
	const shim: string = getShim(shellName);
	const { stdout, stderr } = execa.sync(shim, [], {
		cwd,
	});

	console.error(stderr);

	for (const envVar of stdout.split('\n')) {
		const result: string[] = envVar.split('=', 2);
		if (RUBY_ENVIRONMENT_VARIABLES.indexOf(result[0]) >= 0) {
			env[result[0]] = result[1];
		}
	}

	return env as RubyEnvironment;
}

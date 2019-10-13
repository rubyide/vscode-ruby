import { expect } from 'chai';
import path from 'path';
import fs from 'fs';
import sinon from 'sinon';
import spawn from 'cross-spawn';
import { SpawnSyncReturns } from 'child_process';
import { loadEnv } from '../src/environment';

// Common directories
const shimDir = path.resolve(__dirname, 'shims');
const fixturesDir = path.resolve(__dirname, 'fixtures', 'environment');

describe('environment', () => {
	let spawnSyncStub;

	before(() => {
		delete process.env.SHELL;
		spawnSyncStub = sinon.stub(spawn, 'sync').returns(spawnSyncReturnsFactory(''));
	});

	describe('#loadEnv', () => {
		context('the default shell is used', () => {
			context('the platform is Windows', () => {
				before(() => {
					mockPlatform('win32');
					spawnSyncStub.returns(spawnSyncReturnsFactory(loadEnvironmentFixture('win32')));
				});

				after(() => {
					unmockPlatform();
				});

				it('writes a shim to the file system', () => {
					loadEnv(__dirname, { shimDir });
					expect(path.join(shimDir, 'env.cmd.exe.cmd'))
						.to.be.a.file(null)
						.with.content('SET');
				});

				it('correctly loads the environment', () => {
					const environment = loadEnv(__dirname, { shimDir });
					expect(environment.PATHEXT).to.eq(
						'.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW'
					);
					// expect(environment.Path).to.eql(
					// 	`C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Ruby26-x64\bin;C:\Users\someuser\AppData\Local\Microsoft\WindowsApps;;C:\Users\someuser\AppData\Local\Programs\Microsoft VS Code\bin`
					// );
				});
			});

			context('the platform is darwin', () => {
				before(() => {
					mockPlatform('darwin');
				});

				after(() => {
					unmockPlatform();
				});

				it('writes a shim to the file system', () => {
					loadEnv(__dirname, { shimDir });
					expect(path.join(shimDir, 'env.bin.bash.sh'))
						.to.be.a.file('env.bin.bash.sh')
						.with.content('#!/bin/bash -i\nexport -p');
				});
			});

			context('the platform is a unix variant', () => {
				before(() => {
					mockPlatform('linux');
				});

				after(() => {
					unmockPlatform();
				});

				it('writes a shim to the file system', () => {
					loadEnv(__dirname, { shimDir });
					expect(path.join(shimDir, 'env.bin.sh.sh'))
						.to.be.a.file('env.bin.sh.sh')
						.with.content('#!/bin/sh -i\nexport -p');
				});
			});

			context('the shell is fish', () => {
				before(() => {
					spawnSyncStub.returns(spawnSyncReturnsFactory(loadEnvironmentFixture('fish')));
					process.env.SHELL = '/usr/local/bin/fish';
				});

				after(() => {
					delete process.env.SHELL;
				});

				it('writes a shim to the file system', () => {
					loadEnv(__dirname, { shimDir });
					expect(path.join(shimDir, 'env.usr.local.bin.fish.fish')).to.be.a.file(
						'env.usr.local.bin.fish.fish'
					).with.content(`#!/usr/local/bin/fish
for name in (set -nx)
	if string match --quiet '*PATH' $name
		echo $name=(string join : -- $$name)
	else
		echo $name="$$name"
	end
end`);
				});

				it('correctly reads the environment', () => {
					const environment = loadEnv(__dirname, { shimDir });
					expect(environment).to.deep.eq({
						GEM_HOME: '/home/someuser/.gem/ruby/2.5.1',
						GEM_PATH:
							'/home/someuser/.gem/ruby/2.5.1:/home/someuser/.rubies/ruby-2.5.1/lib/ruby/gems/2.5.0',
						GEM_ROOT: '/home/someuser/.rubies/ruby-2.5.1/lib/ruby/gems/2.5.0',
						HOME: '/home/someuser',
						LANG: 'en_US.UTF-8',
						RUBYOPT: '',
						RUBY_ENGINE: 'ruby',
						RUBY_ROOT: '/home/someuser/.rubies/ruby-2.5.1',
						RUBY_VERSION: '2.5.1',
					});
					expect(environment.SHELL).to.be.undefined;
				});
			});

			context('the shell is POSIX compliant', () => {
				before(() => {
					spawnSyncStub.returns(spawnSyncReturnsFactory(loadEnvironmentFixture('posix')));
				});

				it('correctly reads the environment', () => {
					const environment = loadEnv(__dirname, { shimDir });
					expect(environment).to.deep.eq({
						GEM_HOME: '/home/someuser/.gem/ruby/2.5.1',
						GEM_PATH:
							'/home/someuser/.gem/ruby/2.5.1:/home/someuser/.rubies/ruby-2.5.1/lib/ruby/gems/2.5.0',
						GEM_ROOT: '/home/someuser/.rubies/ruby-2.5.1/lib/ruby/gems/2.5.0',
						HOME: '/home/someuser',
						LANG: 'en_US.UTF-8',
						RUBYOPT: '',
						RUBY_ENGINE: 'ruby',
						RUBY_ROOT: '/home/someuser/.rubies/ruby-2.5.1',
						RUBY_VERSION: '2.5.1',
					});
					expect(environment.SHELL).to.be.undefined;
				});
			});
		});

		context('a custom path to a shell is used', () => {
			it('writes a shim with that custom shell path', () => {
				const shell = '/usr/local/bin/zsh';
				loadEnv(__dirname, { shell, shimDir });
				expect(path.join(shimDir, 'env.usr.local.bin.zsh.sh'))
					.to.be.a.file('env.usr.local.bin.zsh.sh')
					.with.content(`#!${shell} -i\nexport -p`);
			});
		});
	});
});

/**
 * Factory function to build SpawnSyncReturns<Buffer> objects to mock
 * spawn results
 *
 * @param output String representing stdout for stubbed spawn.sync
 * @param error String representing stderr for stubbed spawn.sync
 * @returns SpawnSyncReturns object with stdout/stderr buffers
 */
function spawnSyncReturnsFactory(output: string, error = ''): SpawnSyncReturns<Buffer> {
	return {
		pid: -1,
		output: [output, error],
		stdout: Buffer.from(output, 'utf8'),
		stderr: Buffer.from(error, 'utf8'),
		status: 0,
		signal: null,
	};
}

/**
 * Mock process.platform to something
 *
 * @param target value to set process.platform to
 */
function mockPlatform(target: string): void {
	Object.defineProperty(process, 'platform', {
		value: target,
	});
}

// Original process.platform
const platform = process.platform;

/**
 * Set process.platform back to original value
 */
function unmockPlatform(): void {
	mockPlatform(platform);
}

/**
 * Loads a fixture file for a given environment output
 *
 * @param variant type of environment to load
 */
function loadEnvironmentFixture(variant: string): string {
	return fs.readFileSync(path.join(fixturesDir, `environment.${variant}.txt`)).toString();
}

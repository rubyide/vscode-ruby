/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

'use strict';

import assert, { doesNotReject } from 'assert';
import path from 'path';
import { DebugProtocol } from 'vscode-debugprotocol';
import { DebugClient } from 'vscode-debugadapter-testsupport';

const DATA_ROOT = path.join(__dirname, 'data');
const DEBUG_ADAPTER = path.join(__dirname, '..', 'dist', 'main.js');
const PROGRAM = path.join(DATA_ROOT, 'basic.rb');

describe('vscode-ruby-debugger', () => {
	let dc: DebugClient;

	before(() => {
		dc = new DebugClient('node', DEBUG_ADAPTER, 'node');
		dc.start();
	});

	after(() => {
		dc.stop();
	});

	describe('basic', () => {
		it('unknown request should produce error', done => {
			dc.send('illegal_request')
				.then(() => {
					done(new Error('does not report error on unknown request'));
				})
				.catch(() => {
					done();
				});
		});
	});

	describe('initialize', () => {
		it('should return supported features', () => {
			return dc.initializeRequest().then(response => {
				assert.equal(response.body.supportsConfigurationDoneRequest, true);
			});
		});

		it("should produce error for invalid 'pathFormat'", done => {
			dc.initializeRequest({
				adapterID: 'mock',
				linesStartAt1: true,
				columnsStartAt1: true,
				pathFormat: 'url',
			})
				.then(response => {
					done(new Error("does not report error on invalid 'pathFormat' attribute"));
				})
				.catch(err => {
					// error expected
					done();
				});
		});
	});

	describe('launch', () => {
		it('should run program to the end', done => {
			return Promise.all<Promise<any>>([
				dc.configurationSequence(),
				dc.launch({ program: PROGRAM }),
				dc.waitForEvent('terminated'),
			]);
		});

		/*
		test('should stop on entry', () => {

			const PROGRAM = Path.join(DATA_ROOT, 'basic.rb');
			const ENTRY_LINE = 1;

			return Promise.all([
				dc.configurationSequence(),
				dc.launch({ program: PROGRAM, stopOnEntry: true }),
				dc.assertStoppedLocation('entry', { line: ENTRY_LINE } )
			]);
		});
		*/
	});

	describe('setBreakpoints', () => {
		// test('should stop on a breakpoint', () => {

		// 	const PROGRAM = Path.join(DATA_ROOT, 'basic.rb');
		// 	const BREAKPOINT_LINE = 2;

		// 	return Promise.all<Promise<any>>([
		// 		dc.hitBreakpoint(
		// 			{ program: PROGRAM },
		// 			{ path: PROGRAM, line: BREAKPOINT_LINE } ),
		// 		dc.assertStoppedLocation('breakpoint', { line: BREAKPOINT_LINE }),
		// 		dc.waitForEvent('stopped').then(event => {
		// 			return dc.continueRequest({
		// 				threadId: event.body.threadId
		// 			});
		// 		}),
		// 		dc.waitForEvent('terminated')]);
		// });

		it('should get correct variables on a breakpoint', done => {
			const BREAKPOINT_LINE = 3;

			return Promise.all([
				dc.hitBreakpoint({ program: PROGRAM }, { path: PROGRAM, line: BREAKPOINT_LINE }),
				dc
					.assertStoppedLocation('breakpoint', { line: BREAKPOINT_LINE })
					.then(response => {
						return dc.scopesRequest({
							frameId: response.body.stackFrames[0].id,
						});
					})
					.then(response => {
						return dc.variablesRequest({
							variablesReference: response.body.scopes[0].variablesReference,
						});
					})
					.then(response => {
						assert.equal(response.body.variables.length, 3);
						assert.equal(response.body.variables[0].name, 'a');
						assert.equal(response.body.variables[0].value, '10');
						assert.equal(response.body.variables[1].name, 'b');
						assert.equal(response.body.variables[1].value, 'undefined');
						assert.equal(response.body.variables[2].name, 'c');
						assert.equal(response.body.variables[2].value, 'undefined');
						dc.disconnectRequest({});
						done();
					})
					.catch(err => {
						// error expected
						dc.disconnectRequest({});
						done(new Error(err));
					}),
			]);
		});
	});
});

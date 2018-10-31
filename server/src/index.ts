/**
 * LSP server for vscode-ruby
 */

import {
	createConnection,
	IConnection,
	InitializeParams,
	ProposedFeatures,
} from 'vscode-languageserver';

import { ILanguageServer } from './Server';
import { rebuildTreeSitter } from './util/rebuilder';

const connection: IConnection = createConnection(ProposedFeatures.all);

connection.onInitialize(async (params: InitializeParams) => {
	connection.console.info('Initializing Ruby language server...');

	connection.console.info('Rebuilding tree-sitter for local Electron version');
	const rebuildResult: [void | Error, void | Error] = await rebuildTreeSitter();
	for (const result of rebuildResult) {
		if (result) {
			connection.console.error('Rebuild failed!');
			connection.console.error(result.toString());

			return null;
		}
	}
	connection.console.info('Rebuild succeeded!');

	const { Server } = await import('./Server');
	const server: ILanguageServer = new Server(connection, params);

	return server.capabilities;
});

// Listen on the connection
connection.listen();

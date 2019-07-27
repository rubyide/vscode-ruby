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
import TreeSitterFactory from './util/TreeSitterFactory';

const connection: IConnection = createConnection(ProposedFeatures.all);
let server: ILanguageServer;

connection.onInitialize(async (params: InitializeParams) => {
	connection.console.info('Initializing Ruby language server...');

	await TreeSitterFactory.initalize();

	const { Server } = await import('./Server');
	server = new Server(connection, params);
	server.registerInitializeProviders();

	return server.capabilities;
});

connection.onInitialized(() => {
	server.registerInitializedProviders();
});

connection.onShutdown(() => server.shutdown());
connection.onExit(() => server.shutdown());

// Listen on the connection
connection.listen();

// Don't die on unhandled Promise rejections
process.on('unhandledRejection', (reason, p) => {
	connection.console.error(`Unhandled Rejection at: Promise ${p} reason:, ${reason}`);
});

// Don't die when attempting to pipe stdin to a bad spawn
// https://github.com/electron/electron/issues/13254
process.on('SIGPIPE', () => {
	// console.log('SIGPIPE!!');
});

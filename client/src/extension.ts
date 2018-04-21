/**
 * LSP client for vscode-ruby
 */
import * as path from 'path';

import { ExtensionContext, workspace } from 'vscode';
import { LanguageClient, LanguageClientOptions, ServerOptions, TransportKind } from 'vscode-languageclient';

export function activate(context: ExtensionContext): void {
	const serverModule: string = context.asAbsolutePath(path.join('server', 'out', 'server.js'));
	const debugOptions: { execArgv: string[] } = { execArgv: ["--nolazy", "--inspect=6009"] };

	// If the extension is launched in debug mode then the debug server options are used
	// Otherwise the run options are used
	const serverOptions: ServerOptions = {
		run : { module: serverModule, transport: TransportKind.ipc },
		debug: { module: serverModule, transport: TransportKind.ipc, options: debugOptions }
	}

	// Options to control the language client
	const clientOptions: LanguageClientOptions = {
		// Register the server for ruby documents
		documentSelector: [
			{scheme: 'file', language: 'ruby'},
			{scheme: 'untitled', language: 'ruby'}
		],
		synchronize: {
			configurationSection: 'ruby',
			// Notify the server about file changes to '.clientrc files contain in the workspace
			fileEvents: workspace.createFileSystemWatcher('**/.clientrc')
		}
	}

	// Create the language client and start the client.
	const client: LanguageClient = new LanguageClient('ruby', 'Ruby', serverOptions, clientOptions);
	client.registerProposedFeatures();

	// Push the disposable to the context's subscriptions so that the
	// client can be deactivated on extension deactivation
	context.subscriptions.push(
		client.start()
	);
}

export function deactivate(): void {
	return undefined;
}

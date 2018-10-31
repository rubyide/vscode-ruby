/**
 * LSP client for vscode-ruby
 */
import * as path from 'path';

import { ExtensionContext, window, workspace } from 'vscode';
import {
	LanguageClient,
	LanguageClientOptions,
	ServerOptions,
	TransportKind,
} from 'vscode-languageclient';
import { WorkspaceRubyEnvironmentFeature } from './WorkspaceRubyEnvironment';

let client: LanguageClient;

export function activate(context: ExtensionContext): void {
	const serverModule: string = context.asAbsolutePath(path.join('server', 'out', 'index.js'));
	const debugOptions: { execArgv: string[] } = { execArgv: ['--nolazy', '--inspect=6009'] };

	// If the extension is launched in debug mode then the debug server options are used
	// Otherwise the run options are used
	const serverOptions: ServerOptions = {
		run: { module: serverModule, transport: TransportKind.ipc },
		debug: { module: serverModule, transport: TransportKind.ipc, options: debugOptions },
	};

	const rubyDocumentSelector: { scheme: string; language: string }[] = [
		{ scheme: 'file', language: 'ruby' },
		{ scheme: 'untitled', language: 'ruby' },
	];

	// Options to control the language client
	const clientOptions: LanguageClientOptions = {
		documentSelector: rubyDocumentSelector,
		synchronize: {
			configurationSection: 'ruby',
			// Notify server of changes to .ruby-version or .rvmrc files
			fileEvents: workspace.createFileSystemWatcher('**/{.ruby-version,.rvmrc}'),
		},
		outputChannel: window.createOutputChannel('Ruby'),
	};

	// Create the language client and start the client.
	client = new LanguageClient('ruby', 'Ruby', serverOptions, clientOptions);
	client.registerProposedFeatures();
	client.registerFeature(new WorkspaceRubyEnvironmentFeature(client));

	// Push the disposable to the context's subscriptions so that the
	// client can be deactivated on extension deactivation
	context.subscriptions.push(client.start());
}

export function deactivate(): Thenable<void> {
	return client ? client.stop() : undefined;
}

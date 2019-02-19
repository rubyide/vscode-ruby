/**
 * LSP client for vscode-ruby
 */
import path from 'path';

import { ExtensionContext, window, workspace, WorkspaceFolder } from 'vscode';
import {
	ConfigurationParams,
	CancellationToken,
	LanguageClient,
	LanguageClientOptions,
	ServerOptions,
	TransportKind,
	WorkspaceMiddleware,
} from 'vscode-languageclient';
import { WorkspaceRubyEnvironmentFeature } from './WorkspaceRubyEnvironment';

const RUBOCOP_ABSOLUTE_PATH_KEYS = ['only', 'except', 'require'];
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
			// Notify server of changes to .ruby-version or .rvmrc files
			fileEvents: workspace.createFileSystemWatcher('**/{.ruby-version,.rvmrc}'),
		},
		outputChannel: window.createOutputChannel('Ruby Language Server'),
		middleware: {
			workspace: {
				configuration: (
					params: ConfigurationParams,
					token: CancellationToken,
					next: Function
				): any[] => {
					if (!params.items) {
						return [];
					}
					let result = next(params, token, next);
					let settings = result[0];
					let scopeUri = '';

					for (let item of params.items) {
						if (!item.scopeUri) {
							continue;
						} else {
							scopeUri = item.scopeUri;
						}
					}
					let resource = client.protocol2CodeConverter.asUri(scopeUri);
					let workspaceFolder = workspace.getWorkspaceFolder(resource);
					if (workspaceFolder) {
						// Convert any relative paths to absolute paths
						if (
							settings.lint &&
							settings.lint.rubocop &&
							typeof settings.lint.rubocop === 'object'
						) {
							const {
								lint: { rubocop },
							} = settings;
							for (const key of RUBOCOP_ABSOLUTE_PATH_KEYS) {
								if (rubocop[key]) {
									rubocop[key] = rubocop[key].map(f => convertAbsolute(f, workspaceFolder));
								}
							}
						}

						// Save the file's workspace folder
						const protocolUri = client.code2ProtocolConverter.asUri(workspaceFolder.uri);
						settings.workspaceFolderUri = protocolUri;
					}
					return result;
				},
			} as WorkspaceMiddleware,
		},
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

function convertAbsolute(file: string, folder: WorkspaceFolder): string {
	if (path.isAbsolute(file)) {
		return file;
	}
	let folderPath = folder.uri.fsPath;
	if (!folderPath) {
		return file;
	}
	return path.join(folderPath, file);
}

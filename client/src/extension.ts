/**
 * LSP client for vscode-ruby
 */
import * as path from 'path';

import {
	CancellationToken,
	Disposable,
	ExtensionContext,
	FoldingContext,
	FoldingRange,
	FoldingRangeKind,
	languages,
	ProviderResult,
	TextDocument,
	workspace,
} from 'vscode';
import {
	LanguageClient,
	LanguageClientOptions,
	ServerOptions,
	TransportKind,
} from 'vscode-languageclient';
import {
	FoldingRange as LSFoldingRange,
	FoldingRangeClientCapabilities,
	FoldingRangeKind as LSFoldingRangeKind,
	FoldingRangeRequest,
	FoldingRangeRequestParam,
} from 'vscode-languageserver-protocol-foldingprovider';

export function activate(context: ExtensionContext): void {
	const serverModule: string = context.asAbsolutePath(path.join('server', 'out', 'server.js'));
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
			// Notify the server about file changes to '.clientrc files contain in the workspace
			fileEvents: workspace.createFileSystemWatcher('**/.clientrc'),
		},
	};

	// Create the language client and start the client.
	const client: LanguageClient = new LanguageClient('ruby', 'Ruby', serverOptions, clientOptions);
	client.registerProposedFeatures();
	client.registerFeature({
		fillClientCapabilities(capabilities: FoldingRangeClientCapabilities): void {
			let textDocumentCap = capabilities.textDocument;
			if (!textDocumentCap) {
				textDocumentCap = capabilities.textDocument = {};
			}
			textDocumentCap.foldingRange = {
				dynamicRegistration: false,
				rangeLimit: 5000,
				lineFoldingOnly: true,
			};
		},
		initialize(_capabilities, _documentSelector): void {},
	});

	// Push the disposable to the context's subscriptions so that the
	// client can be deactivated on extension deactivation
	context.subscriptions.push(client.start());

	client.onReady().then(() => {
		context.subscriptions.push(initFoldingProvider());
	});

	function initFoldingProvider(): Disposable {
		function getKind(kind: string | undefined): FoldingRangeKind | undefined {
			if (kind) {
				switch (kind) {
					case LSFoldingRangeKind.Comment:
						return FoldingRangeKind.Comment;
					case LSFoldingRangeKind.Imports:
						return FoldingRangeKind.Imports;
					case LSFoldingRangeKind.Region:
						return FoldingRangeKind.Region;
					default:
				}
			}

			return void 0;
		}

		return languages.registerFoldingRangeProvider(rubyDocumentSelector, {
			provideFoldingRanges(
				document: TextDocument,
				_context: FoldingContext,
				token: CancellationToken
			) {
				const param: FoldingRangeRequestParam = {
					textDocument: client.code2ProtocolConverter.asTextDocumentIdentifier(document),
				};

				return client.sendRequest(FoldingRangeRequest.type, param, token).then(
					(ranges: ProviderResult<LSFoldingRange[]>) => {
						if (Array.isArray(ranges)) {
							return ranges.map(r => new FoldingRange(r.startLine, r.endLine, getKind(r.kind)));
						}

						return null;
					},
					error => {
						client.logFailedRequest(FoldingRangeRequest.type, error);

						return null;
					}
				);
			},
		});
	}
}

export function deactivate(): void {
	return undefined;
}

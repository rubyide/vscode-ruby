/**
 * CapabilityCalculator
 */

import {
	ClientCapabilities,
	ServerCapabilities,
	TextDocumentSyncKind,
} from 'vscode-languageserver';

export class CapabilityCalculator {
	private clientCapabilities: ClientCapabilities;
	public capabilities: ServerCapabilities;

	constructor(clientCapabilities: ClientCapabilities) {
		this.clientCapabilities = clientCapabilities;
		this.calculateCapabilities();
	}

	private calculateCapabilities() {
		this.capabilities = {
			// Perform incremental syncs
			// Incremental sync is disabled for now due to not being able to get the
			// old text in ASTProvider
			// textDocumentSync: TextDocumentSyncKind.Incremental,
			textDocumentSync: TextDocumentSyncKind.Full,
			documentHighlightProvider: true,
			foldingRangeProvider: true,
		};

		if (this.clientCapabilities.workspace && this.clientCapabilities.workspace.workspaceFolders) {
			this.capabilities.workspace = {
				workspaceFolders: {
					supported: true,
					changeNotifications: true,
				},
			};
		}
	}
}

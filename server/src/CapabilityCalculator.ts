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

	constructor(clientCapabilities: ClientCapabilities) {
		this.clientCapabilities = clientCapabilities;
	}

	get capabilities(): ServerCapabilities {
		this.clientCapabilities;

		return {
			// Perform incremental syncs
			// Incremental sync is disabled for now due to not being able to get the
			// old text in ASTProvider
			// textDocumentSync: TextDocumentSyncKind.Incremental,
			textDocumentSync: TextDocumentSyncKind.Full,
			documentHighlightProvider: true,
			foldingRangeProvider: true,
		};
	}
}

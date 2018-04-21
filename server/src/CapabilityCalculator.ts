/**
 * CapabilityCalculator
 */

import { ClientCapabilities, ServerCapabilities, TextDocumentSyncKind } from 'vscode-languageserver';

export class CapabilityCalculator {
	private clientCapabilities: ClientCapabilities;

	constructor(clientCapabilities: ClientCapabilities) {
		this.clientCapabilities = clientCapabilities;
	}

	get capabilities(): ServerCapabilities {
		const capabilities: ServerCapabilities = {};

		// Perform incremental syncs
		// capabilities.textDocumentSync = TextDocumentSyncKind.Incremental;
		capabilities.textDocumentSync = TextDocumentSyncKind.Full;

		// enable document highlighting
		capabilities.documentHighlightProvider = !!this.clientCapabilities.textDocument && !!this.clientCapabilities.textDocument.documentHighlight;

		return capabilities;
	}
}
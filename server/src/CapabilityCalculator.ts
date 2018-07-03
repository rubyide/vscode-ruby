/**
 * CapabilityCalculator
 */

import {
	ClientCapabilities,
	ServerCapabilities,
	TextDocumentSyncKind,
} from 'vscode-languageserver';
import {
	FoldingRangeClientCapabilities,
	FoldingRangeServerCapabilities,
} from 'vscode-languageserver-protocol-foldingprovider';

type ClientCapabilitiesWithFolding = ClientCapabilities & FoldingRangeClientCapabilities;
type ServerCapabilitiesWithFolding = ServerCapabilities & FoldingRangeServerCapabilities;

export class CapabilityCalculator {
	private clientCapabilities: ClientCapabilitiesWithFolding;

	constructor(clientCapabilities: ClientCapabilitiesWithFolding) {
		this.clientCapabilities = clientCapabilities;
	}

	get capabilities(): ServerCapabilitiesWithFolding {
		const capabilities: ServerCapabilitiesWithFolding = {
			// Perform incremental syncs
			// Incremental sync is disabled for now due to not being able to get the
			// old text in ASTProvider
			// textDocumentSync: TextDocumentSyncKind.Incremental,
			textDocumentSync: TextDocumentSyncKind.Full,
			documentHighlightProvider: true,
			foldingRangeProvider: true,
		};

		return capabilities;
	}
}

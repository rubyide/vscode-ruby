/**
 * CapabilityCalculator
 */

import {
	ClientCapabilities,
	ServerCapabilities,
	TextDocumentSyncKind,
} from 'vscode-languageserver';

type WorkspaceRubyEnvironmentCapability = {
	workspace?: {
		rubyEnvironment?: boolean;
	};
};

type ClientCapabilitiesWithRubyEnvironment = ClientCapabilities &
	WorkspaceRubyEnvironmentCapability;

export class CapabilityCalculator {
	public clientCapabilities: ClientCapabilitiesWithRubyEnvironment;
	public capabilities: ServerCapabilities;

	constructor(clientCapabilities: ClientCapabilities) {
		this.clientCapabilities = clientCapabilities as ClientCapabilitiesWithRubyEnvironment;
		this.calculateCapabilities();
	}

	private calculateCapabilities() {
		this.capabilities = {
			// Perform incremental syncs
			// Incremental sync is disabled for now due to not being able to get the
			// old text
			// textDocumentSync: TextDocumentSyncKind.Incremental,
			textDocumentSync: TextDocumentSyncKind.Full,
			documentFormattingProvider: true,
			documentRangeFormattingProvider: true,
			documentHighlightProvider: true,
			documentSymbolProvider: true,
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

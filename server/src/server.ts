/**
 * LSP server for vscode-ruby
 */

import {
	createConnection,
	IConnection,
	InitializeParams,
	ProposedFeatures,
} from 'vscode-languageserver';

import { CapabilityCalculator } from './CapabilityCalculator';
import { Forest } from './Forest';
import { ASTProvider } from './providers/ASTProvider';
import { DocumentHighlightProvider } from './providers/DocumentHighlightProvider';
import { FoldingRangeProvider } from './providers/FoldingRangeProvider';

const connection: IConnection = createConnection(ProposedFeatures.all);

connection.onInitialize((params: InitializeParams) => {
	const calculator: CapabilityCalculator = new CapabilityCalculator(params.capabilities);

	return {
		capabilities: calculator.capabilities,
	};
});

// Create a forest to track our docs
const forest: Forest = new Forest();

// Register providers
new ASTProvider(connection, forest);
new DocumentHighlightProvider(connection, forest);
new FoldingRangeProvider(connection, forest);

// Listen on the connection
connection.listen();

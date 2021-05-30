/*
 * FoldingRangeProvider
 */

import {
	FoldingRange,
	FoldingRangeRequest,
	FoldingRangeParams,
	Connection,
} from 'vscode-languageserver';
import Provider from './Provider';
import { analyses } from '../Analyzer';

export default class FoldingRangeProvider extends Provider {
	static register(connection: Connection): FoldingRangeProvider {
		return new FoldingRangeProvider(connection);
	}

	constructor(connection: Connection) {
		super(connection);

		this.connection.onRequest(FoldingRangeRequest.type, this.handleFoldingRange);
	}

	protected handleFoldingRange = async (params: FoldingRangeParams): Promise<FoldingRange[]> => {
		const {
			textDocument: { uri },
		} = params;
		const analysis = analyses.getAnalysis(uri);
		return analysis.foldingRanges;
	};
}

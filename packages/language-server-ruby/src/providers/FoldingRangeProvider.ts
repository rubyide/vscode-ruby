/*
 * FoldingRangeProvider
 */

import {
	FoldingRange,
	FoldingRangeRequest,
	FoldingRangeParams,
	IConnection,
} from 'vscode-languageserver';
import Provider from './Provider';
import { analyses } from '../Analyzer';

export default class FoldingRangeProvider extends Provider {
	static register(connection: IConnection) {
		return new FoldingRangeProvider(connection);
	}

	constructor(connection: IConnection) {
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

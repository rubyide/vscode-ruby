import {
	IConnection,
	DidOpenTextDocumentParams,
	DidChangeTextDocumentParams,
} from 'vscode-languageserver';
import { IForest } from '../Forest';

import Provider from './Provider';

export default class DiagnosticsProvider extends Provider {
	static register(connection: IConnection, forest: IForest) {
		return new DiagnosticsProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);
	}

	public computeDiagnostics = async (
		_params: DidOpenTextDocumentParams | DidChangeTextDocumentParams
	) => {};
}

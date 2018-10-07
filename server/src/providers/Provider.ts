import { IConnection } from 'vscode-languageserver';
import { IForest } from '../Forest';

export default abstract class Provider {
	protected connection: IConnection;
	protected forest: IForest;

	static register(connection: IConnection, forest: IForest) {
		throw new Error('Register is not implemented!');
	}

	constructor(connection: IConnection, forest: IForest) {
		this.connection = connection;
		this.forest = forest;
	}
}

import { Connection } from 'vscode-languageserver';

export default abstract class Provider {
	protected connection: Connection;

	constructor(connection: Connection) {
		this.connection = connection;
	}
}

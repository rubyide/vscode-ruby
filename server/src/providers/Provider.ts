import { IConnection } from 'vscode-languageserver';

export default abstract class Provider {
	protected connection: IConnection;

	constructor(connection: IConnection) {
		this.connection = connection;
	}
}

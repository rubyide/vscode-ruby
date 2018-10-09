import { IConnection, DidChangeConfigurationParams } from 'vscode-languageserver';
import { IForest } from '../Forest';
import Provider from './Provider';

export default class ConfigurationProvider extends Provider {
	static register(connection: IConnection, forest: IForest) {
		return new ConfigurationProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);

		this.connection.onDidChangeConfiguration(this.handleConfigurationChange);
	}

	private handleConfigurationChange(event: DidChangeConfigurationParams) {
		console.log(event.settings);
	}
}

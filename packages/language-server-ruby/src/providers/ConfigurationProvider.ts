import {
	IConnection,
	DidChangeConfigurationParams,
	DidChangeConfigurationNotification,
} from 'vscode-languageserver';
import Provider from './Provider';
import { documentConfigurationCache } from '../SettingsCache';

export default class ConfigurationProvider extends Provider {
	static register(connection: IConnection) {
		return new ConfigurationProvider(connection);
	}

	constructor(connection: IConnection) {
		super(connection);

		this.connection.client.register(DidChangeConfigurationNotification.type, undefined);
		this.connection.onDidChangeConfiguration(this.handleDidChangeConfiguration);
	}

	private handleDidChangeConfiguration = async (
		_params: DidChangeConfigurationParams // params is empty in the pull config model
	): Promise<void> => {
		documentConfigurationCache.flush();
	};
}

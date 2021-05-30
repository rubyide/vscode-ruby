import {
	Connection,
	DidChangeConfigurationParams,
	DidChangeConfigurationNotification,
} from 'vscode-languageserver';
import Provider from './Provider';
import { documentConfigurationCache } from '../SettingsCache';

export default class ConfigurationProvider extends Provider {
	private configChangeCallback: () => void;

	static register(connection: Connection, callback?: () => void): ConfigurationProvider {
		return new ConfigurationProvider(connection, callback);
	}

	constructor(connection: Connection, callback?: () => void) {
		super(connection);

		this.configChangeCallback = callback || (() => {});

		this.connection.client.register(DidChangeConfigurationNotification.type, undefined);
		this.connection.onDidChangeConfiguration(this.handleDidChangeConfiguration);
	}

	private handleDidChangeConfiguration = async (
		_params: DidChangeConfigurationParams // params is empty in the pull config model
	): Promise<void> => {
		documentConfigurationCache.flush();
		this.configChangeCallback();
	};
}

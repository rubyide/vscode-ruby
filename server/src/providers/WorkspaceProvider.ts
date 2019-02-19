import Provider from './Provider';
import {
	DidChangeWatchedFilesParams,
	IConnection,
	WorkspaceFoldersChangeEvent,
} from 'vscode-languageserver';

import { workspaceRubyEnvironmentCache } from '../SettingsCache';

export default class WorkspaceProvider extends Provider {
	static register(connection: IConnection) {
		return new WorkspaceProvider(connection);
	}

	constructor(connection: IConnection) {
		super(connection);

		this.connection.workspace.onDidChangeWorkspaceFolders(this.handleWorkspaceFoldersChange);
		this.connection.onDidChangeWatchedFiles(this.handleDidChangeWatchedFiles);
	}

	private handleWorkspaceFoldersChange = async (
		event: WorkspaceFoldersChangeEvent
	): Promise<void> => {
		const loader = workspaceRubyEnvironmentCache.getAll(event.added);
		const remover = workspaceRubyEnvironmentCache.deleteAll(event.removed);
		await Promise.all([loader, remover]);
	};

	private handleDidChangeWatchedFiles = async (
		params: DidChangeWatchedFilesParams
	): Promise<void> => {
		console.log('Watched file change!');
		console.log(params);
		// TODO load workspace environment again based on workspace where the file changed
	};
}

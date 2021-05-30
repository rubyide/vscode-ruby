import Provider from './Provider';
import {
	DidChangeWatchedFilesParams,
	Connection,
	WorkspaceFoldersChangeEvent,
} from 'vscode-languageserver';
import log from 'loglevel';

import { workspaceRubyEnvironmentCache } from '../SettingsCache';

export default class WorkspaceProvider extends Provider {
	public static register(connection: Connection): WorkspaceProvider {
		return new WorkspaceProvider(connection);
	}

	constructor(connection: Connection) {
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
		log.info('Watched file change!');
		log.info(params);
		// TODO load workspace environment again based on workspace where the file changed
	};
}

import Provider from './Provider';
import { IConnection, WorkspaceFoldersChangeEvent } from 'vscode-languageserver';
import { IForest } from '../Forest';

import { config } from '../ServerConfiguration';

export default class WorkspaceProvider extends Provider {
	static register(connection: IConnection, forest: IForest) {
		return new WorkspaceProvider(connection, forest);
	}

	constructor(connection: IConnection, forest: IForest) {
		super(connection, forest);

		this.connection.workspace.onDidChangeWorkspaceFolders(this.handleWorkspaceFoldersChange);
	}

	private handleWorkspaceFoldersChange = async (
		event: WorkspaceFoldersChangeEvent
	): Promise<void> => {
		const loaders = event.added.map(folder => config.loadWorkspaceEnvironment(folder));
		const removers = event.removed.map(folder => config.removeWorkspaceEnvironment(folder));
		await Promise.all(loaders.concat(removers));
	};
}

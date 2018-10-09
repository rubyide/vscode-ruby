import url from 'url';
import { WorkspaceFolder } from 'vscode-languageserver';
import { loadEnv, IEnvironment } from './util/env';

export type RubyEnvironment = {
	PATH: string;
	RUBY_VERSION: string;
	RUBY_ROOT: string;
	GEM_HOME: string;
	GEM_PATH: string;
	GEM_ROOT: string;
};

class ServerConfiguration {
	private environments: Map<string, RubyEnvironment>;

	constructor() {
		this.environments = new Map();
	}

	public async loadWorkspaceEnvironment(workspaceFolder: WorkspaceFolder): Promise<void> {
		const { uri } = workspaceFolder;
		const parsed = url.parse(workspaceFolder.uri);
		if (parsed.protocol === 'file:') {
			console.log(`Loading environment for local workspace ${uri}`);
			const environment: IEnvironment = await loadEnv(parsed.path);
			this.environments[uri] = this.reduceEnvironment(environment);
		} else {
			console.log(`Skipping environment load for non-local workspace ${uri}`);
		}
	}

	public async removeWorkspaceEnvironment(folder: WorkspaceFolder): Promise<void> {
		this.environments.delete(folder.uri) &&
			console.log(`Removed workspace environment ${folder.uri}`);
	}

	public environmentFor(folder: WorkspaceFolder): RubyEnvironment {
		return this.environments.get(folder.uri);
	}

	private reduceEnvironment(environment: IEnvironment): RubyEnvironment {
		const { PATH, RUBY_VERSION, RUBY_ROOT, GEM_HOME, GEM_PATH, GEM_ROOT } = environment;
		return {
			PATH,
			RUBY_VERSION,
			RUBY_ROOT,
			GEM_HOME,
			GEM_PATH,
			GEM_ROOT,
		};
	}
}

export const config = new ServerConfiguration();

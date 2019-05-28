import * as path from 'path';
import * as prebuildInstall from 'prebuild-install';

export enum NodeRuntime {
	Electron = 1,
	Node = 2
}

function packageToGithubRepo(name: string): string {
	let repo: string;
	switch (name) {
		case 'tree-sitter':
			repo = 'node-tree-sitter';
			break;
		default:
			repo = name;
	}

	return repo;
}

function downloadUrl(name: string, version: string, nodeRuntime: NodeRuntime): string {
	const repo: string = packageToGithubRepo(name);
	const urlBase: string = `https://github.com/tree-sitter/${repo}/releases/download/v${version}/`;
	const prebuild: string = `${name}-v${version}-${nodeRuntime === NodeRuntime.Electron ? 'electron' : 'node'}-v${process.versions.modules}-${
		process.platform
		}-${process.arch}.tar.gz`;

	return `${urlBase}${prebuild}`;
}

function fetchPrebuild(name: string, nodeRuntime: NodeRuntime): Promise<void | Error> {
	const pkgRoot: string = path.resolve(path.join(__dirname, '../../node_modules', name));
	const pkg: { name: string; version: string } = require(`${pkgRoot}/package.json`);
	const url: string = downloadUrl(pkg.name, pkg.version, nodeRuntime);

	return new Promise((res, rej) => {
		prebuildInstall.download(url, { pkg, path: pkgRoot }, (err: Error) => {
			err ? rej(err) : res();
		});
	});
}

export function rebuildTreeSitter(nodeRuntime: NodeRuntime): Promise<[void | Error, void | Error]> {
	return Promise.all([fetchPrebuild('tree-sitter', nodeRuntime), fetchPrebuild('tree-sitter-ruby', nodeRuntime)]);
}

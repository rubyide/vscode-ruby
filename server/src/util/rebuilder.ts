import * as path from 'path';
import * as prebuildInstall from 'prebuild-install';

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

function downloadUrl(name: string, version: string): string {
	const repo: string = packageToGithubRepo(name);
	const urlBase: string = `https://github.com/tree-sitter/${repo}/releases/download/v${version}/`;
	const prebuild: string = `${name}-v${version}-electron-v${process.versions.modules}-${
		process.platform
	}-${process.arch}.tar.gz`;

	return `${urlBase}${prebuild}`;
}

function fetchPrebuild(name: string): Promise<void | Error> {
	const pkgRoot: string = path.resolve(path.join(__dirname, '../../node_modules', name));
	const pkg: { name: string; version: string } = require(`${pkgRoot}/package.json`);
	const url: string = downloadUrl(pkg.name, pkg.version);

	return new Promise((res, rej) => {
		prebuildInstall.download(url, { pkg, path: pkgRoot }, (err: Error) => {
			err ? rej(err) : res();
		});
	});
}

export function rebuildTreeSitter(): Promise<[void | Error, void | Error]> {
	return Promise.all([fetchPrebuild('tree-sitter'), fetchPrebuild('tree-sitter-ruby')]);
}

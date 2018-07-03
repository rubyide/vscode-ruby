/**
 * Forest
 */

import { Tree } from 'tree-sitter';

export interface IForest {
	getTree(uri: string): Tree;
	setTree(uri: string, tree: Tree): void;
	removeTree(uri: string): boolean;
}

export class Forest implements IForest {
	private trees: Map<string, Tree>;

	constructor() {
		this.trees = new Map();
	}

	public getTree(uri: string): Tree {
		return this.trees.get(uri);
	}

	public setTree(uri: string, tree: Tree): void {
		this.trees.set(uri, tree);
	}

	public removeTree(uri: string): boolean {
		return this.trees.delete(uri);
	}
}

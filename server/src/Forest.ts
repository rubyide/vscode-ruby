/**
 * Forest
 */

import { Document } from 'tree-sitter';
import * as TreeSitterRuby from 'tree-sitter-ruby';

export interface IForest {
	tree(uri: string): Document
	removeTree(uri: string): boolean
}

export class Forest implements IForest {
	private trees: Map<string, Document>;

	constructor() {
		this.trees = new Map();
	}

	public tree(uri: string): Document {
		if (!this.trees.has(uri)) {
			const treeSitterDocument: Document = new Document();
			treeSitterDocument.setLanguage(TreeSitterRuby);
			this.trees.set(uri, treeSitterDocument);
		}

		return this.trees.get(uri);
	}

	public removeTree(uri: string): boolean {
		return this.trees.delete(uri);
	}
}
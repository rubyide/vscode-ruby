/**
 * Forest
 */

import Parser, { Tree } from 'tree-sitter';
import TreeSitterRuby from 'tree-sitter-ruby';
import { TextDocument } from 'vscode-languageserver';
import { of } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { documents, DocumentEvent, DocumentEventKind } from './DocumentManager';

export interface IForest {
	getTree(uri: string): Tree;
	createTree(uri: string, content: string): Tree;
	updateTree(uri: string, content: string): Tree;
	deleteTree(uri: string): boolean;
}

export enum ForestEventKind {
	OPEN,
	UPDATE,
	DELETE,
}

export type ForestEvent = {
	kind: ForestEventKind;
	document: TextDocument;
	tree?: Tree;
};

class Forest implements IForest {
	private parser: Parser;
	private trees: Map<string, Tree>;

	constructor() {
		this.trees = new Map();
		this.parser = new Parser();
		this.parser.setLanguage(TreeSitterRuby);
	}

	public getTree(uri: string): Tree {
		return this.trees.get(uri);
	}

	public createTree(uri: string, content: string): Tree {
		const tree: Tree = this.parser.parse(content);
		this.trees.set(uri, tree);

		return tree;
	}

	// For the time being this is a full reparse for every change
	// Once we can support incremental sync we can use tree-sitter's
	// edit functionality
	public updateTree(uri: string, content: string): Tree {
		let tree: Tree = this.getTree(uri);
		if (tree) {
			tree = this.parser.parse(content);
			this.trees.set(uri, tree);
		} else {
			tree = this.createTree(uri, content);
		}

		return tree;
	}

	public deleteTree(uri: string): boolean {
		return this.trees.delete(uri);
	}
}

export const forest = new Forest();
export const forestStream = documents.subject.pipe(
	switchMap((event: DocumentEvent) => {
		const { kind, document } = event;
		const uri = document.uri;
		const forestEvent: ForestEvent = {
			document,
			kind: undefined,
		};

		switch (kind) {
			case DocumentEventKind.OPEN:
				forestEvent.tree = forest.createTree(uri, document.getText());
				forestEvent.kind = ForestEventKind.OPEN;
				break;
			case DocumentEventKind.CHANGE_CONTENT:
				forestEvent.tree = forest.updateTree(uri, document.getText());
				forestEvent.kind = ForestEventKind.UPDATE;
				break;
			case DocumentEventKind.CLOSE:
				forest.deleteTree(uri);
				forestEvent.kind = ForestEventKind.DELETE;
				break;
		}

		return of(forestEvent);
	})
);

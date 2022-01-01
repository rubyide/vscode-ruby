import { SyntaxNode, Tree } from 'web-tree-sitter';

export interface Fixture {
	content: string;
	tree: Tree;
}

export function loadFixture(name: string): Fixture {
	return (global as any).loader.load(name);
}

export function walkTSTree(tree: Tree, action: (node: SyntaxNode) => void): void {
	const cursor = tree.walk();
	const walk = (depth: number): void => {
		action(cursor.currentNode());
		if (cursor.gotoFirstChild()) {
			do {
				walk(depth + 1);
			} while (cursor.gotoNextSibling());
			cursor.gotoParent();
		}
	};
	walk(0);
	cursor.delete();
}

import { SyntaxNode } from 'web-tree-sitter';

export default abstract class BaseAnalyzer<T> {
	public diagnostics: T[];

	constructor() {
		this.diagnostics = [] as T[];
	}

	public analyze(_node: SyntaxNode): void {}

	public flush(): void {
		this.diagnostics = [] as T[];
	}
}

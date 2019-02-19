import { SyntaxNode } from 'tree-sitter';

export default abstract class BaseAnalyzer<T> {
	public diagnostics: T[];

	constructor() {
		this.diagnostics = [] as T[];
	}

	public analyze(node: SyntaxNode): void {
		console.log(node);
	}

	public flush(): void {
		this.diagnostics = [] as T[];
	}
}

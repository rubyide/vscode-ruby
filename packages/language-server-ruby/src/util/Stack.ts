// Super simple stack
export default class Stack<T> {
	private stack: T[];

	constructor() {
		this.stack = [];
	}

	get size() {
		return this.stack.length;
	}

	public push(value: T): void {
		this.stack.push(value);
	}

	public pop(): T {
		return this.stack.pop();
	}

	public peek(): T {
		return this.stack[this.size - 1];
	}

	public empty(): boolean {
		return this.size === 0;
	}
}

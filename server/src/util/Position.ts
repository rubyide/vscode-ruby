/**
 * Position class
 *
 * This class supports converting to/from VSCode and TreeSitter positions
 */

import { Point as TSPosition } from 'tree-sitter';
import { Position as VSPosition } from 'vscode-languageserver';

export default class Position {
	public row: number;
	public col: number;

	constructor(row: number, col: number) {
		this.row = row;
		this.col = col;
	}

	public static fromVSPosition(position: VSPosition): Position {
		return new Position(position.line, position.character);
	}

	public static fromTSPosition(position: TSPosition): Position {
		return new Position(position.row, position.column);
	}

	public static tsPositionIsEqual(p1: TSPosition, p2: TSPosition): boolean {
		return p1.row === p2.row && p1.column === p2.column;
	}

	public toVSPosition(): VSPosition {
		return VSPosition.create(this.row, this.col);
	}

	public toTSPosition(): TSPosition {
		return {
			row: this.row,
			column: this.col,
		};
	}

	public isEqual(position: Position) {
		return this.row === position.row && this.col === position.col;
	}
}

/**
 * Position class
 *
 * This class supports converting to/from VSCode and TreeSitter positions
 */

import {Position as TSPosition} from 'tree-sitter';
import {Position as VSPosition} from 'vscode-languageserver';

export class Position {
	private row: number;
	private col: number;

	constructor(row: number, col: number) {
		this.row = row;
		this.col = col;
	}

	public static FROM_VS_POSITION(position: VSPosition): Position {
		return new Position(position.line, position.character);
	}

	public static FROM_TS_POSITION(position: TSPosition): Position {
		return new Position(position.row, position.column);
	}

	public toVSPosition(): VSPosition {
		return VSPosition.create(this.row, this.col);
	}

	public toTSPosition(): TSPosition {
		return {
			row: this.row,
			column: this.col
		};
	}
}
import { expect } from 'chai';
import Position from '../../src/util/Position';
import { Point as TSPosition } from 'tree-sitter';
import { Position as VSPosition } from 'vscode-languageserver';

function generateRandomRowCol() {
	return {
		row: Math.round(Math.random() * 100),
		col: Math.round(Math.random() * 100),
	};
}

describe('Position', () => {
	describe('fromVSPosition', () => {
		it('creates a valid Position', () => {
			const { row, col } = generateRandomRowCol();
			const tsPosition: TSPosition = {
				row,
				column: col,
			};
			const position = Position.fromTSPosition(tsPosition);
			expect(position.row).to.eql(row);
			expect(position.col).to.eql(col);
		});
	});

	describe('fromTSPosition', () => {
		it('creates a valid Position', () => {
			const { row, col } = generateRandomRowCol();
			const vsPosition: VSPosition = {
				line: row,
				character: col,
			};
			const position = Position.fromVSPosition(vsPosition);
			expect(position.row).to.eql(row);
			expect(position.col).to.eql(col);
		});
	});

	describe('tsPositionIsEqual', () => {});

	describe('constructor', () => {
		it('creates a new Position with the given row and col', () => {
			const { row, col } = generateRandomRowCol();
			const position = new Position(row, col);
			expect(position.row).to.eql(row);
			expect(position.col).to.eql(col);
		});
	});
});

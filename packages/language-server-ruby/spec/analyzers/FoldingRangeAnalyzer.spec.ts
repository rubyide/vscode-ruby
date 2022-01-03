import { expect } from 'chai';
import { FoldingRange } from 'vscode-languageserver';

import FoldingRangeAnalyzer, { FoldHeuristic } from '../../src/analyzers/FoldingRangeAnalyzer';
import { getParser, loadFixture, Fixture } from '../helper';

/**
 * NOTICE
 *
 * This test is highly coupled to the folds.rb fixture. Because folds are computed
 * based upon precise row and column offsets, changes to folds.rb will cascade through
 * this test
 *
 * A FoldingRange returned by the server is 0 indexed while the editor is 1 indexed
 * (the first row in the editor is row 0 in code and row 1 visually).
 *
 * A FoldingRange is defined as start line, end line, start character, end character
 * https://microsoft.github.io/language-server-protocol/specification#textDocument_foldingRange
 *
 * In order to hand-compute a folding range, find the start line and start column in the editor
 * Take those numbers and subtract 1 from each. This corrects for the 0 index.
 *
 * The end line also needs to have 1 subtracted from it, but additional modifications may be done
 * based upon the FoldHeuristic defined for the construct (see below).
 *
 * The end character does not get 1 subtracted from it.
 *
 * The end line/character are where things get complicated. VSCode's own folding behavior
 * combined with Ruby syntax/folding conventions required the creation of the FoldHeuristic.
 * This provides the capability of tweaking the start/end positions of the fold. Most Ruby constructs
 * that have an "end" at the end will subtract an additional row so that, visually, the "end" will be
 * on the line below the fold start when folded. This is visually consistent with how languages like
 * JavaScript are folded in the editor and due to the lack of "same line folding" (see below), it's the
 * best we have right now.
 *
 * VSCode does not support the final line of the fold folding onto the same line as the start
 * https://github.com/microsoft/vscode/issues/3352
 */

describe('FoldHeuristic', () => {
	it('defaults to 0,0 for start and end', () => {
		const heuristic = new FoldHeuristic();
		expect(heuristic.start).to.deep.eq({ row: 0, column: 0 });
		expect(heuristic.end).to.deep.eq({ row: 0, column: 0 });
	});

	it('sets start', () => {
		const heuristic = new FoldHeuristic({ start: { row: 4, column: 12 } });
		expect(heuristic.start).to.deep.eq({ row: 4, column: 12 });
	});
	it('sets end', () => {
		const heuristic = new FoldHeuristic({ end: { row: 2, column: 3 } });
		expect(heuristic.end).to.deep.eq({ row: 2, column: 3 });
	});
});

describe('FoldingRangeAnalyzer', () => {
	let analyzer: FoldingRangeAnalyzer;
	let fixture: Fixture;

	before(() => {
		fixture = loadFixture('folds.rb');
		analyzer = new FoldingRangeAnalyzer(getParser().getLanguage());
		analyzer.analyze(fixture.tree.rootNode);
	});

	after(() => {
		fixture.tree.delete();
	});

	const itIdentifiesFolds = (foldLocations: FoldingRange[]): void => {
		it('identifies folds', () => {
			for (const foldingRange of foldLocations) {
				expect(analyzer.foldingRanges).to.deep.contain(foldingRange);
			}
		});
	};

	// These tests are defined in order of the FoldHeuristic definitions

	describe('fold nodes', () => {
		describe('arrays', () => {
			itIdentifiesFolds([
				FoldingRange.create(37, 40, 16, 5, 'region'), // CONSTANT2
			]);
		});

		describe('requires', () => {
			itIdentifiesFolds([
				FoldingRange.create(0, 2, 0, 14, 'imports'), // require()...
			]);
		});

		describe('case statements', () => {
			itIdentifiesFolds([
				FoldingRange.create(50, 56, 6, 9, 'region'), // method1, case a...
				FoldingRange.create(59, 65, 6, 9, 'region'), // method1, case...
			]);
		});

		describe('when statements', () => {
			itIdentifiesFolds([
				FoldingRange.create(51, 52, 6, 18, 'region'), // method1, case a, when 1
				FoldingRange.create(53, 54, 6, 18, 'region'), // method1, case a, when 2
				FoldingRange.create(55, 56, 6, 18, 'region'), // method1, case a, when 3
				FoldingRange.create(60, 61, 6, 18, 'region'), // method1, case, when a == 1
				FoldingRange.create(62, 63, 6, 18, 'region'), // method1, case, when a == 2
				FoldingRange.create(64, 65, 6, 18, 'region'), // method1, case, when a == 3
			]);
		});

		describe('classes', () => {
			itIdentifiesFolds([
				FoldingRange.create(17, 24, 2, 5, 'region'), // class Bam
			]);
		});

		describe('comments', () => {
			itIdentifiesFolds([
				FoldingRange.create(4, 8, 0, 4, 'comment'), // =begin...
				FoldingRange.create(10, 14, 0, 1, 'comment'), // # # foo...
				FoldingRange.create(106, 114, 4, 5, 'comment'), // # Cras at pellentesque risus...
			]);
		});

		describe('begin blocks', () => {
			itIdentifiesFolds([
				FoldingRange.create(127, 128, 6, undefined, 'region'), // method5, begin...
			]);
		});

		describe('rescue blocks', () => {
			itIdentifiesFolds([
				FoldingRange.create(129, 130, 6, 33, 'region'), // method5, rescue...
			]);
		});

		describe('do blocks', () => {
			itIdentifiesFolds([
				FoldingRange.create(135, 137, 23, 9, 'region'), // method6, each do...
			]);
		});

		describe('hashes', () => {
			itIdentifiesFolds([
				FoldingRange.create(31, 34, 16, 5, 'region'), // CONSTANT1
			]);
		});

		describe('heredocs', () => {
			itIdentifiesFolds([
				FoldingRange.create(70, 72, 19, 4, 'region'), // method2, text
				FoldingRange.create(74, 75, 21, 10, 'region'), // method2, text2
				FoldingRange.create(78, 79, 21, 10, 'region'), // method2, text3
			]);
		});

		describe('if blocks', () => {
			itIdentifiesFolds([
				FoldingRange.create(84, 88, 6, undefined, 'region'), // method3, if (a)
				FoldingRange.create(116, 117, 6, 9, 'region'), // method4, if a
			]);

			describe('then blocks', () => {
				itIdentifiesFolds([
					FoldingRange.create(97, 98, 6, 9, 'region'), // method3, if (b) then
				]);
			});

			// tree-sitter nests else blocks under ifs thus the end line is not the
			// "end" of the if statement
			describe('else blocks', () => {
				itIdentifiesFolds([
					FoldingRange.create(89, 90, 6, 18, 'region'), // method3, else
				]);
			});
		});

		describe('unless blocks', () => {
			itIdentifiesFolds([
				FoldingRange.create(93, 94, 6, 9, 'region'), // method3, unless (a)
				FoldingRange.create(119, 120, 6, 9, 'region'), // method4, unless a
			]);

			describe('then blocks', () => {
				itIdentifiesFolds([
					FoldingRange.create(101, 102, 6, 9, 'region'), // method3, unless (b) then
				]);
			});
		});

		describe('methods', () => {
			itIdentifiesFolds([
				FoldingRange.create(18, 19, 4, 7, 'region'), // Bam#foo
				FoldingRange.create(22, 23, 4, 7, 'region'), // Bam#baz
				FoldingRange.create(49, 66, 4, 7, 'region'), // Folds#method1
				FoldingRange.create(69, 80, 4, 7, 'region'), // Folds#method2
				FoldingRange.create(83, 103, 4, 7, 'region'), // Folds#method3
				FoldingRange.create(115, 121, 4, 7, 'region'), // Folds#method4
				FoldingRange.create(124, 131, 4, 7, 'region'), // Folds#method5
				FoldingRange.create(134, 137, 4, 7, 'region'), // Folds#method6
			]);
		});

		describe('modules', () => {
			itIdentifiesFolds([
				FoldingRange.create(16, 139, 0, 3, 'region'), // module Foo
				// FoldingRange.create(28, 28, 2, 5, 'region'), // module Bamm
			]);
		});

		describe('class methods', () => {
			itIdentifiesFolds([
				FoldingRange.create(43, 46, 4, 7, 'region'), // self.klassmethod
			]);
		});
	});
});

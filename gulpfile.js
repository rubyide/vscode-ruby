/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

var gulp = require('gulp');
var path = require('path');
var ts = require('gulp-typescript');
var sourcemaps = require('gulp-sourcemaps');
var log = require('gulp-util').log;
var runSequence = require('run-sequence');

var tsProject = ts.createProject('./src/tsconfig.json');

const inlineMap = true;
const inlineSource = false;

var watchedSources = [
	'src/**/*',
	'!src/debugger/tests/data/**'
];

var outDest = 'out';

gulp.task('default', function(callback) {
	runSequence('build', callback);
});

gulp.task('build', function(callback) {
	runSequence('internal-build', callback);
});

gulp.task('ts-watch', ['internal-build'], function(cb) {
	log('Watching build sources...');
	gulp.watch(watchedSources, ['internal-compile']);
});

//---- internal

// compile and copy everything to outDest
gulp.task('internal-build', function(callback) {
	runSequence('internal-compile', callback);
});

gulp.task('internal-compile', function() {
	var r = tsProject.src()
		.pipe(sourcemaps.init())
		.pipe(ts(tsProject)).js;

	if (inlineMap && inlineSource) {
		r = r.pipe(sourcemaps.write());
	} else {
		r = r.pipe(sourcemaps.write("../out", {
			// no inlined source
			includeContent: inlineSource,
			// Return relative source map root directories per file.
			sourceRoot: "../src"
		}));
	}

	return r.pipe(gulp.dest(outDest));
});
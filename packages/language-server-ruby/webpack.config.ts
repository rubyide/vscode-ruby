import path from 'path';
import ForkTsCheckerWebpackPlugin from 'fork-ts-checker-webpack-plugin';
import { CleanWebpackPlugin } from 'clean-webpack-plugin';
import CopyPlugin from 'copy-webpack-plugin';

module.exports = {
	entry: './src/index.ts',
	target: 'node',
	module: {
		rules: [
			{
				test: /\.ts$/,
				use: 'ts-loader',
				exclude: /node_modules/,
			},
		],
	},
	resolve: {
		extensions: ['.ts', '.js'],
	},
	output: {
		filename: 'index.js',
		path: path.resolve(__dirname, 'dist'),
		libraryTarget: 'commonjs2',
		devtoolModuleFilenameTemplate: '../[resource-path]',
	},
	devtool: 'source-map',
	node: {
		__dirname: false,
	},
	externals: {
		vscode: 'commonjs vscode',
	},
	plugins: [
		new ForkTsCheckerWebpackPlugin(),
		new CleanWebpackPlugin(),
		// Workaround to Webpack not being able to figure out emscripten's environment export
		new CopyPlugin([
			{ from: '../../node_modules/web-tree-sitter/tree-sitter.wasm' },
			{ from: 'src/tree-sitter-ruby.wasm' },
		]),
	],
};

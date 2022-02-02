const fs = require('fs');
const path = require('path');

const outDir = 'dist';

const treeSitterWasmPlugin = {
  name: 'treeSitterWasm',
  setup(build) {
    const wasmPaths = [
      require.resolve('web-tree-sitter/tree-sitter.wasm'),
      require.resolve('web-tree-sitter-ruby/tree-sitter-ruby.wasm')
    ];
    // build.onEnd(result => {
    wasmPaths.forEach(wasmPath => {
      fs.copyFileSync(wasmPath, path.join(outDir, path.basename(wasmPath)))
    });
    // })
  }
}

require('esbuild').build({
  entryPoints: ['src/index.ts'],
  bundle: true,
  sourcemap: true,
  minify: true,
  outfile: `${outDir}/index.js`,
  logLevel: 'info',
  external: ['vscode'],
  format: 'cjs',
  platform: 'node',
  plugins: [treeSitterWasmPlugin],
  watch: !!process.env.ESBUILD_WATCH
}).catch(() => process.exit(1))

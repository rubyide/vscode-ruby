# Language Server

`language-server-ruby` is an implementation of the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) in TypeScript with the intention of targetting the Ruby programming language.

The server is built to be extensible, accurate, and performant with such features as:

- Automatic Ruby environment detection with support for rvm, rbenv, chruby, and asdf
- Robust language feature extraction powered by the [tree-sitter](https://tree-sitter.github.io/tree-sitter/) project
- Lint support via RuboCop, Reek, and Standard
- Format support via RuboCop, Standard, and Rufo
- Semantic code folding support
- Semantic highlighting support
- Intellisense support

Note that the language server is currently under active development!

## Logs

The extension exposes a command via the [VSCode Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) to view the Language Server's logs. Just use the `Ruby: Show Language Server Output Channel` command to view the server's logs

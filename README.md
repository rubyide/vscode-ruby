# Visual Studio Code Ruby Extensions

[![CircleCI](https://img.shields.io/circleci/build/github/rubyide/vscode-ruby?label=circleci&token=c9eaf03305b3fe24e8bc819f3f48060431e8e78f)](https://circleci.com/gh/rubyide/vscode-ruby)
[![Build status](https://ci.appveyor.com/api/projects/status/vlgs2y7tsc4xpj4c?svg=true)](https://ci.appveyor.com/project/rebornix/vscode-ruby)
[![codecov](https://codecov.io/gh/rubyide/vscode-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/rubyide/vscode-ruby)

This is the monorepo for the Visual Studio Code Ruby extensions.

Head on over to the [Ruby extension README](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-client/README.md) to get started!

## Packages

- [`vscode-ruby`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby) - extension providing syntax highlighting, language configuration, and snippets for Ruby
- [`vscode-ruby-client`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-client) - extension logic including the language server client
- [`vscode-ruby-common`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-common) - common utilities that are shared among several other packages (eg environment detection)
- [`vscode-ruby-debugger`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-debugger) - implementation of the debugger
- [`language-server-ruby`](https://github.com/rubyide/vscode-ruby/blob/master/packages/language-server-ruby) - language server implementation
  <!-- - [`ruby-debug-ide-protocol`](https://github.com/rubyide/vscode-ruby/blob/master/packages/ruby-debug-ide-protocol) - implementation of the [ruby-debug-ide protocol](https://github.com/ruby-debug/ruby-debug-ide/blob/master/protocol-spec.md)r -->

## Docs

Documentation is available in the [docs](https://github.com/rubyide/vscode-ruby/tree/master/docs) folder

## Troubleshooting

Troubleshooting documentation is available [here](https://github.com/rubyide/vscode-ruby/tree/master/docs/troubleshooting.md) folder

## Developing

See the [developing](https://github.com/rubyide/vscode-ruby/blob/master/docs/developing.md) docs

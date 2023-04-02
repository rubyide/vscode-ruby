# Visual Studio Code Ruby Extensions

<!-- [![CI](https://img.shields.io/github/workflow/status/rubyide/vscode-ruby/CI.svg?logo=github)](https://github.com/rubyide/vscode-ruby/actions?query=workflow%3ACI) -->
<!-- [![codecov](https://codecov.io/gh/rubyide/vscode-ruby/branch/main/graph/badge.svg)](https://codecov.io/gh/rubyide/vscode-ruby) -->

# DEPRECATED

Shopify's [ruby-lsp](https://github.com/Shopify/ruby-lsp) and associated [vscode-ruby-lsp](https://github.com/Shopify/vscode-ruby-lsp) are recommended alternatives to this extension. It is substantially easier to produce a high-quality LSP implementation using Ruby itself vs relying on another language such as TypeScript.

In addition, sponsorship of a project by a company like Shopify could help to ensure a high-quality developer experience going forward. Even with multiple people helping on this project, keeping up with Microsoft's development of VSCode plus the wide array of Ruby community tooling is a tall undertaking.

As of 4/2/2023, the VSCode extensions are not marked deprecated. They will be within the next few weeks.

## Readme

This is the monorepo for the Visual Studio Code Ruby extensions.

Head on over to the [Ruby extension README](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-client/README.md) to get started!

## Packages

- [`vscode-ruby`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby) - extension providing syntax highlighting, language configuration, and snippets for Ruby
- [`vscode-ruby-client`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-client) - extension logic including the language server client
- [`vscode-ruby-common`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-common) - common utilities that are shared among several other packages (eg environment detection)
- [`vscode-ruby-debugger`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-debugger) - implementation of the debugger
- [`language-server-ruby`](https://github.com/rubyide/vscode-ruby/blob/main/packages/language-server-ruby) - language server implementation
  <!-- - [`ruby-debug-ide-protocol`](https://github.com/rubyide/vscode-ruby/blob/main/packages/ruby-debug-ide-protocol) - implementation of the [ruby-debug-ide protocol](https://github.com/ruby-debug/ruby-debug-ide/blob/main/protocol-spec.md)r -->

## Docs

Documentation is available in the [docs](https://github.com/rubyide/vscode-ruby/tree/main/docs) folder

## Troubleshooting

Troubleshooting documentation is available [here](https://github.com/rubyide/vscode-ruby/tree/main/docs/troubleshooting.md) folder

## Developing

See the [developing](https://github.com/rubyide/vscode-ruby/blob/main/docs/developing.md) docs

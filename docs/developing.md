# Developing

## Repository Structure

This repository uses [`lerna`]() combined with [yarn workspaces]() to organize itself.

The overall extension is broken out into several packages within the `packages` directory:

- [`vscode-ruby`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby) - extension logic including the language server client
- [`vscode-ruby-common`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-common) - common utilities that are shared among several other packages (eg environment detection)
- [`vscode-ruby-debugger`](https://github.com/rubyide/vscode-ruby/blob/master/packages/vscode-ruby-debugger) - implementation of the debugger
- [`language-server-ruby`](https://github.com/rubyide/vscode-ruby/blob/master/packages/language-server-ruby) - language server implementation
- [`ruby-debug-ide-protocol`](https://github.com/rubyide/vscode-ruby/blob/master/packages/ruby-debug-ide-protocol) - implementation of the [ruby-debug-ide protocol](https://github.com/ruby-debug/ruby-debug-ide/blob/master/protocol-spec.md)

Each package utilizes `webpack` or `tsc` to build the `dist` directory, depending up on whether `node_modules` needs to be bundled

Packages that use `webpack` are consumed directly by VS Code. VS Code does not run `npm install` for packages and thus any code must make sure its dependencies are bundled alongside it.

Packages that just use `tsc` are dependencies of other packages.

## Getting Started

- Clone the repo
- run `yarn install`
- run `yarn watch`

`yarn watch` will symlink the `dist` directories from the required packages and start webpack (via `lerna`) in each package. You can look at the `scripts/link-dist.sh` script to see what is happening there.

## Developing

The root `package.json` for the extension depends on the appropriate code being present in the root `dist` directory. The `yarn watch` script above will take care of that for you.

## Debugging

There are several debug profiles defined in `launch.json`:

- `Launch Extension` - this will launch the VS Code extension in a new isntance of VS Code. This will temporarily overwrite any extensions by the same name that are installed
- `Attach to Language Server` - this will attached to the running language server which will allow you to set breakpoints
- `Debugger Server` - this will start a server that will allow you to debug the debugger package

## Running Tests

Each package should have a `yarn test` script defined. You can run all tests for the whole repository with the root `yarn test` command.

## Resources

- [VS Code Extension Docs](https://code.visualstudio.com/api)
- [VS Code Language Server Extension Guide](https://code.visualstudio.com/api/language-extensions/language-server-extension-guide)
- [Language Server Protocol](https://microsoft.github.io/language-server-protocol/)
- [vscode-languageserver-node](https://github.com/microsoft/vscode-languageserver-node)

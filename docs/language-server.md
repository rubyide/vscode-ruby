# Language Server

`language-server-ruby` is an implementation of the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) in TypeScript with the intention of targetting the Ruby programming language.

The server is built to be extensible, accurate, and performant with such features as:

- Automatic Ruby environment detection with support for rvm, rbenv, chruby, and asdf
- Robust language feature extraction powered by the [tree-sitter](https://tree-sitter.github.io/tree-sitter/) project
- Lint support via RuboCop, Reek, and Standard
- Format support via RuboCop, Standard, Rubyfmt, and Rufo
- Semantic code folding support
- Semantic highlighting support
- Intellisense support

Note that the language server is currently under active development!

## Environment Detection

The language server supports a feature that attempts to properly detect your shell configuration for users of rvm, rbenv, chruby, and the asdf version management tools in addition to Rubies that are globally installed. Note that other management tools may work if they correctly expose themselves via the `PATH`, but any tool specific variables will not be imported (see below on why).

### How it works

Most Ruby version managers expose their functionality via shell functions. This requires spawning an interactive login shell to ensure all of your dotfiles are correctly loaded and an accurate environment can be captured.

When a file is opened in your editor, the workspace folder in which that file resides will be used as the directory in which the Ruby environment will be loaded. For non-multi-root workspaces, the root folder will be used instead.

If you are utilizing a monorepo with multiple `Gemfiles`, it is highly recommended you configure that repository as a multi-root workspace, with each directory owning a `Gemfile` configured as a workspace folder.

If you are using multiple versions of Ruby within a monorepo, it is required that you configure your repository as multi-root as otherwise the language server will properly detect your sub-environments.

#### Environment Variable Whitelist

In order to try and minimize processing environment variables that are sensitive or out of scope for the language server, a whitelist is used to filter out variables we don't care about. See `More Information` below to check out this whitelist.

### Limitations

Due to limitations in how node's internal `spawn` function works, a shim file needs to be used to ensure your shell is properly loaded. Right now, POSIX compliant shells, the Fish shell, and `cmd.exe` on Windows are supported.

### More Information

The [`vscode-ruby-common`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-common) package contains the utilities and shims that facilitate this functionality. See [`environment.ts`](https://github.com/rubyide/vscode-ruby/blob/main/packages/vscode-ruby-common/src/environment.ts)

## Logs

The extension exposes a command via the [VSCode Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) to view the Language Server's logs. Just use the `Ruby: Show Language Server Output Channel` command to view the server's logs

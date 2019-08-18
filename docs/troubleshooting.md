# Troubleshooting

## Viewing Logs

The extension exposes two commands via the [VSCode Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) to view logs:

- `Ruby: Show Output Channel` - opens output channel for the Ruby extension
- `Ruby: Show Language Server Output Channel` - opens output channel for the language server

## Syntax Highlighting is incorrect

VSCode relies on static language grammars to facilitate syntax highlighting. These grammars are stored in the [`syntaxes`]() directory in the root of the project.

VSCode has good documentation on how grammars work and how to troubleshoot grammars available [here](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide#scope-inspector).

If you believe the extension is incorrectly assigning TextMate Scopes, please fix the grammar and open a PR!

## Linting or Formatting is incorrect

### Language Server

The language server will log all commands it attempts to run as well as any errors that command generates. Each type of command is prefixed with it's type (eg `Lint` or `Format`). All commands are run with a `cwd` of the workspace root. This is important if you attempt to run the command in your own shell.

The one thing to keep in mind is that all of those commands are configured to accept editor content via `stdin` and cannot be run verbatim in your terminal.

For example, if you see the following in the logs:

```
Lint: executing rubocop -s /Users/wingrunr21/someproject/rubyfile.rb -f json...
```

That is the language server running rubocop against `rubyfile.rb`.

If you'd like to run that command yourself, you can do something similar to the following:

```shell
$ cd /Users/wingrunr21/someproject
$ cat rubyfile.rb | rubocop -s /Users/wingrunr21/someproject/rubyfile.rb -f json
```

The file must be piped into `rubocop` or other utilities. This methodology is the best representation of how the language server runs these commands. If the command succeeds here but not in the language server, additional steps will be necessary to troubleshoot. Please open an issue.

### Legacy

The legacy lint and formatters do not attempt to detect your Ruby environment. This means that VSCode must be started with the appropriate environment set for it to be able to successfully run your lint and format commands. The easiest way to do this is via your terminal:

```shell
$ cd /path/to/my/project
$ rvm/chruby/rbenv/whatever if necessary
$ code .
```

By doing this, your terminal has configured the environment correct and VSCode will inherit that environment when it starts.

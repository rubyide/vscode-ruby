# Visual Studio Code Ruby Extension

 [![Build Status](https://api.travis-ci.org/rubyide/vscode-ruby.svg?branch=master)](https://travis-ci.org/rubyide/vscode-ruby) [![Build status](https://ci.appveyor.com/api/projects/status/vlgs2y7tsc4xpj4c?svg=true)](https://ci.appveyor.com/project/rebornix/vscode-ruby)

This extension provides Ruby language and debugging support for VS Code.

## Table of Contents

<!---
markdown-toc --no-firsth1 --maxdepth 1 readme.md
-->
- [Install](#install)
- [Language Server](#language-server)
- [Debugger](#debugger)
- [Linters](#linters)
- [Formatting](#formatting)
- [Autocomplete](#autocomplete)
- [Intellisense (Go to/Peek Definition/Symbols)](#intellisense-go-topeek-definitionsymbols)
- [TODO](#todo)
- [Contributing](#contributing)
- [License](#license)

Also see the [CHANGELOG](CHANGELOG.md).

## Install

Press `F1`, type `ext install` then search for `ruby`.

### Gem Dependencies

Depending on your setup, you may need to manually install gem dependencies like
`rubocop`, `ruby-debug-ide` or `solargraph`. This can be complicated because
there are many different ways to use Ruby itself - system ruby, rbenv, chruby,
rvm, bundler, etc. Your results may also vary depending on how you start VS Code
and the environment variables present at that time.

The important thing is that if VS Code can't find `rubocop`, our extension can't
either. One way to debug these problems is to investigate within VS Code's
Integrated Terminal. (View > Integrated Terminal). Try `ruby -v`, `gem env
gemdir`, `gem list | grep rubocop`, `which rubocop` and then `rubocop -v`. This
might shed some light on why a gem dependency isn't working.

## Language Server
As of version v0.22.0, a new language server has been introduced into the extension. This server provides the following features:

* Multi-root support
* Balanced pairs (eg `def-end`, `if-end`, etc) highlighting
* Syntax aware code folding
* Diagnostics support (eg lint) with [rubocop](https://github.com/rubocop-hq/rubocop), [reek](https://github.com/troessner/reek), and [standard](https://github.com/testdouble/standard)
* Document/selection formatting support for [rubocop](https://github.com/rubocop-hq/rubocop), [standard](https://github.com/testdouble/standard), and [rufo](https://github.com/ruby-formatter/rufo)
* `DocumentSymbol` support which enables features line the Outline view

The server is designed to slowly replace existing extension functionality. Users can choose to replace that functionality with that of the language server's via the `useLanguageServer` configuration option (set it to `true`). You can verify the server is running via the "Output" tab in VSCode (next to the Terminal).

### Feature Requests
The language server is under active development. You can check [Issue 317](https://github.com/rubyide/vscode-ruby/issues/317) to see the currently proposed feature list. Please do not open GitHub issues for unimplemented features that are already on that list!

## Debugger
### Install Ruby Dependencies
In this extension, we implement [ruby debug ide protocol](http://debug-commons.rubyforge.org/protocol-spec.html) to allow VS Code to communicate with ruby debug, it requires `ruby-debug-ide` to be installed on your machine. This is also how RubyMine/NetBeans does by default.

- If you are using JRuby or Ruby v1.8.x (`jruby`, `ruby_18`, `mingw_18`), run `gem install ruby-debug-ide`.
- If you are using Ruby v1.9.x (`ruby_19`, `mingw_19`), run `gem install ruby-debug-ide`. Make sure `ruby-debug-base19x` is installed together with `ruby-debug-ide`.
- If you are using Ruby v2.x
  * `gem install ruby-debug-ide`
  * `gem install debase` (or `gem install byebug`)

### Add VS Code config to your project
Go to the debugger view of VS Code and hit the gear icon. Choose Ruby or Ruby Debugger from the prompt window, then you'll get the sample launch config in `.vscode/launch.json`. The sample launch configurations include debuggers for RSpec (complete, and active spec file) and Cucumber runs. These examples expect that `bundle install --binstubs` has been called.

### Detailed instruction for debugging Ruby Scripts/Rails/etc
Read following instructions about how to debug ruby/rails/etc locally or remotely
- [Debugger installation](https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation)
- [Launching from VS Code](https://github.com/rubyide/vscode-ruby/wiki/2.-Launching-from-VS-Code)
- [Attaching to a debugger](https://github.com/rubyide/vscode-ruby/wiki/3.-Attaching-to-a-debugger)
- [Running gem scripts](https://github.com/rubyide/vscode-ruby/wiki/4.-Running-gem-scripts)
- [Example configurations](https://github.com/rubyide/vscode-ruby/wiki/5.-Example-configurations)

### Debugger F.A.Q.
#### Conditional breakpoint doesn't work
You need use Ruby `2.0` or above and you need to update `debase` to latest beta version `gem install debase -v 0.2.2.beta10`.

## Linters
### Available Linter hooks
You will need to install the ruby gem for each of these for linting to work (except ruby -wc of course)

* ruby -wc
* rubocop
* ruby-lint
* reek
* fasterer
* debride


Enable each one in your workspace or user settings:

```javascript
// Basic settings: turn linter(s) on
"ruby.lint": {
	"reek": true,
	"rubocop": true,
	"ruby": true, //Runs ruby -wc
	"fasterer": true,
	"debride": true,
	"ruby-lint": true
},

// Time (ms) to wait after keypress before running enabled linters. Ensures
// linters are only run when typing has finished and not for every keypress
"ruby.lintDebounceTime": 500,

//advanced: set command line options for some linters:
"ruby.lint": {
	"ruby": {
		"unicode": true //Runs ruby -wc -Ku
	},
	"rubocop": {
		"only": ["SpaceInsideBlockBraces", "LeadingCommentSpace"],
		"lint": true,
		"rails": true
	},
	"reek": true
}
```

By default no linters are turned on.

Each linter runs only on the newly opened or edited file. This excludes some of the linters functionality, and makes some overly chatty - such as ruby-lint reporting undefined methods. The usual configuration file for each linter will be use as they would be when running from the command line, however settings that include/exclude files will not likely be followed.

Relevant configuration files:
* debride: _none_
* ruby: _none_
* reek: [*.reek](https://github.com/troessner/reek)
* fasterer: [.fasterer.yml](https://github.com/DamirSvrtan/fasterer)
* ruby-lint: [ruby-lint.yml](https://github.com/YorickPeterse/ruby-lint/blob/master/doc/configuration.md)
* rubocop: [.rubocop.yml](http://rubocop.readthedocs.io/en/latest/configuration/)

Settings available (in your VSCode workspace) for each of the linters:

```javascript
"debride": {
	"rails": true //Add some rails call conversions.
}

"ruby"//no settings
"reek" //no settings
"fasterer" //no settings

"ruby-lint": {
	"levels": [/* a subset of these */ "error","warning","info"],
	"classes":[ /* a subset of these */ "argument_amount", "loop_keywords", "pedantics", "shadowing_variables", "undefined_methods", "undefined_variables", "unused_variables", "useless_equality_checks" ]
}

"rubocop": {
	"lint": true, //enable all lint cops.
	"only": [/* array: Run only the specified cop(s) and/or cops in the specified departments. */],
	"except": [/* array: Run all cops enabled by configuration except the specified cop(s) and/or departments. */],
	"forceExclusion": true, //Add --force-exclusion option
	"require": [/* array: Require Ruby files. */],
	"rails": true //Run extra rails cops
}
```
## Formatting

The VS Code Ruby extension can automatically format your Ruby files whenever you save.

### Rubocop

Steps to enable rubocop formatting.

1. Install rubocop with `gem install rubocop`. Note that you may have to turn on some of the AutoCorrect functions in your `.rubocop.yml` file. See the [rubocop documentation](http://rubocop.readthedocs.io/en/latest/configuration/).
2. Add the following to your settings.json:

```
    "[ruby]": {
        "editor.formatOnSave": true
    },
    "ruby.format": "rubocop",
    "editor.formatOnSaveTimeout": 1500
```

Note: VS Code has a timeout that limits file formatters to 750ms which is often not enough time for rubocop to complete, which is why the setting is adjusted above. You may want to tweak this setting to meet your needs. See [#43702](https://github.com/Microsoft/vscode/pull/43702) for more details.

### Rufo

Rufo is an alternative Ruby formatting tool. See the [VS Code Rufo Extension](https://github.com/bessey/vscode-rufo) if you want to try it.

### endwise

endwise is a Visual Studio Code plugin that automatically inserts the `end` keyword where appropriate. See the [VS Code endwise extension](https://github.com/kaiwood/vscode-endwise).

## Autocomplete

The `ruby.codeCompletion` setting lets you select a method for code completion and other intellisense features. Valid options are `rcodetools` and `false`.

### rcodetools

To enable method completion in Ruby, run `gem install rcodetools`. You may need to restart Visual Studio Code the first time.

```ruby
[1, 2, 3].e #<= Press CTRL-Space here
```

### Solargraph

Solargraph is an alternative Ruby code completion tool. See the [Solargraph extension](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph) if you want to try it.

For more information about using Solargraph, refer to the [Solargraph extension](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph).

## Intellisense (Go to/Peek Definition/Symbols)

Use the `ruby.intellisense` setting to select a `go to/peek definition/symbol` method. Valid options are `rubyLocate`, and `false`.

### rubyLocate

The `rubyLocate` option includes workspace parsing functionality. It allows VS Code to `go to definition`, `peak definition` and provides `symbols` for modules, classes, and methods defined within the same workspace. You can set glob patterns to match including and excluding particular files. The exclude match also runs against directories on initial load, to reduce latency. `rubyLocate` uses [ruby-method-locate](https://www.npmjs.com/package/ruby-method-locate) to parse symbols.

The default settings are:

```javascript
"ruby.locate": {
	"include": "**/*.rb",
	"exclude": "{**/@(test|spec|tmp|.*),**/@(test|spec|tmp|.*)/**,**/*_spec.rb}"
}
```

The defaults will include all files with the `rb` extension, but avoids searching within the `test`, `spec`, `tmp` directories, as well as any directories begining with a `.`, AND any files ending with `_spec.rb`.

If you change these settings, currently you will need to reload your workspace.

We now provide go to definition within `erb` files, as well as syntax highlighting for `erb`.

### Solargraph

Solargraph now includes go to/peek definition and other language features. See the [Solargraph extension](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph) for more information.

When using Solargraph it is recommended to set `ruby.intellisense` to `false`.

## Contributing

Feel free to open issues or PRs! We welcome all contributions, even from beginners. If you want to get started with a PR, please do the following:

1. Check out the [VS Code Extension Docs](https://code.visualstudio.com/docs/extensions/overview), especially [Running and Debugging Extensions](https://code.visualstudio.com/docs/extensions/debugging-extensions).
1. Fork this repo.
1. Install dependencies with `npm install`. You'll also need to install dependencies in the `client` and `server` directories.
1. Run `npm run watch` in a shell to get the Typescript compiler running.
1. Run `npm run watch:client` to compile the client and `npm run watch:server` to compile the server. You'll need all three running to do development on the extension.
1. Open the repo directory in VS Code.
1. Make a code change and test it. You can use the Debug tab and the `Launch Extension` configuration to help.
1. Create a branch and submit a PR!

## License

This extension is [licensed under the MIT License](LICENSE.txt).

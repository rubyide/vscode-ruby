# Ruby Language and Debugging Support for Visual Studio Code

[![Join the chat at https://rubyide-slackin.azurewebsites.net](https://rubyide-slackin.azurewebsites.net/badge.svg)](https://rubyide-slackin.azurewebsites.net) [![Build Status](https://travis-ci.org/rubyide/vscode-ruby.svg?branch=master)](https://travis-ci.org/rubyide/vscode-ruby) [![Build status](https://ci.appveyor.com/api/projects/status/vlgs2y7tsc4xpj4c?svg=true)](https://ci.appveyor.com/project/rebornix/vscode-ruby)

This extension provides rich Ruby language and debugging support for Visual Studio Code. Fully tested against *nix/Windows and Ruby 1.9.3 to 2.2.0.
It's still in progress ( [GitHub](https://github.com/rubyide/vscode-ruby.git) ), please expect frequent updates with breaking changes before 1.0. If you are interested in this project, feel free to

* Subscribe to our [mailing list](http://eepurl.com/bTBAfv), get notified when we release new features or fix bugs.
* File GitHub [issues](https://github.com/rubyide/vscode-ruby/issues/new) anytime you ran into unexpected situations/bugs.
* Fork [our project](https://github.com/rubyide/vscode-ruby), hack it around and send us PRs!

## Install
### Install Extension
Press `F1`, type `ext install` then search for `ruby`.

## Debugger
### Install Ruby Dependencies
In this extension, we implement [ruby debug ide protocol](http://debug-commons.rubyforge.org/protocol-spec.html) to allow VS Code to communicate with ruby debug, it requires `ruby-debug-ide` to be installed on your machine. This is also how RubyMine/NetBeans does by default.

- If you are using JRuby or Ruby v1.8.x (`jruby`, `ruby_18`, `mingw_18`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base` is installed together with ruby-debug-ide`.
- If you are using Ruby v1.9.x (`ruby_19`, `mingw_19`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base19x` is installed together with `ruby-debug-ide`.
- If you are using Ruby v2.x
  * `gem install ruby-debug-ide -v 0.4.32` or higher versions
  * `gem install debase -v 0.2.1` or higher versions

### Add VS Code config to your project
Go to the debugger view of VS Code and hit the gear icon. Choose Ruby or Ruby Debugger from the prompt window, then you'll get the sample launch config in `.vscode/launch.json`. The sample launch configurations include debuggers for RSpec (complete, and active spec file) and Cucumber runs. These examples expect that `bundle install --binstubs` has been called.

### Detailed instruction for debugging Ruby Scripts/Rails/etc
Read following instructions about how to debug ruby/rails/etc locally or remotely
- [Debugger installation](https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation)
- [Launching from VS Code](https://github.com/rubyide/vscode-ruby/wiki/2.-Launching-from-VS-Code)
- [Attaching to a debugger](https://github.com/rubyide/vscode-ruby/wiki/3.-Attaching-to-a-debugger)
- [Running gem scripts](https://github.com/rubyide/vscode-ruby/wiki/4.-Running-gem-scripts)
- [Example configurations](https://github.com/rubyide/vscode-ruby/wiki/5.-Example-configurations)

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
}

//advanced: set command line options for some linters:
"ruby.lint": {
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
	"require": [/* array: Require Ruby files. */],
	"rails": true //Run extra rails cops
}
```
## Formatting
Formatting requires the rubocop gem to be installed. Note that you may have to turn on some of the AutoCorrect functions in your `.rubocop.yml` file. See the [rubocop documentation](http://rubocop.readthedocs.io/en/latest/configuration/).

## Autocomplete

To enable method completion in ruby: `gem install rcodetools`. You may need to restart Visual Studio Code the first time.

```ruby
[1, 2, 3].e #<= Press CTRL-Space here
```

## Go to definition

Now includes workspace parsing functionality. Allows VS Code to `go to definition` and `peak definition` for modules, classes, and methods defined within the same workspace. You can set glob patterns to match including and excluding particular files. The exclude match also runs against directories on initial load, to reduce latency.

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

## Features

- Ruby scripts debugging
  * Line breakpoints (add, delete, disable, enable)
  * Step over, step in, step out, continue, pause
  * Multiple, parallel threads
  * Call stack
  * Scope variables
  * Debug console
  * Watch window
  * Variables evaluate/inspect
  * Stop on entry
  * Breaking on uncaught exceptions and errors
  * Attach requests
  * Breakpoints can also be set in `.erb` files

- Ruby remote debug
- Rails debugging
- Unit/Integration tests debugging
  * RSpec
  * Cucumber

- IntelliSense and autocomplete
- Go to definition
  * Including within `.erb` files

- Language colorization support
- Linting
- Code formatting

## TODO
- Ruby scripts debugging
  * Conditional breakpoints
- Unit/Integration tests debugging
  * Shoulda
  * Test::Unit
- Rack
- Rake
- Gem
- IRB console

## Main contributors

- [@rebornix](https://github.com/rebornix)
- [@HookyQR](https://github.com/HookyQR)

## License

This extension is [licensed under the MIT License](LICENSE.txt).

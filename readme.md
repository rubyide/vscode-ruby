# Ruby Language and Debugging Support for Visual Studio Code

[![Join the chat at https://gitter.im/rebornix/vscode-ruby](https://badges.gitter.im/rebornix/vscode-ruby.svg)](https://gitter.im/rebornix/vscode-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This extension provides rich Ruby language and debugging support for Visual Studio Code.
It's still in progress ( [GitHub](https://github.com/rebornix/vscode-ruby.git) ), please expect frequent updates with breaking changes before 1.0.

## Install
### Install Extension
Press `F1`, type `ext install ruby`.

### Install Ruby Dependencies
In this extension, we implement [ruby debug ide protocol](http://debug-commons.rubyforge.org/protocol-spec.html) to allow VS Code to communicate with ruby debug, it requires `ruby-debug-ide` to be installed on your machine. This is also how RubyMine/NetBeans does by default.

- If you are using JRuby or Ruby v1.8.x (`jruby`, `ruby_18`, `mingw_18`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base` is installed together with ruby-debug-ide`.
- If you are using Ruby v1.9.x (`ruby_19`, `mingw_19`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base19x` is installed together with `ruby-debug-ide`.
- If you are using Ruby v2.0.x
  * `gem install ruby-debug-ide -v 0.4.32` or higher versions
  * `gem install debase -v 0.2.1` or higher versions

### Add VS Code config to your project
- create `.vscode` folder under the root directory of your project
- create `launch.json` in `.vscode/` like below
```
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Ruby Debug",
			"type": "Ruby",
			"request": "launch",
			"program": "${workspaceRoot}/main.rb",
			"stopOnEntry": false
		}
	]
}
```

## Features

- Ruby scripts debugging
  * Line breakpoints (add, delete, disable, enable)
  * Step over, step in, step out, continue
  * Multiple, parallel threads
  * Call stack
  * Scope variables
  * Debug console
  * Watch window
  * Variables evaluate/inspect

## TODO
- Ruby scripts debugging
  * Conditional breakpoints
  * Break on entry
  * Breaking on uncaught exceptions and errors
  * Attach requests
- Ruby remote debug
- Unit/Integration tests debugging
  * RSpec
  * Cucumber
  * Shoulda
  * Test::Unit
- Rack
- Rails
- Rake
- Gem
- IRB console
- IntelliSense and autocomplete
- Linting


## License

This extension is [licensed under the MIT License](LICENSE.txt).

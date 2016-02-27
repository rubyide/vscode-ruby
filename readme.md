# PowerShell Language Support for Visual Studio Code

This extension provides rich Ruby language support for Visual Studio Code.
It's still in progress and not useful yet, please expect frequent updates with breaking changes before 1.0.

![Demo GIF](images/debug-ruby-script.gif)

# Install
## Install Extension
Press `F1`, type `ext install ruby`.

## Install Ruby Dependencies
In this extension, we implement [ruby debug ide protocol](http://debug-commons.rubyforge.org/protocol-spec.html) to allow VS Code to communicate with ruby debug. This is also how RubyMine does in default.

- `gem install ruby-debug-ide`
- `gem install ruby-debug-base19x`

## Features

- Local script debugging (currently it only supports single file)

## TODO
- Full support for Continue/StepIn/StepOut/Next
- Variables Inspect and Stack Frame support
- Multithread
- Rails support
- IntelliSense
- Linting

## License

This extension is [licensed under the MIT License](LICENSE.txt).
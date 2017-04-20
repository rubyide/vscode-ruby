# Welcome to the VSCode-Ruby Guide
These pages are primarily intended for rubyist who wish to use Visual Studio Code as their Ruby IDE to improve their productivity in their daily development life.

* [Debugger Installation](#debugger-installation)
  * [Install Ruby Dependencies](#install-ruby-dependencies)
  * [Add VS Code config to your project](#add-vs-code-config-to-your-project)
* [Debugging from VS Code](#debugging-from-vs-code)
  * [Setting up your launcher](#setting-up-your-laucher)
  * [Available settings](#available-settings)
  * [Available VS Code defined variables](#available-vs-code-defined-variables)

## Debugger Installation
### Install Ruby Dependencies
Debugging in this extension implements the [ruby debug ide protocol](http://debug-commons.rubyforge.org/protocol-spec.html) to allow VS Code to communicate with ruby debug, it requires `ruby-debug-ide` to be installed on your machine. This is also how RubyMine/NetBeans implement debugging by default.

- If you are using JRuby or Ruby v1.8.x (`jruby`, `ruby_18`, `mingw_18`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base` is installed together with ruby-debug-ide`.
- If you are using Ruby v1.9.x (`ruby_19`, `mingw_19`)
  * `gem install ruby-debug-ide`, the latest version is `0.6.0`. Make sure `ruby-debug-base19x` is installed together with `ruby-debug-ide`.
- If you are using Ruby v2.x
  * `gem install ruby-debug-ide -v 0.4.32` or higher versions
  * `gem install debase -v 0.2.1` or higher versions

### Add VS Code config to your project
Go to the debugger view of VS Code and hit the gear icon. Choose Ruby or Ruby Debugger from the prompt window, then you'll get the sample launch config in `.vscode/launch.json`


## Debugging from VS Code

### Setting up your launcher

Open the VS Code `launch.json` file by clicking the gear icon in the debug side bar.

If you don't have one an environment selection option should pop up. Select `Ruby`. This will give you a basic debug configuration.

The simplest `launch.json` for Ruby looks like this:
```json
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Debug Local",
			"type": "Ruby",
			"request": "launch",
			"program": "${workspaceRoot}/main.rb"
		}
	]
}
```

This has just one configuration in the `configurations` array. You can add as many as you want here, as long as the `name` element is unique.

Pressing the debug start button (the play icon) will start the debugger and load the file `main.rb` from the base directory of the workspace as the executable script. All environment variables set when VS Code was executed will be passed to the provided `program`. By default, the folder the `program` is in is set as the current working directory.

### Available settings
**"name"**
You can set this to what ever you want. It will need to be unique within the `configurations` array. This is the string that will be shown in the drop-down selector on the debug side bar.

**"type"**
Must be `"Ruby"`. This tells VS Code what debugger to run.

**"request"**
Either `"launch"` - which enables launching the provided program directly from VS Code - or `"attach"` - which allows you to attach to a remote debug session.

**"program"**
[*variable substitution available*](#available-vs-code-defined-variables)

This is the ruby script that will first be launched when debugging is started. You should not rely on relative paths working. If the file is in your workspace (which is usually is) this string should have the structure `"${workspaceRoot}/path/to/script.rb"`.

You could debug the current open file with just `"program": "${file}"`.

**"cwd"**
[*variable substitution available*](#available-vs-code-defined-variables)

By default, the working directory is set to the location of the file provided in the `program` string. It is common for this value to be set to `"cwd": "${workspaceRoot}"`.

**"stopOnEntry"**
Stop program execution on the first line always. Note that all active breakpoints are set before the debugger starts even if this field is not set. Valid options are `true` and `false` (default).

**"showDebuggerOutput"**
Provide some extra output to the debug terminal, specifically about the running of `rdebug-ide`. Valid options are `true` and `false` (default).

**"args"**
[*variable substitution available*](#available-vs-code-defined-variables)

An array of arguments to provide to the script under debug. Each string in the array is sent as a seperate argument, so if you would call the script from a terminal as:
```
ruby main.js --infile '/the/file name/with spaces' --count 3 --base
```

this setting should read:
```json
	"args": ["--infile", "/the/file name/with spaces", "--count", "3"]
```

There is no need to include the quotes around the second argument. Doing so would actually result in the string *WITH* the quotes being passed to the script.

**"env"**
[*variable substitution available*](#available-vs-code-defined-variables)

Provide a hash of environment variable to set before launching the program. For example:
```json
	"env": {
		"BASE": "${workspaceRoot}",
		"EXT": "${fileExtname}",
		"RAILS_ENV": "test"
	}
```

**"pathToRDebugIDE"**
Set the absolute path to `rdebug-ide` if it's not in your `PATH`. On windows you need to provide the `.bat` file.

**"useBundler"**
Run `rdebug-ide` within `bundler exec`. You may need to do this if you've installed the `ruby-debug-ide` gem within your project. Valid options are `true` and `false` (default).

**"pathToBundler"**
If you have `useBundler` set, and `bundler` isn't in your `PATH`, set the absolute path here. If you're wrapping in bundler, you shouldn't need to provide a `pathToRDebugIDE` setting. On windows you need to provide the `.bat` file.

Also, if you've installed with the `bundler install --binstubs` you should be able to skip the bundler related settings and use `"pathToRDebugIDE": "${workspaceRoot}/bin/rdebug-ide"`. 


### Available VS Code defined variables

|||
|---|---|
| `${workspaceRoot}` | the path of the folder opened in VS Code |
| `${file}` | the current opened file |
| `${fileBasename}` | the current opened file's basename |
| `${fileDirname}` | the current opened file's dirname |
| `${fileExtname}` | the current opened file's extension |

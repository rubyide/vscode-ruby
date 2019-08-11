# Legacy Features

## Table of Contents

<!---
markdown-toc --no-firsth1 --maxdepth 1 readme.md
-->

- [Linters](#linters)
- [Formatting](#formatting)
- [Autocomplete](#autocomplete)
- [Intellisense (Go to/Peek Definition/Symbols)](#intellisense-go-topeek-definitionsymbols)

## Linters

### Available Linter hooks

You will need to install the ruby gem for each of these for linting to work (except ruby -wc of course)

- ruby -wc
- rubocop
- ruby-lint
- reek
- fasterer
- debride

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

- debride: _none_
- ruby: _none_
- reek: [\*.reek](https://github.com/troessner/reek)
- fasterer: [.fasterer.yml](https://github.com/DamirSvrtan/fasterer)
- ruby-lint: [ruby-lint.yml](https://github.com/YorickPeterse/ruby-lint/blob/master/doc/configuration.md)
- rubocop: [.rubocop.yml](http://rubocop.readthedocs.io/en/latest/configuration/)

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
	"lint": true, //Run only lint cops.
	"only": [/* array: Run only the specified cop(s) and/or cops in the specified departments. */],
	"except": [/* array: Run all cops enabled by configuration except the specified cop(s) and/or departments. */],
	"forceExclusion": true, //Add --force-exclusion option
	"require": [/* array: Require Ruby files. */],
	"rails": true //Run extra rails cops. Note [this was removed in RuboCop 0.72.0](https://github.com/rubocop-hq/rubocop/issues/5976)
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

## Autocomplete

The `ruby.codeCompletion` setting lets you select a method for code completion and other intellisense features. Valid options are `rcodetools` and `false`.

### rcodetools

To enable method completion in Ruby, run `gem install rcodetools`. You may need to restart Visual Studio Code the first time.

```ruby
[1, 2, 3].e #<= Press CTRL-Space here
```

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

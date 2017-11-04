### 0.15.0 - August 21 2017
VSCode added an API for task auto detection and now we brought this feature to Ruby. From this version, you can `Run Tasks` and the extesion will load Rake tasks for you automatically, if there is Rakefile available in the project.

Notable changes:
* Rubocop linter will be reloaded when it fails
* [@tobychin](https://github.com/tobychin): Add a Rake task snippet

Engineering:
* Debug Apater and Debug Protocol are updated to latest verison.

### 0.14.0 - August 11 2017
We did a huge code refactoring with the code base in this milestone. The project consists of two parts, debugger and language features. The former was written in TypeScript from the very begining while the latter was originally written in JavaScript. To make it easier to maintain and contribute, we now port the code base to TypeScript. There are still several files in JavaScript and we will transform step by step.

Notable changes:
* Ruby (ruby -wc) linter honors ruby intepreter path config.
* Update vscode engine to `^1.12.0`, users will not get update if they are using VSCode older than that.
* Load ruby related system environment when extension gets activated. Launch VSCode from Dock will work the same as from command line.

### 0.13.0 - August 3 2017
Notable changes:
* [Make stacktrace handling of missing files more robust](https://github.com/rubyide/vscode-ruby/pull/145)
* [Fix the "debuggerPort" option](https://github.com/rubyide/vscode-ruby/pull/148)
* [Fix snippet syntax errors](https://github.com/rubyide/vscode-ruby/pull/168)
* [Completely fix too many open files issue by using queue](https://github.com/rubyide/vscode-ruby/pull/178)

### 0.12.1 - April 25 2017
Fix rubocop linter regression :)

### 0.12.0 - April 17 2017
It has been quite a while since our latest release but we are back with Conditional Breakpoint, Multiple Ruby processes debugging and more!

This version was entirely done by the community, many thanks to [ukblewis](https://github.com/ukblewis), [gshaw](https://github.com/gshaw), [seraku24](https://github.com/seraku24), [danielgracia](https://github.com/danielgracia), [ypresto](https://github.com/ypresto), [jtokoph](https://github.com/jtokoph), [Darep](https://github.com/Darep).

Notable changes:
* [Conditional breakpoint support](https://github.com/rubyide/vscode-ruby/commit/6c7311dbccb562f8a90a433417ce63856852310b) by [seraku24](https://github.com/seraku24). Please upgrade `debase` to `0.2.2.beta10` manually.
* [Debug multiple Ruby processes at once](https://github.com/rubyide/vscode-ruby/pull/127) by [ukblewis](https://github.com/ukblewis)
* [Fix squiggly heredoc syntax](https://github.com/rubyide/vscode-ruby/commit/6d4dcc2528308d6640908c0ed5f6d32f3af44e7b) by [gshaw](https://github.com/gshaw)
* [Add config to set Unicode handling on `ruby -wc` linting](https://github.com/rubyide/vscode-ruby/commit/9c6ab8ec7064400892078faa1ea147dac64039cc) by [danielgracia](https://github.com/danielgracia)
* [Add document and workspace symbol provider](https://github.com/rubyide/vscode-ruby/pull/107) by [ypresto](https://github.com/ypresto)
* [Add common ERB snippets](https://github.com/rubyide/vscode-ruby/commit/e9c8dc54f022a5848995d868494e96095e6a3638) by [jtokoph](https://github.com/jtokoph)
* [Recognize .jbuilder file extension as Ruby](https://github.com/rubyide/vscode-ruby/commit/b5cfd97758700a5718db276e4707c1f4bf0a2a9d) [Darep](https://github.com/Darep)

### 0.10.3 - 20 Nov 2016
* Improve formattings support
* Remove un-used setting
* Add (this) change log

### Start of change log

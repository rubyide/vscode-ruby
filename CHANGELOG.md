### 0.18.0 - Apr 10 2018

Notable changes:
* [Add tslint/prettier for linting/formatting](https://github.com/rubyide/vscode-ruby/pull/299) by [Adam Doppelt](https://github.com/gurgeous)
* [Added support for ruby.format, defaults to false (no formatting)](https://github.com/rubyide/vscode-ruby/pull/298) by [Adam Doppelt](https://github.com/gurgeous)
* [Better error handling & messages when running RuboCop formatting](https://github.com/rubyide/vscode-ruby/pull/297) by [Adam Doppelt](https://github.com/gurgeous)
* [set ruby.useBundler config option type to boolean](https://github.com/rubyide/vscode-ruby/commit/399a614a6708c455824ca75bf184d5093aa1749d) by [Gabriel Arjones](https://github.com/g-arjones)
* [support running launch entries without debugging](https://github.com/rubyide/vscode-ruby/pull/266) by [Sylvain Joyeux](https://github.com/doudou)
* [Debounce linting to prevent running on every keypress](https://github.com/rubyide/vscode-ruby/pull/264) by [Sam Killgallon](https://github.com/Sam-Killgallon)
* [Add forceExclusion flag to rubocop setting](https://github.com/rubyide/vscode-ruby/pull/217) by [cyang6](https://github.com/cyang6)
* [Remove solargraph dependency and update codeCompletion and intellisense options](https://github.com/rubyide/vscode-ruby/pull/309) by [Fred Snyder](https://github.com/castwide)

Enhanced documentation:
* [Readme update about gem dependencies](https://github.com/rubyide/vscode-ruby/pull/327) by [Adam Doppelt](https://github.com/gurgeous)
* [Readme update about new debase gem](https://github.com/rubyide/vscode-ruby/pull/313) by [Kevin Coleman](https://github.com/KevinColemanInc)

### 0.17.0 - Mar 4 2018
A release driven by [Stafford Brunk](https://github.com/wingrunr21) and community, thanks all for your contribution.

Notable changes:
* [Syntax Highlighting rollback and enhancement](https://github.com/rubyide/vscode-ruby/pull/279), we upgraded our syntax to upstream one but that broke original syntax highlighting behavior. Here we brought it back but we still keep the goodness of upstream syntax.
* [Bundler setting for Linters](https://github.com/rubyide/vscode-ruby/commit/1be81cc75e56fd31da18d6d5bfca2f9cef35dd5e), linters now honor `pathToBundler` and `useBundler` settings.
* [CSS, JS, and Ruby can be embedded in ERB](https://github.com/rubyide/vscode-ruby/commit/1af8efb72591b575cf7468aa309ae9691632071d)

### 0.16.0 - Jan 25 2018
It has been half a year since our last release but even though rebornix is away from this extension most of time, the community is helping it improve and pushing it to its limit. Special thanks to [Stafford Brunk
](https://github.com/wingrunr21) who reached out to me and tried to review issues and PRs. And of course, thanks to all contributors and users.

Notable changes:
* [Task 2.0](https://github.com/rubyide/vscode-ruby/pull/244) by [Sylvain Joyeux](https://github.com/doudou)
* Indentation rules update: [1](https://github.com/rubyide/vscode-ruby/pull/231) by [TeeSeal](https://github.com/TeeSeal) [2](https://github.com/rubyide/vscode-ruby/pull/223) by [Jared Wyatt](https://github.com/wyattisimo)
* [Grammar tracking improvements](https://github.com/rubyide/vscode-ruby/pull/242) by [Stafford Brunk](https://github.com/wingrunr21)
* [WorkspaceRoot and bundler support](https://github.com/rubyide/vscode-ruby/pull/232) by [Stafford Brunk](https://github.com/wingrunr21)
* [Fix getEntry regex to handle additional cases](https://github.com/rubyide/vscode-ruby/pull/250) by [Stafford Brunk](https://github.com/wingrunr21)
* [Fix Shebang detection](https://github.com/rubyide/vscode-ruby/pull/249) by [Stafford Brunk](https://github.com/wingrunr21)
* [Add single line comment for erb](https://github.com/rubyide/vscode-ruby/pull/224) by [NickWarm](https://github.com/NickWarm)
* [Grammar update](https://github.com/rubyide/vscode-ruby/pull/199) by [Joshua Azemoh](https://github.com/azemoh)
* [define the 'includes' field in the debug configuration](https://github.com/rubyide/vscode-ruby/pull/243) by [Sylvain Joyeux](https://github.com/doudou)
* [Typo fix;)](https://github.com/rubyide/vscode-ruby/pull/204) by [Richard Keenan](https://github.com/richkeenan)

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

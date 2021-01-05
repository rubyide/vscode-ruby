### 0.28.0 - Jan 5 2021

Improvements:

- when a setBreakpoint requests is received, only respond once [#688](https://github.com/rubyide/vscode-ruby/issues/688)
- Support Prettier for Ruby [#690](https://github.com/rubyide/vscode-ruby/issues/690)
- Grammar improvements:
  - `:`, `@`, and `$` before `do` [#660](https://github.com/rubyide/vscode-ruby/issues/660)
  - method parameter detection and multiline parameters [#664](https://github.com/rubyide/vscode-ruby/issues/664)
  - fix hashkey with trailing `!` or `?` [#672](https://github.com/rubyide/vscode-ruby/issues/672)
  - yard syntax improvements [#673](https://github.com/rubyide/vscode-ruby/issues/673)
- Add default debug configuration for minitest [#631](https://github.com/rubyide/vscode-ruby/issues/631)
- Modern rubyfmt support [#628](https://github.com/rubyide/vscode-ruby/issues/628). Note that `rubyfmt` is no longer shipped with this extension!
- Add log level support. Resolves [#526](https://github.com/rubyide/vscode-ruby/issues/526). Log level is set in the `ruby.languageServer.logLevel` configuration option.

Bug Fixes:

- wrap `documentPath.fsPath` in single quotes to support file paths with spaces [#647](https://github.com/rubyide/vscode-ruby/issues/647)]
- Drops `known_function_names` matcher in grammar. Resolves [#591](https://github.com/rubyide/vscode-ruby/issues/591)

### 0.27.0 - Feb 23 2020

Improvements:

- Provide evaluateName property, so variable values can be copied from debugger. [#546](https://github.com/rubyide/vscode-ruby/pull/546)
- Add reference to debug configuration doc. [#564](https://github.com/rubyide/vscode-ruby/pull/564)
- Add stdin-filename arg to Reek linter. [#575](https://github.com/rubyide/vscode-ruby/pull/575)
- Add Unix domain socket support to the debugger. [#586](https://github.com/rubyide/vscode-ruby/pull/586)
- Whitelist `BUNDLE_PATH` env variable. [#588](https://github.com/rubyide/vscode-ruby/pull/588)
- Whitelist additional variables for asdf and rbenv. Resolves [#572](https://github.com/rubyide/vscode-ruby/issues/572)

Bug Fixes:

- Handle undefined workspace root folders. Resolves [#533](https://github.com/rubyide/vscode-ruby/issues/533)
- Identify 1 or more ! as keyword.operator.logical.ruby. Resolves [#573](https://github.com/rubyide/vscode-ruby/issues/573)
- Add additional meta.function-call.ruby scope matching. Resolves [#579](https://github.com/rubyide/vscode-ruby/issues/579)
- Match variable.other.ruby through the end of the line. Resolves [#579](https://github.com/rubyide/vscode-ruby/issues/579)

### 0.26.0 - Nov 19 2019

General Changes:

- Official support for remote environments [#551](https://github.com/rubyide/vscode-ruby/pull/551)
- Fish shell support [#523](https://github.com/rubyide/vscode-ruby/issues/523)
- The grammar, language configuration, and snippets are moved into the `vscode-ruby` package. This package is specified as a UI only package. Resolves [#537](https://github.com/rubyide/vscode-ruby/issues/537) [#483](https://github.com/rubyide/vscode-ruby/issues/483)
- Environment detection is moved into the language server so that it will run within the workspace [#488](https://github.com/rubyide/vscode-ruby/issues/488)

Improvements:

- Flags appropriate configuration settings as `machine-overridable` [#490](https://github.com/rubyide/vscode-ruby/issues/490)
- Add `.chefignore` as an `Ignore` file type
- Improve syntax highlighting regex for functions ending in `!` or `?` [#541](https://github.com/rubyide/vscode-ruby/pull/541)
- Add switch case statement snippet [#542](https://github.com/rubyide/vscode-ruby/pull/542)

Bug Fixes:

- Filter out linters that are disabled in configuration [550](https://github.com/rubyide/vscode-ruby/pull/550)

### 0.25.3 - Sept 4 2019

Bug Fixes:

- Remove usage of Array.flat() [#528](https://github.com/rubyide/vscode-ruby/issues/528)

### 0.25.2 - Sept 3 2019

Bug Fixes:

- Fix regression with intellisense provider [#525](https://github.com/rubyide/vscode-ruby/issues/525)

### 0.25.1 - Sept 2 2019

Bug Fixes:

- Use shields.io badge for CircleCI as the VSCode documentation is wrong
- Fix ERB syntax highlighting within HTML tags [#498](https://github.com/rubyide/vscode-ruby/issues/498)
- Fix incorrect parsing of `attr_` calls with multiple arguments
- Fixed regression with the RuboCop formatter where failed calls replaced the file's contents with the error

### 0.25.0 - Sept 1 2019

General Changes:

- Repository rearranged to support a lerna/yarn workspaces workflow
- Ruby grammar now vendored and not reliant on upstream Atom grammar
- `tree-sitter` and `tree-sitter-ruby` are now vendored as WASM distributions [#506](https://github.com/rubyide/vscode-ruby/issues/506) and [#486](https://github.com/rubyide/vscode-ruby/issues/486)
- Move from TravisCI to CircleCI
- Add CodeCov
- Move from tslint to eslint
- Bundle extension with WebPack so the overall size is smaller
- Drop testing on unsupported Ruby versions and 32-bit Ruby on Windows

Improvements:

- Support SLIM heredocs [#274](https://github.com/rubyide/vscode-ruby/issues/274)
- Support heredocs defined inline during a method call [#183](https://github.com/rubyide/vscode-ruby/issues/183)
- Drop `spawn-rx` for custom version which allows greater control over failed commands
- Support [RubyFMT](https://github.com/penelopezone/rubyfmt) as a formatter [#445](https://github.com/rubyide/vscode-ruby/issues/445)
- Add command palette entries for viewing extension and language server logs (`Ruby: Show Output Channel` and `Ruby: Show Language Server Output Channel`)
- Support multiline and keyword option YARD comments [#371](https://github.com/rubyide/vscode-ruby/pull/371)
- Improve/Fix Block Parameter Highlighting [#514](https://github.com/rubyide/vscode-ruby/pull/514)

Bug Fixes:

- Support RuboCop's more detailed offense start/end locations [#466](https://github.com/rubyide/vscode-ruby/issues/466)
- Fix assignments being incorrectly identified as constants in the outline [#473](https://github.com/rubyide/vscode-ruby/issues/473)
- Change TextMate scope for safe navigation operator to be `keyword.operator.logical.ruby` [#288](https://github.com/rubyide/vscode-ruby/issues/288)

- Fix for multiple linters' output not showing up at the same time [#524](https://github.com/rubyide/vscode-ruby/issues/524)
- Better detection of RuboCop format output delimeter [#519](https://github.com/rubyide/vscode-ruby/issues/519)

Documentation:

- Complete overhaul of documentation including rewriting a majority of documentation around the formatting and linting configuration for the language server

### 0.24.2 - Jul 23 2019

Improvements:

- Update `decreaseIndentPattern` to match Atom [#509](https://github.com/rubyide/vscode-ruby/pull/509)

Bug Fixes:

- Upgrade `tree-sitter` to `^0.15.8` to get new prebuilt binaries

### 0.24.1 - Jul 11 2019

Bug Fixes:

- Upgrade `tree-sitter-ruby` to `^0.15.1` to get new prebuilt binaries

### 0.24.0 - Jun 27 2019

Bug Fixes:

- Path manipulation via correct OS path class [#477](https://github.com/rubyide/vscode-ruby/pull/477)
- Pass `LANG` environment variable to server [#494](https://github.com/rubyide/vscode-ruby/pull/494)
- Add rake task definition to fix customization of auto-detected tasks [#497](https://github.com/rubyide/vscode-ruby/pull/497)
- Fix bug in locate.js [#499](https://github.com/rubyide/vscode-ruby/pull/499)

Documentation:

- Clarify rubocop configuration for 'lint:true' [#492](https://github.com/rubyide/vscode-ruby/pull/492)

### 0.23.0 - Jun 11 2019

Improvements:

- Add node runtime support for the first step towards remote development [#480](https://github.com/rubyide/vscode-ruby/pull/480)
- Update `ruby-method-locate` to v0.0.6. Resolves [#444](https://github.com/rubyide/vscode-ruby/issues/444)
- Add `--force-exclusion` to reek options. [#287](https://github.com/rubyide/vscode-ruby/pull/287)

Bug Fixes:

- Ignore linter output on `stderr`. Resolves [#474](https://github.com/rubyide/vscode-ruby/issues/474)
- Standard should use `--no-fix`. Resolves [#447](https://github.com/rubyide/vscode-ruby/issues/447)
- RuboCop `except` and `only` flags are for linters, not files. Resolves [#459](https://github.com/rubyide/vscode-ruby/issues/459)
- Fix automatic Rake detection. [#456](https://github.com/rubyide/vscode-ruby/pull/456)
- Don't register legacy formatter provider when language server is enabled
- Update lodash to mitigate CVE-2018-16487
- Update tree-sitter and tree-sitter-ruby for new node binary support
- Update mocha and nyc to mitigate js-yaml vulnerability
- Update prebuild and prebuild-install to migitate file overwrite vulnerability
- Update vscode to mitigate gulp-untar vulnerability

Documentation:

- Remove TODO section from table of contents [#449](https://github.com/rubyide/vscode-ruby/pull/449)
- Update extension recommendations. [#481](https://github.com/rubyide/vscode-ruby/pull/456)
- README update for viewing language server output. [#471](https://github.com/rubyide/vscode-ruby/pull/471)
- Fix link in README for ruby debug IDE protocol [#463](https://github.com/rubyide/vscode-ruby/pull/463/files)

### 0.22.3 - Mar 6 2019

Bug Fixes:

- Support Windows cmd.exe for environment detection. Resolves [#438](https://github.com/rubyide/vscode-ruby/issues/438)
- Buffer `stdout` from lint/format commands. Resolves [#435](https://github.com/rubyide/vscode-ruby/issues/435) and [#443](https://github.com/rubyide/vscode-ruby/issues/443)

### 0.22.2 - Feb 24 2019

Improvements:

- Reduce plugin size by correctly pruning down to production dependencies in client and server packages
- Upgrade required VSCode engine to `^1.30.0`

Bug Fixes:

- Implement more robust ENV variable processing
- Call default shell directly instead of via `/usr/bin/env` to be more POSIX compliant. Resolves [#433](https://github.com/rubyide/vscode-ruby/issues/433)
- Fix a few selection formatting bugs. Resolves [#434](https://github.com/rubyide/vscode-ruby/issues/434)
- Gracefully handle unsupported linters in settings. Resolves [#437](https://github.com/rubyide/vscode-ruby/issues/437)

### 0.22.1 - Feb 21 2019

Bug Fixes:

- Set archive files to ignored so they don't get published
- Whitelist the `HOME` environment variable in the environment detection
- Fix for opening single files and not having the language server crash

### 0.22.0 - Feb 20 2019

Notable Changes:

- [Multi-root support, lint support, DocumentSymbol support, and more!](https://github.com/rubyide/vscode-ruby/pull/405) by [wingrunr21](https://github.com/wingrunr21)

### 0.21.1 - Feb 12 2019

Bug Fixes:

- Upgrade `tree-sitter` and `tree-sitter-ruby` to versions compatible with Node ABI v64

Improvements:

- [Update settings panel title](https://github.com/rubyide/vscode-ruby/pull/419) by [vnbrs](https://github.com/vnbrs)

### 0.21.0 - Dec 9 2018

Notable Changes:

- Update ruby grammar to support quoted heredocs. See atom/language-ruby#212
- [Improve configuration provider](https://github.com/rubyide/vscode-ruby/pull/408) by [YisraelV](https://github.com/YisraelV). Resolves [#404](https://github.com/rubyide/vscode-ruby/issues/404)
- [Call the async-callback to clear parseQueue of items](https://github.com/rubyide/vscode-ruby/pull/399) by [peret](https://github.com/peret)
- [Mark `deliverfile` as Ruby file](https://github.com/rubyide/vscode-ruby/pull/395) by [remcohaszing](https://github.com/remcohaszing)

Bug Fixes:

- [Fix linter offenses not updating after re-opening a file.](https://github.com/rubyide/vscode-ruby/pull/409) by [peret](https://github.com/peret). Resolves [#373](https://github.com/rubyide/vscode-ruby/issues/373)
- [Respect ruby.pathToBundler for RuboCop executable](https://github.com/rubyide/vscode-ruby/pull/407) by [spilist](https://github.com/spilist)
- [fix wrong placeholder in "if else" snippet](https://github.com/rubyide/vscode-ruby/pull/272) by [doudou](https://github.com/doudou)

Enhanced Documentation:

- [Add endwise to README.md](https://github.com/rubyide/vscode-ruby/pull/401) by [michielboekhoff](https://github.com/michielboekhoff)
- [Improve Documentation on RuboCop](https://github.com/rubyide/vscode-ruby/pull/384) by [alex-tan](https://github.com/alex-tan)

### 0.20.0 - Aug 7 2018

First release with the proof of concept internal language server

Notable Changes:

- [Language Server - proof of concept](https://github.com/rubyide/vscode-ruby/pull/366) by [wingrunr21](https://github.com/wingrunr21)

Bug Fixes:

- [Respect the bundler option when formatting](https://github.com/rubyide/vscode-ruby/pull/357) by [narinari](https://github.com/narinari)

Enhanced Documentation:

- [Fixes broken anchor link in README](https://github.com/rubyide/vscode-ruby/pull/362) by [ecbrodie](https://github.com/ecbrodie)

### 0.19.0 - Jun 19 2018

Notable Changes:

- [Fix bug where word match includes colon](https://github.com/rubyide/vscode-ruby/pull/353) by [toddmazierski](https://github.com/toddmazierski)
- [Only override paths when file actually exists within cwd/remoteRoot](https://github.com/rubyide/vscode-ruby/pull/350) by [stefansedich](https://github.com/stefansedich)
- [Remove explicit gem versions](https://github.com/rubyide/vscode-ruby/pull/334) by [perlun](https://github.com/perlun)
- [Restrict language server to local files](https://github.com/rubyide/vscode-ruby/pull/326) by [lostintangent](https://github.com/lostintangent)

Enhanced Documentation:

- [Add README clarifications for rubyLocate and Solargraph](https://github.com/rubyide/vscode-ruby/pull/340) by [lumean](https://github.com/lumean)

### 0.18.0 - Apr 10 2018

Notable changes:

- [Add tslint/prettier for linting/formatting](https://github.com/rubyide/vscode-ruby/pull/299) by [Adam Doppelt](https://github.com/gurgeous)
- [Added support for ruby.format, defaults to false (no formatting)](https://github.com/rubyide/vscode-ruby/pull/298) by [Adam Doppelt](https://github.com/gurgeous)
- [Better error handling & messages when running RuboCop formatting](https://github.com/rubyide/vscode-ruby/pull/297) by [Adam Doppelt](https://github.com/gurgeous)
- [set ruby.useBundler config option type to boolean](https://github.com/rubyide/vscode-ruby/commit/399a614a6708c455824ca75bf184d5093aa1749d) by [Gabriel Arjones](https://github.com/g-arjones)
- [support running launch entries without debugging](https://github.com/rubyide/vscode-ruby/pull/266) by [Sylvain Joyeux](https://github.com/doudou)
- [Debounce linting to prevent running on every keypress](https://github.com/rubyide/vscode-ruby/pull/264) by [Sam Killgallon](https://github.com/Sam-Killgallon)
- [Add forceExclusion flag to rubocop setting](https://github.com/rubyide/vscode-ruby/pull/217) by [cyang6](https://github.com/cyang6)
- [Remove solargraph dependency and update codeCompletion and intellisense options](https://github.com/rubyide/vscode-ruby/pull/309) by [Fred Snyder](https://github.com/castwide)

Enhanced documentation:

- [Readme update about gem dependencies](https://github.com/rubyide/vscode-ruby/pull/327) by [Adam Doppelt](https://github.com/gurgeous)
- [Readme update about new debase gem](https://github.com/rubyide/vscode-ruby/pull/313) by [Kevin Coleman](https://github.com/KevinColemanInc)

### 0.17.0 - Mar 4 2018

A release driven by [Stafford Brunk](https://github.com/wingrunr21) and community, thanks all for your contribution.

Notable changes:

- [Syntax Highlighting rollback and enhancement](https://github.com/rubyide/vscode-ruby/pull/279), we upgraded our syntax to upstream one but that broke original syntax highlighting behavior. Here we brought it back but we still keep the goodness of upstream syntax.
- [Bundler setting for Linters](https://github.com/rubyide/vscode-ruby/commit/1be81cc75e56fd31da18d6d5bfca2f9cef35dd5e), linters now honor `pathToBundler` and `useBundler` settings.
- [CSS, JS, and Ruby can be embedded in ERB](https://github.com/rubyide/vscode-ruby/commit/1af8efb72591b575cf7468aa309ae9691632071d)

### 0.16.0 - Jan 25 2018

It has been half a year since our last release but even though rebornix is away from this extension most of time, the community is helping it improve and pushing it to its limit. Special thanks to [Stafford Brunk
](https://github.com/wingrunr21) who reached out to me and tried to review issues and PRs. And of course, thanks to all contributors and users.

Notable changes:

- [Task 2.0](https://github.com/rubyide/vscode-ruby/pull/244) by [Sylvain Joyeux](https://github.com/doudou)
- Indentation rules update: [1](https://github.com/rubyide/vscode-ruby/pull/231) by [TeeSeal](https://github.com/TeeSeal) [2](https://github.com/rubyide/vscode-ruby/pull/223) by [Jared Wyatt](https://github.com/wyattisimo)
- [Grammar tracking improvements](https://github.com/rubyide/vscode-ruby/pull/242) by [Stafford Brunk](https://github.com/wingrunr21)
- [WorkspaceRoot and bundler support](https://github.com/rubyide/vscode-ruby/pull/232) by [Stafford Brunk](https://github.com/wingrunr21)
- [Fix getEntry regex to handle additional cases](https://github.com/rubyide/vscode-ruby/pull/250) by [Stafford Brunk](https://github.com/wingrunr21)
- [Fix Shebang detection](https://github.com/rubyide/vscode-ruby/pull/249) by [Stafford Brunk](https://github.com/wingrunr21)
- [Add single line comment for erb](https://github.com/rubyide/vscode-ruby/pull/224) by [NickWarm](https://github.com/NickWarm)
- [Grammar update](https://github.com/rubyide/vscode-ruby/pull/199) by [Joshua Azemoh](https://github.com/azemoh)
- [define the 'includes' field in the debug configuration](https://github.com/rubyide/vscode-ruby/pull/243) by [Sylvain Joyeux](https://github.com/doudou)
- [Typo fix;)](https://github.com/rubyide/vscode-ruby/pull/204) by [Richard Keenan](https://github.com/richkeenan)

### 0.15.0 - August 21 2017

VSCode added an API for task auto detection and now we brought this feature to Ruby. From this version, you can `Run Tasks` and the extesion will load Rake tasks for you automatically, if there is Rakefile available in the project.

Notable changes:

- Rubocop linter will be reloaded when it fails
- [@tobychin](https://github.com/tobychin): Add a Rake task snippet

Engineering:

- Debug Apater and Debug Protocol are updated to latest verison.

### 0.14.0 - August 11 2017

We did a huge code refactoring with the code base in this milestone. The project consists of two parts, debugger and language features. The former was written in TypeScript from the very begining while the latter was originally written in JavaScript. To make it easier to maintain and contribute, we now port the code base to TypeScript. There are still several files in JavaScript and we will transform step by step.

Notable changes:

- Ruby (ruby -wc) linter honors ruby intepreter path config.
- Update vscode engine to `^1.12.0`, users will not get update if they are using VSCode older than that.
- Load ruby related system environment when extension gets activated. Launch VSCode from Dock will work the same as from command line.

### 0.13.0 - August 3 2017

Notable changes:

- [Make stacktrace handling of missing files more robust](https://github.com/rubyide/vscode-ruby/pull/145)
- [Fix the "debuggerPort" option](https://github.com/rubyide/vscode-ruby/pull/148)
- [Fix snippet syntax errors](https://github.com/rubyide/vscode-ruby/pull/168)
- [Completely fix too many open files issue by using queue](https://github.com/rubyide/vscode-ruby/pull/178)

### 0.12.1 - April 25 2017

Fix rubocop linter regression :)

### 0.12.0 - April 17 2017

It has been quite a while since our latest release but we are back with Conditional Breakpoint, Multiple Ruby processes debugging and more!

This version was entirely done by the community, many thanks to [ukblewis](https://github.com/ukblewis), [gshaw](https://github.com/gshaw), [seraku24](https://github.com/seraku24), [danielgracia](https://github.com/danielgracia), [ypresto](https://github.com/ypresto), [jtokoph](https://github.com/jtokoph), [Darep](https://github.com/Darep).

Notable changes:

- [Conditional breakpoint support](https://github.com/rubyide/vscode-ruby/commit/6c7311dbccb562f8a90a433417ce63856852310b) by [seraku24](https://github.com/seraku24). Please upgrade `debase` to `0.2.2.beta10` manually.
- [Debug multiple Ruby processes at once](https://github.com/rubyide/vscode-ruby/pull/127) by [ukblewis](https://github.com/ukblewis)
- [Fix squiggly heredoc syntax](https://github.com/rubyide/vscode-ruby/commit/6d4dcc2528308d6640908c0ed5f6d32f3af44e7b) by [gshaw](https://github.com/gshaw)
- [Add config to set Unicode handling on `ruby -wc` linting](https://github.com/rubyide/vscode-ruby/commit/9c6ab8ec7064400892078faa1ea147dac64039cc) by [danielgracia](https://github.com/danielgracia)
- [Add document and workspace symbol provider](https://github.com/rubyide/vscode-ruby/pull/107) by [ypresto](https://github.com/ypresto)
- [Add common ERB snippets](https://github.com/rubyide/vscode-ruby/commit/e9c8dc54f022a5848995d868494e96095e6a3638) by [jtokoph](https://github.com/jtokoph)
- [Recognize .jbuilder file extension as Ruby](https://github.com/rubyide/vscode-ruby/commit/b5cfd97758700a5718db276e4707c1f4bf0a2a9d) [Darep](https://github.com/Darep)

### 0.10.3 - 20 Nov 2016

- Improve formattings support
- Remove un-used setting
- Add (this) change log

### Start of change log

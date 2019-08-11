# Debugger

## Install Ruby Dependencies

In this extension, we implement [ruby debug ide protocol](https://github.com/ruby-debug/ruby-debug-ide/blob/master/doc/protocol-spec.texi) to allow VS Code to communicate with ruby debug, it requires `ruby-debug-ide` to be installed on your machine. This is also how RubyMine/NetBeans does by default.

- If you are using JRuby or Ruby v1.8.x (`jruby`, `ruby_18`, `mingw_18`), run `gem install ruby-debug-ide`.
- If you are using Ruby v1.9.x (`ruby_19`, `mingw_19`), run `gem install ruby-debug-ide`. Make sure `ruby-debug-base19x` is installed together with `ruby-debug-ide`.
- If you are using Ruby v2.x
  - `gem install ruby-debug-ide`
  - `gem install debase` (or `gem install byebug`)

## Add VS Code config to your project

Go to the debugger view of VS Code and hit the gear icon. Choose Ruby or Ruby Debugger from the prompt window, then you'll get the sample launch config in `.vscode/launch.json`. The sample launch configurations include debuggers for RSpec (complete, and active spec file) and Cucumber runs. These examples expect that `bundle install --binstubs` has been called.

## Detailed instruction for debugging Ruby Scripts/Rails/etc

Read following instructions about how to debug ruby/rails/etc locally or remotely

- [Debugger installation](https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation)
- [Launching from VS Code](https://github.com/rubyide/vscode-ruby/wiki/2.-Launching-from-VS-Code)
- [Attaching to a debugger](https://github.com/rubyide/vscode-ruby/wiki/3.-Attaching-to-a-debugger)
- [Running gem scripts](https://github.com/rubyide/vscode-ruby/wiki/4.-Running-gem-scripts)
- [Example configurations](https://github.com/rubyide/vscode-ruby/wiki/5.-Example-configurations)

## Debugger F.A.Q.

### Conditional breakpoint doesn't work

You need use Ruby `2.0` or above and you need to update `debase` to latest beta version `gem install debase -v 0.2.2.beta10`.

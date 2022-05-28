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

Q: What's the difference between 'skipFiles' and 'finishFiles'?  
A: The debugger will automatically step through skipFiles, whereas it will automatically step out of finishFiles.

Q: What are skipFiles and finishFiles useful for?  
A: They are two different tools for avoiding parts of the code while stepping. skipFiles helps you skip stack frames that sit between frames that you are interested in (e.g. [https://sorbet.org/](sorbet)). finishFiles, on the other hand, help you avoid stack frames (and everything deeper than them) entirely.

Q: Can I see an example?  
A: In the listing below, assume the debugger is suspended at line 2. Here's what happens if you 'Step Into' (F11) when...

* `b.rb` is in neither: the debugger suspends at line 5.
* `b.rb` is in `skipFiles`: the program prints "1" then the debugger suspends at line 9.
* `b.rb` is in `finishFiles`: the program prints "12" then the debugger suspends at line 3. 

```
1:   def methodA
2: =>  methodB
3:     puts "3"
# Assume methodB is in b.rb
4:   def methodB:
5:     puts "1"
6:     methodC
# Assume methodC is in c.rb
8:   def methodC:
9:     puts "2"
```

### Conditional breakpoint doesn't work

You need use Ruby `2.0` or above and you need to update `debase` to latest beta version `gem install debase -v 0.2.2.beta10`.

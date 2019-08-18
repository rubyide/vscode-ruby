# Formatting

The language server currently supports formatting via the following formatters:

- [RuboCop](https://github.com/rubocop-hq/rubocop)
- [Standard](https://github.com/testdouble/standard)
- [Rufo](https://github.com/ruby-formatter/rufo)
- [RubyFMT](https://github.com/samphippen/rubyfmt)

## Configuration

Configuration for formatting is provided by the `ruby.format` key

The global `useBundler` setting is used to determine if the format command should be prefixed with `bundle exec`

## Prettier for Ruby

This extension will not support formatting via the Ruby plugin for [prettier](https://prettier.io/). If you'd like to use this formatter, set `ruby.format` to `false` and install `vscode-prettier` according to [their directions](https://prettier.io/docs/en/editors.html#visual-studio-code).

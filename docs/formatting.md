# Formatting

The language server currently supports formatting via the following formatters:

- [RuboCop](https://github.com/rubocop-hq/rubocop)
- [Standard](https://github.com/testdouble/standard)
- [Rufo](https://github.com/ruby-formatter/rufo)
- [Rubyfmt](https://github.com/penelopezone/rubyfmt)
- [Prettier](https://github.com/prettier/plugin-ruby)

## Configuration

Configuration for formatting is provided by the `ruby.format` key

The global `useBundler` setting is used to determine if the format command should be prefixed with `bundle exec`

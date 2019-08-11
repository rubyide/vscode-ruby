# Linting

The language server currently supports linting via the following linters:

<!---
markdown-toc --no-firsth1 --maxdepth 1 readme.md
-->

- [RuboCop](#rubocop)
- [Standard](#standard)
- [Reek](#reek)

Additional linter support can be provided but they must conform to the following rules:

- Input must be provided via `stdin`
- Output must be provided via a machine parsable format (ideally json)

Linter support for linters that run over a whole project (eg `brakeman`) is being investigated (see [#512](https://github.com/rubyide/vscode-ruby/issues/512))

## Configuration

Configuration for linting is provided under the `ruby.lint` key.

The global `useBundler` flag does not apply to linters. This is an outstanding issue and will be corrected later. Each linter allows the option of overriding `useBundler`.

## RuboCop

[RuboCop](https://github.com/rubocop-hq/rubocop) is a Ruby static code analyzer and formatter, based on the community Ruby style guide

### Configuration Options

See the [RuboCop CLI args](https://docs.rubocop.org/en/latest/basic_usage/#other-useful-command-line-flags) for more details on the support configuration options

```json
"ruby.lint": {
  "rubocop": true
}
```

or

```json
"ruby.lint": {
  "rubocop": {
    "command": "rubocop",  // setting this will override automatic detection
    "useBundler": true,
    "lint": true, // enable lint cops
    "only": ["array", "of", "cops", "to", "run"],
    "except": ["array", "of", "cops", "not", "to", "run"],
    "require": ["array", "of", "ruby", "files", "to", "require"],
    "rails": true // requires rubocop-rails gem for RuboCop >= 0.72.0
  }
}
```

## Standard

[Standard](https://github.com/testdouble/standard) is the Ruby Style Guide with linter and automatic code fixer

### Configuration Options

See the [standard docs](https://github.com/testdouble/standard#what-you-might-do-if-youre-really-clever) for more details on these configuration options

```json
"ruby.lint": {
  "standard": true
}
```

or

```json
{
  "standard": {
    "command": "standard",  // setting this will override automatic detection
    "useBundler": true,
    "only": ["array", "of", "cops", "to", "run"],
    "except": ["array", "of", "cops", "not", "to", "run"],
    "require": ["array", "of", "ruby", "files", "to, "require"]
  }
}
```

## Reek

[Reek](https://github.com/troessner/reek) is a code smell detector for Ruby

### Configuration Options

```json
"ruby.lint": {
  "reek": true
}
```

or

```json
"ruby.lint": {
  "reek": {
    "command": "reek",  // setting this will override automatic detection
    "useBundler": true
  }
}
```

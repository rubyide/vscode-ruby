Feel free to open issues or PRs! We welcome all contributions, even from beginners. If you want to get started with a PR, please do the following:

## Prereqs

1. Check out the [VS Code Extension Docs](https://code.visualstudio.com/docs/extensions/overview), especially [Running and Debugging Extensions](https://code.visualstudio.com/docs/extensions/debugging-extensions).
1. Read the [development docs](https://github.com/rubyide/vscode-ruby/blob/master/docs/developing.md)

## Contributing

1. Fork this repo.
1. Create a feature branch for your work (eg `git checkout -b <my_branch_name>`)
1. Install dependencies with `yarn install`
1. Run `yarn watch`. This symlinks the `dist` directories from the server, extension, and debugger packages and starts webpack in each directory
1. Open the repo directory in VS Code.
1. Make a code change and test it. The debug tab and the various launch tasks will help!
1. Ensure your changes have test coverage
1. Submit a PR!

## Other Stuff

- Please do not update the version or the `CHANGELOG`
- Please make sure your addition does not regress functionality for other users

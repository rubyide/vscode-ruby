#!/bin/bash

mkdir -p dist
rm -rf dist/*
ln -sf $(pwd)/packages/language-server-ruby/dist dist/server
ln -sf $(pwd)/packages/vscode-ruby-debugger/dist dist/debugger
ln -sf $(pwd)/packages/vscode-ruby/dist dist/extension

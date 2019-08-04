#!/bin/bash

mkdir -p dist
rm -rf dist/*
cp -R packages/language-server-ruby/dist dist/server
cp -R packages/vscode-ruby-debugger/dist dist/debugger
cp -R packages/vscode-ruby/dist dist/extension

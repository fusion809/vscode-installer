#!/bin/bash
. ./lib/build/vscode.sh
. ./lib/build/node.sh

function mageia_build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++ libx11-devel python fakeroot createrepo
  node_build

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  vscode_build
}

export -f mageia_build

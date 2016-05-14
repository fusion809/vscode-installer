#!/bin/bash
. ./lib/build/vscode.sh
. ./lib/build/node.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++ libx11-devel
  node-build
  sudo npm install -g gulp
  vscode-build
}

export -f mageia-build

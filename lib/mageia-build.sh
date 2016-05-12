#!/bin/bash
. ./lib/vscode-build.sh
. ./lib/node-build.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++ libx11-devel
  node-build
  sudo npm install -g gulp
  vscode-build
}

export -f mageia-build

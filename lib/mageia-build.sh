#!/bin/bash
. ./lib/vscode-build.sh
. ./lib/node-build.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  node-build
  vscode-build
}

export -f mageia-build

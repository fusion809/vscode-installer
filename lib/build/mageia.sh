#!/bin/bash
. ./lib/build/vscode.sh
. ./lib/build/node.sh

function mageia_build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++ libx11-devel python fakeroot createrepo rpmdevtools
  node_build
  
  vscode_build
}

export -f mageia_build

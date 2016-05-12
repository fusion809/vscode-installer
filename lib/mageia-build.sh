#!/bin/bash
. ./lib/atom-build.sh
. ./lib/node-build.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  node-build
  atom-build
}

export -f mageia-build

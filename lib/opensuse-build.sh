#!/bin/bash
. ./lib/vscode-build.sh

function opensuse-build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel
  vscode-build
}

export -f opensuse-build

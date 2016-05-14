#!/bin/bash
. ./lib/build/vscode.sh

function opensuse-build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel libX11-devel

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  vscode-build
}

export -f opensuse-build

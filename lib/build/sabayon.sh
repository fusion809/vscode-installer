#!/bin/bash
. ./lib/build/vscode.sh

function sabayon_build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc sys-libs/glibc \
    dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  vscode_build
}

export -f sabayon_build

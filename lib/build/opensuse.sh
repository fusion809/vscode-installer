#!/bin/bash
. ./lib/build/vscode.sh

function opensuse_build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel libX11-devel python createrepo rpm-build

  PRETD=$(cat /etc/os-release | grep -w "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
  if [[ $PRETD == "openSUSE Leap"* ]]; then
    sudo zypper addrepo http://download.opensuse.org/repositories/devel:tools/openSUSE_Leap_42.1/devel:tools.repo
  elif [[ $PRETD == "openSUSE Tumbleweed"* ]]; then
    sudo zypper addrepo http://download.opensuse.org/repositories/devel:tools/openSUSE_Tumbleweed/devel:tools.repo
  fi

  sudo zypper refresh
  sudo zypper in -y fakeroot

  sudo npm install -g gulp node-gyp

  if ! [[ -f /usr/bin/gyp ]]; then
    sudo ln -sf /usr/lib/node_modules/node-gyp/node-gyp /usr/bin/gyp
  fi

  vscode_build
}

export -f opensuse_build

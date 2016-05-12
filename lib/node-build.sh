#!/bin/bash
function node-build {

  # Architecture
  export ARCH=$(uname -m)

  # Determine the latest release of Node.js using the Arch Linux PKGBUILD (usually updated within two days of an upstream update)
  wget -cqO- "https://projects.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/nodejs" > /tmp/PKGBUILD
  ver=$(sed -n 's/pkgver=//p' /tmp/PKGBUILD)

  if [[ $ARCH == "x86_64" ]]; then
    curl -sL http://nodejs.org/dist/v$ver/node-v$ver-linux-x64.tar.xz | tar xJ -C /tmp
    sudo cp -a /tmp/node-v$ver-linux-x64/{bin,lib,share,include} /usr
  else
    curl -sL http://nodejs.org/dist/v$ver/node-v$ver-linux-x86.tar.xz | tar xJ -C /tmp
    sudo cp -a /tmp/node-v$ver-linux-x86/{bin,lib,share,include} /usr
  fi
  sudo npm install -g node-gyp # Required for building Atom
}
export -f node-build

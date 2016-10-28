#!/bin/bash
function version {
  curl -sL "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=visual-studio-code-oss" > /tmp/PKGBUILD
  export pkgver="$(cat /tmp/PKGBUILD | grep "pkgver=" | sed -e 's/pkgver=//g')"
}

export -f version

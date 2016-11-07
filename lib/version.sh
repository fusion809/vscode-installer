#!/bin/bash
function version {
  export pkgver=$(wget -q https://github.com/Microsoft/vscode/releases/ -O - | grep "tar.gz" | grep href |  head -n 1 | cut -d '"' -f 2 | sed 's|/Microsoft/vscode/archive/||g' | sed 's|.tar.gz||g')
}

export -f version

#!/bin/bash
function arch {
  ARCH=$(uname -m)

  if [[ $ARCH == 'x86_64' ]]; then
    _vscode_arch=x64
  else
    _vscode_arch=x86
  fi
  
  export _vscode_arch
}

export -f arch

#!/bin/bash
function src_build {
  # Install NPM dependencies
  /bin/bash -c "scripts/npm.sh install"

  # Build vscode
  node --max_old_space_size=2000 /usr/bin/gulp ${lowedit}-linux-${_vscode_arch} || printf "An error has occurred while building this package with gulp. Please report the exact error message you received\n at https://github.com/fusion809/${lowedit}-installer/issues/new"
}

export -f src_build

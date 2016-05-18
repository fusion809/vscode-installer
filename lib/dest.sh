#!/bin/bash
function dest {
  printf "Where do you want to store the source code? [Leave empty for $GHUB]\n"
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install Visual Studio Code locally or system-wide?\n[Available options: local/system. If you leave this field empty 'local' will be selected]\n"
  read DEST_TYPE

  export SRC_DEST
  export DEST_TYPE
}

export -f dest

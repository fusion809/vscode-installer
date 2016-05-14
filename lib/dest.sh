#!/bin/bash
function dest {
  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install VScode locally or system-wide? [local/system] "
  read DEST_TYPE

  export SRC_DEST
  export DEST_TYPE
}

export -f dest

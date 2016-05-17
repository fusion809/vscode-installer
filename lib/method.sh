#!/bin/bash
function method {
  printf "Would you rather install Visual Studio Code from: A) a binary package (faster) or B) from source (slower, but open-source)? [A/B] "
  read method

  if ! [[ -n $method ]]; then
    method="B"
  fi

  export method
}

export -f method

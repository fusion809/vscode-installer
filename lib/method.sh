#!/bin/bash
function method {
  printf "Would you rather install Visual Studio Code from: A) a binary package (faster and safer) or B) from source (slower, but open-source)? \n[Available options: A/B. If you enter input other than A/B then a source install will be performed] "
  read method

  if ! [[ -n $method ]]; then
    method="B"
  fi

  export method
}

export -f method

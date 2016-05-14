#!/bin/bash
function method {
  printf "Would you rather install Visual Studio Code from: A) a Debian binary (faster) or B) from source (slower, but open-source)? [A/B] "
  read preference
}

export -f method

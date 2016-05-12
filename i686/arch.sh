#!/bin/bash

if comex visual-studio-code || comex visual-studio-code-oss; then                       # Check if VScode is already installed

  printf "Visual Studio Code is already installed!"

else

  printf "Would you rather install Visual Studio Code from: A) a Debian binary (faster) or B) from source (slower, but more reliable)? [A/B] "
  read preference

  if [[ $preference == "A" ]]; then
    vsaur
  elif [[ $preference == "B" ]]; then
    vsaur oss
  fi

fi

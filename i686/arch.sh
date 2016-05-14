#!/bin/bash

if comex visual-studio-code || comex visual-studio-code-oss; then                       # Check if VScode is already installed

  printf "Visual Studio Code is already installed!"

else

  method

  if [[ $method == "A" ]]; then
    vsaur
  elif [[ $method == "B" ]]; then
    vsaur oss
  fi

fi

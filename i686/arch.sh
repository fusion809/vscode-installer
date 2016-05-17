#!/bin/bash

if comex visual-studio-code || comex visual-studio-code-oss; then                       # Check if VScode is already installed

  if [[ -d /opt/VSCode-OSS/ ]]; then
    vsiver=$(/opt/VSCode-OSS/bin/code-oss --version)
    version
    if [[ $vsiver == $pkgver ]]; then
      printf "The latest version of Visual Studio Code is already installed!"
    else
      method
    fi
  fi

  if [[ -d /opt/VSCode-linux-ia32 ]]; then
    vsiver=$(/opt/VSCode-linux-ia32/bin/code-oss --version)
    version
    if [[ $vsiver == $pkgver ]]; then
      printf "The latest version of Visual Studio Code is already installed!"
    else
      method
    fi
  fi

  if [[ -d /opt/visual-studio-code ]]; then
    vsiver=$(/opt/visual-studio-code/bin/code --version)
    version
    if [[ $vsiver == $pkgver ]]; then
      printf "The latest version of Visual Studio Code is already installed!"
    else
      method
    fi
  fi

  if [[ -d /usr/share/code/bin ]]; then
    vsiver=$(/usr/share/code/bin/code --version)
    version
    if [[ $vsiver == $pkgver ]]; then
      printf "The latest version of Visual Studio Code is already installed!"
    else
      method
    fi
  fi

else

  method

fi

if [[ $method == "A" ]]; then
  vsaur
elif [[ $method == "B" ]]; then
  vsaur oss
fi

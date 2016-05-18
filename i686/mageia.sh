#!/bin/bash
if [[ -d /opt/VSCode-OSS/ ]]; then
  vsiver=$(/opt/VSCode-OSS/bin/code-oss --version)
  version
  if [[ $vsiver == $pkgver ]]; then
    printf "The latest version of Visual Studio Code is already installed!"
  else
    method
  fi
fi

if [[ -d /opt/VSCode-linux-x86 ]]; then
  vsiver=$(/opt/VSCode-linux-x86/bin/code-oss --version)
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

if ! [[ -d /usr/share/code/bin ]] && ! [[ -d /opt/VSCode-linux-x86 ]] && ! [[ -d /opt/VSCode-OSS ]]; then
  method
fi

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760681" > ${lowedit}-i386.rpm
  sudo urpmi ${lowedit}-i386.rpm

elif [[ $method == "B" ]]; then

  mageia_build

fi

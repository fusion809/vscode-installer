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

if [[ -d /opt/VSCode-linux-x64 ]]; then
  vsiver=$(/opt/VSCode-linux-x64/bin/code-oss --version)
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

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760667" > vscode-x86_64.rpm
  sudo zypper in -y vscode-x86_64.rpm

elif [[ $method == "B" ]]; then

  opensuse_build

fi

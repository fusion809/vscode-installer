#!/bin/bash

source "./lib/build/sabayon.sh"

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

if ! [[ -d /usr/share/code/bin ]] && ! [[ -d /opt/VSCode-linux-x64 ]] && ! [[ -d /opt/VSCode-OSS ]]; then
  method
fi

if [[ $method == "A" ]]; then

  sudo equo i media-libs/fontconfig x11-libs/libXtst x11-libs/gtk+:2 dev-lang/python:2.7 x11-libs/cairo \
    media-libs/alsa-lib gnome-base/gconf dev-libs/nss sys-devel/gcc

  # Get binary and extract
  _pkg=VSCode-linux-x64
  curl -sL "https://go.microsoft.com/fwlink/?LinkID=620884" > /tmp/$_pkg-stable.zip
  cd /tmp
  bsdtar -xf $_pkg-stable.zip
  rm $_pkg-stable.zip

  sudo install -d "/usr/share/licenses/visual-studio-code"
  sudo install -d "/opt/VSCode"

  sed -e "s|<%-INST-%>|/opt/VSCode|g" $INDIR/resources/visual-studio-code.desktop > $INDIR/resources/visual-studio-code2.desktop

  sudo install -m644 "/tmp/${_pkg}/resources/app/LICENSE.txt" "/usr/share/licenses/visual-studio-code/LICENSE"
  sudo install -m644 "$INDIR/resources/visual-studio-code2.desktop" "/usr/share/applications/code.desktop"

  sudo cp -r "/tmp/${_pkg}/"* "/opt/VSCode" -R
  sudo ln -s /opt/VSCode/code /usr/bin/code

elif [[ $method == "B" ]]; then

  sabayon_build

fi

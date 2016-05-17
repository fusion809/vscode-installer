#!/bin/bash

method

if [[ $method == "A" ]]; then

  sudo equo i media-libs/fontconfig x11-libs/libXtst x11-libs/gtk+:2 dev-lang/python:2.7 x11-libs/cairo \
    media-libs/alsa-lib gnome-base/gconf dev-libs/nss sys-devel/gcc

  # Get binary and extract
  _pkg=VSCode-linux-x64
  curl -sL "https://go.microsoft.com/fwlink/?LinkID=620884" > /tmp/$_pkg-stable.zip
  cd /tmp
  bsdtar -xf $_pkg-stable.zip

  sudo install -d "/usr/share/licenses/visual-studio-code"
  sudo install -d "/opt/VSCode"

  sed -e "s|<%-INST-%>|/opt/VSCode|g" $INDIR/resources/visual-studio-code.desktop > $INDIR/resources/visual-studio-code2.desktop

  sudo install -m644 "/tmp/${_pkg}/resources/app/LICENSE.txt" "/usr/share/licenses/visual-studio-code/LICENSE"
  sudo install -m644 "$INDIR/resources/visual-studio-code2.desktop" "/usr/share/applications/visual-studio-code.desktop"

  sudo cp -r "/tmp/${_pkg}/"* "/opt/VSCode" -R
  sudo ln -s /opt/VSCode/code /usr/bin/visual-studio-code

elif [[ $method == "B" ]]; then

  sabayon-build

fi

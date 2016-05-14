#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760680" > vscode-i386.deb
  sudo dpkg -i vscode-i386.deb
  sudo apt-get -f install

elif [[ $method == "B" ]]; then

  ubuntu-build

fi

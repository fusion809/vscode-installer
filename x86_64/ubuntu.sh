#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode-amd64.deb
  sudo dpkg -i vscode-amd64.deb
  sudo apt-get -f install

elif [[ $method == "B" ]]; then

  ubuntu-build

fi

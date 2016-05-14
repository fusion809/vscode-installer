#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760667" > vscode-x86_64.rpm
  sudo dnf install -y vscode-x86_64.rpm

elif [[ $method == "B" ]]; then

  fedora-build

fi

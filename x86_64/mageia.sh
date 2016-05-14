#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760667" > vscode-x86_64.rpm
  sudo urpmi vscode-x86_64.rpm

elif [[ $method == "B" ]]; then

  mageia-build

fi

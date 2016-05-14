#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760681" > vscode-i386.rpm
  sudo yum install -y vscode-i386.rpm

elif [[ $method == "B" ]]; then

  centos-build

fi

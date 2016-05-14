#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760867" > vscode-x86_64.rpm
  sudo yum install -y vscode-x86_64.rpm

elif [[ $method == "B" ]]; then

  centos-build

fi

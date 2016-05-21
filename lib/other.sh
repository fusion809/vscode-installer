#!/bin/bash
source "./lib/build/node.sh"
source "./lib/build/vscode.sh"
source "./lib/test.sh"

printf "Greetings, you seem to be using an operating system that is not officially supported by this installer. Despite this, provided you are using some distribution of Linux this installer can still be used to compile Visual Studio Code from source, provided you have the following packages installed:
* Node.js
* NPM, with the gulp and node-gyp packages also installed.
* GCC (with C and C++ 11 support)
* make
* X11 development headers (usually provided by a package entitled libX11-devel or libx11-dev)
This script will test for each of these dependencies and tell you which one you need to install. If a package is installed yet still this script returns a output indicating it is not, you will need to add the package's executable to your PATH.\n"

if ! `comex node`; then
  printf "Node.js is not in the system PATH; probably meaning it is not installed. Do you want to use this script to install Node.js from a Linux binary tarball? [y/n]\n"
  read nodeyn
  if [[ $nodeyn == "y" ]]; then
    node_build
  fi
fi

if ! `comex npm`; then
  printf "NPM is not in the system PATH. This likely indicates that it is not installed. Do you want to install NPM and Node.js from a Linux binary tarball? [y/n]\n"
  read npmyn
  if [[ $npmyn == "y" ]]; then
    node_build
  fi
fi

if ! `comex gcc`; then
  printf "GCC was not detected. Please install it, or if it is installed add its executable to your system PATH.\n"
fi

if ! `comex g++`; then
  printf "C++ support in GCC was not detected. Please install it, or if it is installed, add its executable to your system PATH.\n"
fi

if ! [[ -f /usr/lib/libX11.so ]]; then
  printf "X11 development headers were not detected. Please install them.\n"
fi

if ! `comex make`; then
  printf "GNU Make was not detected please install it, or add it to your PATH.\n"
fi

printf "Have you installed all the dependencies? [y/n]\n If you answer y, vscode_build will be run!\n"
read depsyn

if [[ $depsyn == "y" ]]; then
  vscode_build
fi

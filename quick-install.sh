#!/bin/bash

# This is a quick install script to install VSCode ASAP
export REPO=https://github.com/fusion809/vscode-installer
export UPSRC=https://github.com/Microsoft/vscode
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the vscode-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/vscode-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the vscode-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/vscode-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of vscode-installer. ==>\n"
    ## git
    if [[ -d $GHUBM/vscode-installer/.git ]]; then
      cd $GHUBM/vscode-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/vscode-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/vscode-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUBM
    fi

  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/vscode-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the vscode-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/vscode-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of vscode-installer. ==>\n"

    ## git
    if [[ -d $GHUB/vscode-installer/.git ]]; then
      cd $GHUB/vscode-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/vscode-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/vscode-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/vscode-installer-master/vscode-installer/ -C $GHUB
    fi
  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/vscode-installer ]]; then
  cd $GHUB/vscode-installer
  ./installer.sh
elif [[ -d $GHUBM/vscode-installer ]]; then
  cd $GHUBM/vscode-installer
  ./installer.sh
fi

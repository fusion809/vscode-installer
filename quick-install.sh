#!/bin/bash

# This is a quick install script to install VSCode ASAP
export REPO=https://github.com/fusion809/VScode_installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the VScode_installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/VScode_installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the VScode_installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/VScode_installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of VScode_installer. ==>\n"
    ## git
    if [[ -d $GHUBM/VScode_installer/.git ]]; then
      cd $GHUBM/VScode_installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/VScode_installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/VScode_installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUBM
    fi

  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/VScode_installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the VScode_installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/VScode_installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of VScode_installer. ==>\n"

    ## git
    if [[ -d $GHUB/VScode_installer/.git ]]; then
      cd $GHUB/VScode_installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/VScode_installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/VScode_installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode_installer-master/VScode_installer/ -C $GHUB
    fi
  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/VScode_installer ]]; then
  cd $GHUB/VScode_installer
  ./installer.sh
elif [[ -d $GHUBM/VScode_installer ]]; then
  cd $GHUBM/VScode_installer
  ./installer.sh
fi

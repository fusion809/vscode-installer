#!/bin/bash

# This is a quick install script to install VSCode ASAP
export lowedit=vscode
export REPO=https://github.com/fusion809/${lowedit}-installer
export UPSRC=https://github.com/Microsoft/${lowedit}
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the ${lowedit}-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/${lowedit}-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the ${lowedit}-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/${lowedit}-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of ${lowedit}-installer. ==>\n"
    ## git
    if [[ -d $GHUBM/${lowedit}-installer/.git ]]; then
      cd $GHUBM/${lowedit}-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/${lowedit}-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/${lowedit}-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUBM
    fi

  fi

  cd $GHUBM/${lowedit}-installer
  ./installer.sh

else
  cd $GHUB

  if ! [[ -d $GHUB/${lowedit}-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the ${lowedit}-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/${lowedit}-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of ${lowedit}-installer. ==>\n"

    ## git
    if [[ -d $GHUB/${lowedit}-installer/.git ]]; then
      cd $GHUB/${lowedit}-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/${lowedit}-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/${lowedit}-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/${lowedit}-installer-master/${lowedit}-installer/ -C $GHUB
    fi
  fi

  cd $GHUB/${lowedit}-installer
  ./installer.sh

fi

#!/bin/bash

# This is a quick install script to install VScode ASAP
export REPO=https://github.com/fusion809/VScode-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the VScode-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/VScode-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the VScode-installer repository locally ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/VScode-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUBM
    fi
  else
    printf "The VScode-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      
      ## git
      if [[ -d $GHUBM/VScode-installer/.git ]]; then
        cd $GHUBM/VScode-installer
        git pull origin master
        cd .

      ## cURL
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUBM/VScode-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUBM

      ## wget
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUBM/VScode-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUBM
      fi
    else
      printf "Suit yourself!"
    fi

  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/VScode-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the VScode-installer repository locally ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/VScode-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUB
    fi
  else
    printf "The VScode-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then

      ## git
      if [[ -d $GHUB/VScode-installer/.git ]]; then
        cd $GHUB/VScode-installer
        git pull origin master
        cd .

      ## cURL
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUB/VScode-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUB

      ## wget
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUB/VScode-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/VScode-installer-master/VScode-installer/ -C $GHUB
      fi
    else
      printf "Suit yourself!"
    fi

  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/VScode-installer ]]; then
  cd $GHUB/VScode-installer
  ./installer.sh
elif [[ -d $GHUBM/VScode-installer ]]; then
  cd $GHUBM/VScode-installer
  ./installer.sh
fi

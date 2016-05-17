#!/bin/bash

. ./lib/test.sh

function vsin {
  if [[ -n "$1" ]]; then
    cd /tmp/PKGBUILDs/vscode/visual-studio-code-$1
  else
    cd /tmp/visual-studio-code
  fi
  makepkg -si --noconfirm
  cd .
}

export -f vsin

# Install visual-studio-code
function vsaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/
  export PKG=https://github.com/fusion809/PKGBUILDs

  if [[ -n "$1" ]]; then                     # if input provided; allowed input bin, git

    if comex git; then                      # Install with git and makepkg otherwise

      git clone $PKG /tmp/PKGBUILDs
      vsin $1

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $PKG/archive/master.tar.gz | tar xz --transform=s/PKGBUILDs-master/PKGBUILDs/ -C /tmp
      vsin $1

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $PKG/archive/master.tar.gz | tar xz --transform=s/PKGBUILDs-master/PKGBUILDs/ -C /tmp
      vsin $1

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $PKG/archive/master.tar.gz | tar xz --transform=s/PKGBUILDs-master/PKGBUILDs/ -C /tmp
      vsin $1

    fi
  else
    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S visual-studio-code --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/visual-studio-code.git /tmp/visual-studio-code
      vsin

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/visual-studio-code.tar.gz | tar xz -C /tmp
      vsin

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/visual-studio-code.tar.gz | tar xz -C /tmp
      vsin

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/visual-studio-code.tar.gz | tar xz -C /tmp
      vsin

    fi
  fi
}

export -f vsaur

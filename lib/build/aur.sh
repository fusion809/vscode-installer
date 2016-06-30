#!/bin/bash

function vsin {
  if [[ -n "$1" ]]; then
    cd /tmp/code-$1
  else
    cd /tmp/code
  fi
  makepkg -si --noconfirm
  cd ..
}

export -f vsin
# Install visual-studio-code
function vsaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/
  export PKG=https://github.com/fusion809/code-oss

  if [[ -n "$1" ]]; then                     # if input provided; allowed input bin, git

    if comex git; then                      # Install with git and makepkg otherwise

      git clone $PKG /tmp/code-oss
      vsin $1

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $PKG/archive/master.tar.gz | tar xz --transform=s/code-oss-master/code-oss/ -C /tmp
      vsin $1

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $PKG/archive/master.tar.gz | tar xz --transform=s/code-oss-master/code-oss/ -C /tmp
      vsin $1

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $PKG/archive/master.tar.gz | tar xz --transform=s/code-oss-master/code-oss/ -C /tmp
      vsin $1

    fi
  else
    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S visual-studio-code --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/visual-studio-code.git /tmp/code
      vsin

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/visual-studio-code.tar.gz | tar xz -C /tmp --transform="s/visual-studio-code/code/"
      vsin

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/visual-studio-code.tar.gz | tar xz -C /tmp --transform="s/visual-studio-code/code/"
      vsin

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/visual-studio-code.tar.gz | tar xz -C /tmp --transform="s/visual-studio-code/code/"
      vsin

    fi
  fi
}

export -f vsaur

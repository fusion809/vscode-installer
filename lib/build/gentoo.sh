. ./lib/build/vscode.sh

function gentoo_build {
  # Get dependencies

  printf "Do you have all the dependencies installed? [y/n]\n"
  read depyn

  if [[ $depyn == 'n' ]]; then
    sudo sed -i -e 's/USE="/USE="-bindist/g' /etc/portage/make.conf
    if ! [[ -d /usr/portage ]]; then
      sudo mkdir /usr/portage
    fi
    sudo emerge-webrsync
    sudo emerge --autounmask-write net-libs/nodejs sys-devel/gcc sys-libs/glibc \
      dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11 dev-lang/python:2.7
    sudo etc-update --automode -5
    sudo emerge net-libs/nodejs sys-devel/gcc sys-libs/glibc \
      dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11 dev-lang/python:2.7

    if ! $([[ -f /usr/bin/node ]] && [[ -f /usr/bin/gcc ]] && [[ -f /usr/bin/python ]]); then

      printf "Emerging the dependencies of Visual Studio Code failed! One common issue, if you did not make it, before an error arose, is a circular dependency issue with app-crypt/gcr, app-crypt/gnupg and app-crypt/pinentry. The solution involves adjusting USE flags.\n\n For now you are on your own. I recommend you open up a new shell session (like a new tab in your terminal emulator, or in a new TTY terminal) and work out your issues with installing these dependencies with Portage, then when you are done, press enter in this tab."
      read answer

      source "./lib/other.sh"

    else

      vscode_build

    fi
  elif [[ $depyn == "y" ]]; then
    vscode_build
  fi
}

export -f gentoo_build

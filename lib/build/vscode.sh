function vscode_build {
  export GHUB="$HOME/GitHub"
  export DESC="Visual Studio Code (VSCode), open-source version. VSCode is a free text editor developed by Microsoft, that is built on the Electron (formerly Atom Shell) framework, with support for a wide variety of different computer languages."
  version

  dest

  # Get the source code
  src_method

  # Get the architecture details and use them appropriately
  arch

  src_prepare

  ########### The build #############
  src_build

  if `comex dpkg`; then
    if [[ $_vscode_arch == "x64" ]]; then
      cd $SRC_DEST/${lowedit}-${pkgver}/.build/linux/deb/amd64/deb/
      sudo dpkg -i vscode-amd64.deb
    else
      cd $SRC_DEST/${lowedit}-${pkgver}/.build/linux/deb/i386/deb/
      sudo dpkg -i vscode-i386.deb
    fi
    sudo apt-get -f install
  elif `comex dnf`; then
    if [[ $_vscode_arch == "x64" ]]; then
      sudo dnf install -y $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/x86_64/vscode-x86_64.rpm
    else
      sudo dnf install -y $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/i386/vscode-i386.rpm
    fi
  elif `comex yum`; then
    if [[ $_vscode_arch == "x64" ]]; then
      cd $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/x86_64/rpm/
      sudo yum install -y vscode-x86_64.rpm
    else
      cd $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/i386/rpm/
      sudo yum install -y vscode-i386.rpm
    fi
  elif `comex zypper`; then
    if [[ $_vscode_arch == "x64" ]]; then
      sudo zypper in -y $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/x86_64/vscode-x86_64.rpm
    else
      sudo zypper in -y $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/i386/vscode-i386.rpm
    fi
  elif [[ -f /usr/bin/urpmi ]]; then
    if [[ $_vscode_arch == "x64" ]]; then
      sudo urpmi $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/x86_64/vscode-x86_64.rpm
    else
      sudo urpmi $SRC_DEST/${lowedit}-${pkgver}/.build/linux/rpm/i386/vscode-i386.rpm
    fi
  else
    vscode_install
  fi
}

export -f vscode_build

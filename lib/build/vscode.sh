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
    cd $SRC_DEST/${lowedit}-${pkgver}/.build/linux/deb/amd64/deb/
    sudo dpkg -i vscode-amd64.deb
    sudo apt-get -f install
  elif `comex yum`; then
    cd ..
    sudo yum install -y vscode*.rpm
  elif `comex dnf`; then
    cd ..
    sudo dnf install -y vscode*.rpm
  elif `comex zypper`; then
    cd ..
    sudo zypper in -y vscode*.rpm
  elif `comex urpmi`; then
    cd ..
    sudo urpmi vscode*.rpm
  else
    vscode_install
  fi
}

export -f vscode_build

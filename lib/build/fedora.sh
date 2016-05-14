. ./lib/build/vscode.sh

function fedora-build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs || sudo dnf install -y 'dnf-command(copr)' \
    && sudo dnf copr enable -y nibbler/nodejs
  sudo dnf update
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel tar nodejs npm libX11-devel

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi
  
  vscode-build
}

export -f fedora-build

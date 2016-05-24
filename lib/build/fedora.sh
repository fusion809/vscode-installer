. ./lib/build/vscode.sh
. ./lib/build/node.sh

function fedora_build {
  # Get dependencies
  sudo dnf update
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel tar libX11-devel python createrepo rpmdevtools
  sudo dnf remove -y nodejs

  node_build

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  if ! [[ -f /usr/bin/gyp ]]; then
    sudo ln -sf /usr/lib/node_modules/node-gyp/node-gyp /usr/bin/gyp
  fi

  vscode_build
}

export -f fedora_build

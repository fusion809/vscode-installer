. ./lib/build/vscode.sh

function pclinuxos_build {
  # Get dependencies
  sudo apt-get install -y gcc gcc-c++ make libstdc++6 lib64gtk2.0_0-devel git \
    libgnome-keyring-dev fakeroot lib64x11-devel python

  node_build

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  vscode_build
}

export -f pclinuxos_build

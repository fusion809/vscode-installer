. ./lib/build/vscode.sh

function pclinuxos_build {
  # Get dependencies
  sudo apt-get install -y gcc gcc-c++ make libstdc++6 lib64gtk2.0_0-devel git \
    libgnome-keyring-dev fakeroot lib64x11-devel python rpmdevtools

  node_build

  sudo npm install -g gulp node-gyp

  vscode_build
}

export -f pclinuxos_build

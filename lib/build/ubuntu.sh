. ./lib/build/vscode.sh

function ubuntu_build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libx11-dev

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  vscode_build
}

export -f ubuntu_build

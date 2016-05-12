. ./lib/vscode-build.sh

function ubuntu-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libx11-dev
  sudo npm install -g gulp
  vscode-build
}

export -f ubuntu-build

. ./lib/vscode-build.sh

function linux-mint-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot
  sudo npm install -g gulp
  vscode-build
}

export -f linux-mint-build

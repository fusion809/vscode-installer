. ./lib/build/vscode.sh

function debian-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libx11-dev
    
  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  vscode-build
}

export -f debian-build

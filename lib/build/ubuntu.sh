. ./lib/build/vscode.sh

function ubuntu_build {
  # Get dependencies
  sudo apt-get install -y curl build-essential git \
    libgnome-keyring-dev fakeroot libx11-dev python
  curl -L "https://projects.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/nodejs" > /tmp/PKGBUILD
  nodelver=$(sed -n 's/pkgver=//p' /tmp/PKGBUILD)
  nodever=$(node --version | sed 's/v//g')
  if ! [[ $nodever == $nodelver ]]; then
    if curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -; then
      sudo apt-get install -y nodejs
    else
      node_build
    fi
  fi

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  vscode_build
}

export -f ubuntu_build

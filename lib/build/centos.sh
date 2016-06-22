. ./lib/build/vscode.sh
. ./lib/build/node.sh

function centos_build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
  sudo yum install -y gcc gcc-c++ make glibc-devel git-core python \
    libgnome-keyring-devel libX11-devel createrepo rpmdevtools
  sudo yum install -y nodejs-devel || node_build

  sudo npm install -g gulp node-gyp

  if ! [[ -f /usr/bin/gyp ]]; then
    sudo ln -sf /usr/lib/node_modules/node-gyp/node-gyp /usr/bin/gyp
  fi

  vscode_build
}

export -f centos_build

. ./lib/build/vscode.sh
. ./lib/build/node.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
  sudo yum install -y gcc gcc-c++ make glibc-devel \
    git-core libgnome-keyring-devel libX11-devel
  sudo yum install -y nodejs-devel || node-build

  if ! `comex gulp`; then
    sudo npm install -g gulp
  fi
  
  vscode-build
}

export -f centos-build

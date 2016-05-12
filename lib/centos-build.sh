. ./lib/vscode-build.sh
. ./lib/node-build.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
  sudo yum install -y gcc gcc-c++ make glibc-devel \
    git-core libgnome-keyring-devel libX11-devel
  sudo yum install -y nodejs-devel || node-build
  sudo npm install -g gulp
  vscode-build
}

export -f centos-build

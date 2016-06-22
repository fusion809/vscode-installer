. ./lib/build/vscode.sh
. ./lib/build/node.sh

if [[ -n $ARCHC ]]; then
  export ARCHC=$(uname -m | sed 's/i[0-9]/i3/g')
fi

function centos_build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
  sudo yum install -y gcc gcc-c++ make glibc-devel git-core python \
    libgnome-keyring-devel libX11-devel createrepo rpmdevtools \
    ftp://195.220.108.108/linux/centos/6.8/os/$ARCHC/Packages/fakeroot-libs-1.12.2-22.2.el6.$ARCHC.rpm \
    ftp://195.220.108.108/linux/centos/6.8/os/$ARCHC/Packages/fakeroot-1.12.2-22.2.el6.$ARCHC.rpm
  sudo yum install -y nodejs-devel || node_build

  sudo npm install -g gulp node-gyp

  if ! [[ -f /usr/bin/gyp ]]; then
    sudo ln -sf /usr/lib/node_modules/node-gyp/node-gyp /usr/bin/gyp
  fi

  vscode_build
}

export -f centos_build

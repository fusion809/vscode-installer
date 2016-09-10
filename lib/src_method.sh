#!/bin/bash
function src_method {

  printf "How would you like to get the source code? \n[curl/git/wget/?; default: curl] \n"
  read SRC_METHOD

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up several fold more bandwidth but it also makes upgrading the package in the future easier and faster."

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/${lowedit}-$pkgver ]]; then
      rm -rf $SRC_DEST/${lowedit}-$pkgver
    fi

    wget -cqO- $UPSRC/archive/$pkgver.tar.gz | tar xz -C $SRC_DEST

    cd $SRC_DEST/${lowedit}-$pkgver

    curl -sL https://github.com/fusion809/vscode-installer/raw/master/resources/product.json > product.json

  elif [[ $SRC_METHOD == "git" ]]; then

    if ! [[ -d $SRC_DEST/vscode ]]; then
      git clone $UPSRC $SRC_DEST/vscode
    fi
    cd $SRC_DEST/vscode
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

    # Use a custom product.json; necessary for extensions
    curl -sL https://git.io/voqu3 > product.json

  else

    if [[ -d $SRC_DEST/${lowedit}-$pkgver ]]; then
      rm -rf $SRC_DEST/${lowedit}-$pkgver
    fi

    curl -sL $UPSRC/archive/$pkgver.tar.gz | tar xz -C $SRC_DEST

    cd $SRC_DEST/${lowedit}-$pkgver

    curl -sL https://github.com/fusion809/vscode-installer/raw/master/resources/product.json > product.json

  fi

}

export -f src_method

#!/bin/bash
function src_method {

  printf "How would you like to get the source code? \n[curl/git/wget/?; default: curl] "
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

    curl -sL https://git.io/vrYIY > product.json
    curl -sL https://git.io/vrubJ > extensions/ini/package.json
    curl -sL https://git.io/vrubs > extensions/shellscript/package.json

  elif [[ $SRC_METHOD == "git" ]]; then

    if ! [[ -d $SRC_DEST/vscode ]]; then
      git clone $UPSRC $SRC_DEST/vscode
    fi
    cd $SRC_DEST/vscode
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

    # Use a custom product.json; necessary for extensions
    curl -sL https://git.io/vrYIY > product.json
    curl -sL https://git.io/vrubJ > extensions/ini/package.json
    curl -sL https://git.io/vrubs > extensions/shellscript/package.json

  else

    if [[ -d $SRC_DEST/${lowedit}-$pkgver ]]; then
      rm -rf $SRC_DEST/${lowedit}-$pkgver
    fi

    curl -sL $UPSRC/archive/$pkgver.tar.gz | tar xz -C $SRC_DEST

    cd $SRC_DEST/${lowedit}-$pkgver

    curl -sL https://git.io/vrYIY > product.json
    curl -sL https://git.io/vrubJ > extensions/ini/package.json
    curl -sL https://git.io/vrubs > extensions/shellscript/package.json

  fi

}

export -f src_method

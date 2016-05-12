function vscode-build {
  export GHUB=$HOME/GitHub

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install VScode locally or system-wide? [local/system] "
  read DEST_TYPE

  ver=$(sed -n 's/ver=//p' ./lib/version.sh)

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "curl" ]]; then

    if [[ -d $SRC_DEST/vscode-$ver ]]; then
      rm -rf $SRC_DEST/vscode-$ver
    fi
    curl -sL https://github.com/Microsoft/vscode/archive/$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/vscode-$ver

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/vscode-$ver ]]; then
      rm -rf $SRC_DEST/vscode-$ver
    fi
    wget -cqO- https://github.com/Microsoft/vscode/archive/$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/vscode-$ver

  elif [[ $SRC_METHOD == "git" ]]; then
    if ! [[ -d $SRC_DEST/vscode ]]; then
      git clone https://github.com/Microsoft/vscode $SRC_DEST/vscode
    fi
    cd $SRC_DEST/vscode
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  else

    printf "You must select a SRC_METHOD!"

  fi

  ARCH=$(uname -m)
  if [[ $ARCH == 'x86_64' ]]; then
    _vscode_arch=x64
  else
    _vscode_arch=x86
  fi

  # The build
  scripts/npm.sh install || printf "An error has occurred while installing this package's NPM dependencies. Please start a new issue\n at https://github.com/fusion809/VScode-installer/issues/new"
  node --max_old_space_size=2000 /usr/bin/gulp vscode-linux-${_vscode_arch} || printf "An error has occurred while building this package with gulp. Please report the exact error message you received\n at https://github.com/fusion809/VScode-installer/issues/new"
  if [[ $DEST_TYPE == 'local' ]]; then
    printf "VScode is now installed to $GHUB/VSCode-linux-${_vscode_arch}"
  else
    cd ..
    sudo mv VSCode-linux-${_vscode_arch} /opt
    sudo ln -s "/opt/VSCode-linux-${_vscode_arch}/code-oss" "/usr/bin/visual-studio-code-oss"
    sudo install -D -m644 "$GHUB/VScode-installer*/visual-studio-code-oss.desktop" \
            "/usr/share/applications/visual-studio-code-oss.desktop" || sudo install -D -m644 "$GHUBM/VScode-installer*/visual-studio-code-oss.desktop" \
                        "/usr/share/applications/visual-studio-code-oss.desktop"
  fi
}

export -f vscode-build

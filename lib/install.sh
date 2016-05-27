#!/bin/bash
function vscode_install {
  cp $INDIR/resources/{code.png,visual-studio-code-oss.desktop} $SRC_DEST

  if [[ $DEST_TYPE == 'system' ]]; then

    cd ..

    if [[ -d /opt/VSCode-linux-${_vscode_arch} ]]; then
      sudo rm -rf /opt/VSCode-linux-${_vscode_arch}
    elif [[ -d /opt/VSCode-OSS ]]; then
      sudo rm -rf /opt/VSCode-OSS
    fi

    if [[ -f /usr/share/applications/visual-studio-code-oss.desktop ]]; then
      sudo rm /usr/share/applications/visual-studio-code-oss.desktop
    fi

    if [[ -f /usr/share/applications/code-oss.desktop ]]; then
      sudo rm /usr/share/applications/code-oss.desktop
    fi

    if [[ -f /usr/bin/visual-studio-code-oss ]]; then
      sudo rm /usr/bin/visual-studio-code-oss
    fi

    if [[ -f /usr/bin/code-oss ]]; then
      sudo rm /usr/bin/code-oss
    fi

    mv "$SRC_DEST/code.png" $SRC_DEST/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/

    mv VSCode-linux-${_vscode_arch} VSCode-OSS
    sudo mv VSCode-OSS /opt

    sudo ln -sf "/opt/VSCode-OSS/code-oss" "/usr/bin/code-oss"

    # Modify desktop configuration file
    sed -i -e "s|<%-INST-%>|/opt/VSCode-OSS|g" \
           -e "s|<%-DESC-%>|$DESC|g" "$SRC_DEST/visual-studio-code-oss.desktop"
    sudo install -D -m644 "$SRC_DEST/visual-studio-code-oss.desktop" "/usr/share/applications/code-oss.desktop"

  else

    mv "$SRC_DEST/visual-studio-code-oss.desktop" $SRC_DEST/VSCode-linux-${_vscode_arch}
    mv "$SRC_DEST/code.png" $SRC_DEST/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/
    sed -i -e "s|<%-INST-%>|$HOME/.local/share/VSCode-OSS|g" \
           -e "s|<%-DESC-%>|$DESC|g" $SRC_DEST/VSCode-linux-${_vscode_arch}/visual-studio-code-oss.desktop

    mv $SRC_DEST/VSCode-linux-${_vscode_arch} $SRC_DEST/VSCode-OSS

    if [[ -d $HOME/.local/share/VSCode-OSS ]]; then
      rm -rf $HOME/.local/share/VSCode-OSS
    fi

    if [[ -f $HOME/.local/share/applications/visual-studio-code-oss.desktop ]]; then
      rm -rf $HOME/.local/share/applications/visual-studio-code-oss.desktop
    fi

    if [[ -f $HOME/.local/share/applications/code-oss.desktop ]]; then
      rm -rf $HOME/.local/share/applications/code-oss.desktop
    fi
    if [[ -f $HOME/.local/bin/visual-studio-code-oss ]]; then
      rm -rf $HOME/.local/bin/visual-studio-code-oss
    fi
    if [[ -f $HOME/.local/bin/code-oss ]]; then
      rm -rf $HOME/.local/bin/code-oss
    fi

    if ! [[ -d $HOME/.local/share ]]; then
      mkdir -p $HOME/.local/share
    fi

    if ! [[ -d $HOME/.local/bin ]]; then
      mkdir -p $HOME/.local/bin
    fi

    mv $SRC_DEST/VSCode-OSS $HOME/.local/share/
    ln -sf $HOME/.local/share/VSCode-OSS/code-oss $HOME/.local/bin/code-oss
    install -Dm755 $HOME/.local/share/VSCode-OSS/visual-studio-code-oss.desktop $HOME/.local/share/applications/code-oss.desktop

    printf "Installation complete! \nVSCode is now installed to $HOME/.local/share/VSCode-OSS\n"
  fi
}

export -f vscode_install

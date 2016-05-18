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

    mv "$SRC_DEST/code.png" $SRC_DEST/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/

    mv VSCode-linux-${_vscode_arch} VSCode-OSS
    sudo mv VSCode-OSS /opt

    sudo ln -sf "/opt/VSCode-OSS/code-oss" "/usr/bin/visual-studio-code-oss"

    # Modify desktop configuration file
    sed -i -e "s|<%-INST-%>|/opt/VSCode-OSS|g" \
           -e "s|<%-DESC-%>|$DESC|g" "$SRC_DEST/visual-studio-code-oss.desktop"
    sudo install -D -m644 "$SRC_DEST/visual-studio-code-oss.desktop" "/usr/share/applications/visual-studio-code-oss.desktop"

  else
    mv "$SRC_DEST/visual-studio-code-oss.desktop" $GHUBM/VSCode-linux-${_vscode_arch}
    mv "$SRC_DEST/code.png" $GHUBM/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/
    sed -i -e "s|<%-INST-%>|$HOME/.local/share/VSCode-OSS|g" \
           -e "s|<%-DESC-%>|$DESC|g" visual-studio-code-oss.desktop

    if [[ `pwd` == "$GHUBM/VSCode-linux-${_vscode_arch}" ]]; then
      cd ..
    fi

    mv $GHUBM/VSCode-linux-${_vscode_arch} $GHUBM/VSCode-OSS

    if [[ -d $HOME/.local/share/VSCode-OSS ]]; then
      rm -rf $HOME/.local/share/VSCode-OSS
    fi

    mv $GHUBM/VSCode-OSS $HOME/.local/share/
    install -Dm755 $HOME/.local/share/VSCode-OSS/visual-studio-code-oss.desktop $HOME/.local/share/applications/visual-studio-code-oss.desktop

    printf "Installation complete! \nVSCode is now installed to $HOME/.local/share/VSCode-OSS"
  fi
}

export -f vscode_install

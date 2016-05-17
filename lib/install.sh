#!/bin/bash
function vscode-install {
  cp $INDIR/resources/{code.png,visual-studio-code-oss.desktop} $SRC_DEST

  if [[ $DEST_TYPE == 'local' ]]; then

    mv "$SRC_DEST/visual-studio-code-oss.desktop" .
    mv "$SRC_DEST/code.png" $GHUBM/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/
    sed -i -e "s|<%-INST-%>|$GHUBM/VSCode-linux-${_vscode_arch}|g" \
           -e "s|<%-DESC-%>|$DESC|g" visual-studio-code-oss.desktop
    printf "VScode is now installed to $GHUBM/VSCode-linux-${_vscode_arch}"

  else

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

  fi
}

export -f vscode-install

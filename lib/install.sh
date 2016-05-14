#!/bin/bash
function vscode-install {
  wget -cqO- https://github.com/fusion809/VScode-installer/blob/master/resources/visual-studio-code-oss.desktop > $SRC_DEST/visual-studio-code-oss.desktop

  if [[ $DEST_TYPE == 'local' ]]; then

    mv "$SRC_DEST/visual-studio-code-oss.desktop" .
    sed -i -e "s|<%-INST-%>|$GHUBM/VSCode-linux-${_vscode_arch}|g" visual-studio-code-oss.desktop
    printf "VScode is now installed to $GHUBM/VSCode-linux-${_vscode_arch}"

  else

    cd ..

    if [[ -d /opt/VSCode-linux-${_vscode_arch} ]]; then
      sudo rm -rf /opt/VSCode-linux-${_vscode_arch}
    fi

    sudo mv VSCode-linux-${_vscode_arch} /opt

    sudo ln -sf "/opt/VSCode-linux-${_vscode_arch}/code-oss" "/usr/bin/visual-studio-code-oss"

    # Modify desktop configuration file
    sed -i -e "s|<%-INST-%>|/opt/VSCode-linux-${_vscode_arch}|g" \
           -e "s|<%-DESC-%>|$DESC|g" "$SRC_DEST/visual-studio-code-oss.desktop"
    sudo install -D -m644 "$SRC_DEST/visual-studio-code-oss.desktop" "/usr/share/applications/visual-studio-code-oss.desktop"

  fi
}

export -f vscode-install

#!/bin/bash
function src_prepare {
  cp $INDIR/resources/code.png $SRC_DEST/${lowedit}-$pkgver/resources/linux/code.png
  cp $INDIR/resources/visual-studio-code-oss.desktop $SRC_DEST/${lowedit}-$pkgver/resources/linux/code.desktop
  if [[ $DEST_TYPE == "local" ]]; then
    if [[ $method == "A" ]]; then
      export INST_DEST=$HOME/.local/share/VSCode
    else
      export INST_DEST=$HOME/.local/share/VSCode-OSS
    fi
  else
    if [[ $method == "A" ]]; then
      export INST_DEST=/usr/share/code
    else
      export INST_DEST=/usr/share/code-oss
    fi
  fi

  sed -i -e "s|<%-DESC-%>|$DESC|g" \
         -e "s|<%=INST=%>|$INST_DEST|g" "$SRC_DEST/${lowedit}-$pkgver/resources/linux/code.desktop"
}

export -f src_prepare

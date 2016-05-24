#!/bin/bash
function src_prepare {
  cp $INDIR/resources/code.png $SRC_DEST/${lowedit}-$pkgver/resources/linux/code.png
  cp $INDIR/resources/visual-studio-code-oss.desktop $SRC_DEST/${lowedit}-$pkgver/resources/linux/code.desktop
  sed -i -e "s|<%-DESC-%>|$DESC|g" "$SRC_DEST/${lowedit}-$pkgver/resources/linux/code.desktop"
}

export -f src_prepare

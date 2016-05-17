#!/bin/bash

# Script for easy pushing changes to repo
./perms.sh
# Update to latest version
cd /home/fusion809/GitHub/others/vscode
git fetch -p
git checkout master
git pull origin master

vslver=$(git tag | tail -n "5" | sort -nr | head -n1)
cd -

vscver=$(cat lib/version.sh | sed -n 's/export pkgver=//p' | sed 's/ //g')
sed -i -e "s/$vscver/$vslver/g" lib/version.sh

git add --all
if [[ -n $1 ]]; then
  git commit -m "$1"
else
  git commit -m "Updating"
fi
git push origin master

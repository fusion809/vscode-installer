printf "Do you want to install Visual Studio Code (VScode) from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B] "
read preference

if [[ $preference == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760680" > vscode-i386.deb
  sudo dpkg -i vscode-i386.deb
  sudo apt-get -f install

elif [[ $preference == "B" ]]; then

  debian-build

fi

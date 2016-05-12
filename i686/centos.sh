printf "Do you want to install Visual Studio Code (VScode) from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B] "
read preference

if [[ $preference == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760681" > vscode-i386.rpm
  sudo yum install -y vscode-i386.rpm

elif [[ $preference == "B" ]]; then

  centos-build

fi

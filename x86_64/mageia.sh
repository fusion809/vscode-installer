printf "Do you want to install Visual Studio Code (VScode) from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B] "
read preference

if [[ $preference == "A" ]]; then

  curl -sL "https://go.microsoft.com/fwlink/?LinkID=760667" > vscode-x86_64.rpm
  sudo urpmi vscode-x86_64.rpm

elif [[ $preference == "B" ]]; then

  mageia-build

fi

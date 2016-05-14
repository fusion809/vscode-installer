function vscode-build {
  export GHUB="$HOME/GitHub"
  export DESC="Visual Studio Code (VSCode), open-source version. VSCode is a free text editor developed by Microsoft, that is built on the Electron (formerly Atom Shell) framework, with support for a wide variety of different computer languages."
  version

  # Get the source code
  src-method

  # Get the architecture details and use them appropriately
  arch

  ########### The build #############
  src-build

  vscode-install
}

export -f vscode-build

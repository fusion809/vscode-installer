function vscode_build {
  export GHUB="$HOME/GitHub"
  export DESC="Visual Studio Code (VSCode), open-source version. VSCode is a free text editor developed by Microsoft, that is built on the Electron (formerly Atom Shell) framework, with support for a wide variety of different computer languages."
  version

  dest

  # Get the source code
  src_method

  # Get the architecture details and use them appropriately
  arch

  src_prepare

  ########### The build #############
  src_build

  vscode_install
}

export -f vscode_build

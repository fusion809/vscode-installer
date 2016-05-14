#!/bin/bash
# This script is the main script of this installer.

######################################################################################################
# This first section determines if the user passed the option "help" to the installer script.
if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]] || [[ "$1" == '?' ]]; then
  . ./help.sh
fi
######################################################################################################

######################################################################################################
# This section of the installer script detects the operating system
# and relevant hardware details.

# Distribution name. Previously lsb_release was used, but it failed on Docker containers so this
# substitute was made.
export LD=$(cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g')
# Distribution architecture
export ARCH=$(uname -m | sed 's/i[0-9]/i6/g')
# Distribution version number, e.g., on Fedora 23 it returns 23
export VER=$(cat /etc/os-release | grep -w "VERSION_ID" | sed 's/VERSION_ID=//g' | sed 's/"//g')

######################################################################################################

source "./lib/test.sh"                        # Load the test functions
source "./lib/method.sh"                      # Load the method function
source "./lib/src-method.sh"                  # Load the src-method function
source "./lib/src-build.sh"                   # Load the src-build function
source "./lib/arch.sh"                        # Load the arch function
source "./lib/install.sh"                     # Load the install function
source "./lib/dest.sh"                        # Load the dest function
source "./lib/version.sh"                     # Load the version function

# Load the distribution-specific libraries
if [[ $LD == "Arch Linux" ]] || [[ $LD == "Manjaro"* ]]; then
  source "lib/build/aur.sh"
elif [[ $LD == "CentOS"* ]]; then
  source "lib/build/centos.sh"
elif [[ $LD == "Debian"* ]]; then
  source "lib/build/debian.sh"
elif [[ $LD == "Fedora"* ]]; then
  source "lib/build/fedora.sh"
elif [[ $LD == "Mageia"* ]]; then
  source "lib/build/mageia.sh"
elif [[ $LD == "openSUSE"* ]]; then
  source "lib/build/opensuse.sh"
elif [[ $LD == "Sabayon"* ]]; then
  source "lib/build/sabayon.sh"
elif [[ $LD == "Ubuntu"* ]]; then
  source "lib/build/ubuntu.sh"
fi

# List of supported distributions
DISTROS=(
'Arch'                                      #  Arch Linux
'CentOS'                                    #  CentOS
'Debian'                                    #  Debian
'Fedora'                                    #  Fedora
'Mageia'                                    #  Mageia
'Manjaro'                                   #  Manjaro Linux
'openSUSE'                                  #  openSUSE
'Sabayon'                                   #  Sabayon
'Ubuntu'                                    #  Ubuntu
)

for I in "${DISTROS[@]}"                    # Run the appropriate script, for the distro and architecture
do                                          # we're on
  i=$(echo $I | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' ) # convert distro string to lowercase
  if [[ $LD == "$I"* ]]; then
    ./$ARCH/${i}.sh
  fi
done

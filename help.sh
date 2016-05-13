printf "Hi, you have opted for the in-built help of this repository.\n"
printf 'If you run the `install.sh` script, without options (i.e., by running `./install.sh`)
it should install Visual Studio Code for you. The algorithm it goes through to install Visual Studio Code is:

1. If possible it will install Visual Studio Code from one of the pre-compiled binaries provided by the
Visual Studio Code team. It will prompt you before doing this and ask you if you would prefer to install
Visual Studio Code from the available binary or from source code.

2. If a binary package exists for Visual Studio Code in an official repository of the distribution being used
it will install Visual Studio Code from it.

3. If option 1 or 2 are not possible, or if you opted to install Visual Studio Code from source code it will
run the `./lib/Visual Studio Code-build.sh` script after installing any missing build/runtime dependencies
for Visual Studio Code

Note it will NOT install Visual Studio Code from unofficial binaries or repositories.'

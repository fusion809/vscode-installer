# Visual Studio Code Installer
<p><img src="/images/VSCode-1.1.0-Arch.png" alt="Visual Studio Code 1.1.0 running on Arch Linux"><caption><b>Figure 1: Visual Studio Code 1.1.0 running on Arch Linux</b></caption></p>
This repository contains shell scripts that are to be used installing [Visual Studio Code](http://code.visualstudio.com/) on a variety of different Linux distributions, including:

* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://www.centos.org/)
* [Debian](https://www.debian.org/)
* [Fedora](https://getfedora.org/)
* [Mageia](http://www.mageia.org/en/)
* [Manjaro Linux](https://manjaro.github.io/)
* [openSUSE](https://www.opensuse.org/)
* [Sabayon Linux](http://www.sabayon.org/)
* [Ubuntu](http://www.ubuntu.com/) (and many of its derivatives such as [Linux Mint](https://linuxmint.com/))

The way it detects the operating system it is being run on is by reading the `/etc/os-release` file. So, if you find that running `cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g'` returns the distribution names given above, your distribution should be supported by this installer.

## Use
To use the [`quick-install.sh`](https://github.com/fusion809/VScode-installer/blob/master/quick-install.sh) script run:

```bash
/bin/bash -c "$(curl -sL https://git.io/vrLNn)"
```

while to use wget to get it run:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vrLNn)"
```

## Contributing
For details on how to contribute to this project please see the [CONTRIBUTING.md](/CONTRIBUTING.md) file.

## License
The contents of this repository are licensed under the GNU GPLv3 license, which is found in [LICENSE](/LICENSE).

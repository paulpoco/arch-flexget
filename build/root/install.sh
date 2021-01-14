#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages, should default to Python 3.x
pacman_packages="python python-pip"

# install pre-reqs
pacman -Sy --needed $pacman_packages --noconfirm
pip install --upgrade setuptools
pip install flexget
pip install transmissionrpc

# call aor script (arch official repo)
# source /root/aur.sh

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*

#!/bin/bash

# exit script if return code != 0
set -e

# define aur helper
aur_helper="packer"

# define aur packages
aur_packages="python2 python2-pip"

# create "makepkg-user" user for makepkg
useradd -m -s /bin/bash makepkg-user
echo -e "makepkg-password\nmakepkg-password" | passwd makepkg-user
echo "makepkg-user ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)

# download aur helper (patched version for rpc v5)
curl -L -o "/usr/bin/$aur_helper" "https://github.com/binhex/arch-patches/raw/master/arch-packer/$aur_helper"
chmod a+x "/usr/bin/$aur_helper"
pacman -S --needed jansson expac jshon --noconfirm

# install app using aur helper
su -c "$aur_helper -S $aur_packages --noconfirm" - makepkg-user

# remove base devel excluding useful core packages
pacman -Ru $(pacman -Qgq base-devel | grep -v pacman | grep -v sed | grep -v grep | grep -v gzip) --noconfirm

# remove git
#pacman -Ru git --noconfirm

#pip install flexget

# remove makepkg-user account
userdel -r makepkg-user

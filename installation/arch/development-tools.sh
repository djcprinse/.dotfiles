#!/bin/bash

pacman_packages='curl git screen tmux zsh'
pacman_packages_optional='htop jq rsync shellcheck unzip'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
sudo pacman -S --needed ${pacman_packages} ${pacman_packages_optional}

echo 'Install yay'
rm -rf yay 
git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si
cd ../
rm -rf yay 

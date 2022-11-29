#!/bin/bash

apt_packages='curl git iproute2 screen tmux vim-gtk zsh'
apt_packages_optional='htop jq rsync shellcheck unzip'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
sudo apt-get update && sudo apt-get install -y ${apt_packages} ${apt_packages_optional}

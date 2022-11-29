#!/bin/bash

dnf_packages='util-linux-user curl git iproute2 screen tmux vim-gtk zsh'
dnf_packages_optional='htop jq rsync shellcheck unzip'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
sudo dnf install -y ${dnf_packages} ${dnf_packages_optional}

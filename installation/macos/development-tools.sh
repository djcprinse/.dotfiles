#!/bin/bash

brew_packages='diffutils curl git tmux vim zsh'
brew_packages_optional='htop jq rsync shellcheck unzip openssl'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
brew install ${brew_packages} ${brew_packages_optional}

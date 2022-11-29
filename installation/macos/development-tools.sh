#!/bin/bash

brew_packages='diffutils curl git screen tmux vim zsh'
brew_packages_optional='htop jq rsync shellcheck unzip openssl'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
brew install ${brew_packages} ${brew_packages_optional}

if [ ! -d '/usr/local/bin/' ]; then
  echo 'Create /usr/local/bin/ directory'
  mkdir -p '/usr/local/bin/'
fi

#!/bin/bash

if ! brew --help &> /dev/null; then
  echo 'brew not installed. Trying to install.'
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

  if ! "$?" -eq 0; then
    echo "Something went wrong. Exiting..." && exit 1
  fi

  echo 'brew has been installed.'
fi

# Make sure we’re using the latest Homebrew
echo 'Updating brew'
brew update

# Upgrade any already-installed formulae
echo 'Upgrading brew'
brew upgrade

# Remove outdated versions from the cellar
echo 'Cleaning up brew'
brew cleanup

# Check if brew is healthy
echo 'Checking brew health status'
brew doctor

#!/bin/bash

brew_packages='iterm2 rectangle clipy'
brew_packages_optional=''

# -----------------------------------------------
# Applications
# -----------------------------------------------

echo 'Installing applications'
# shellcheck disable=SC2086
brew install ${brew_packages} ${brew_packages_optional}

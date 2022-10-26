#!/bin/bash

brew_packages='iterm2 rectangle clipy'

# -----------------------------------------------
# Applications
# -----------------------------------------------

echo 'Installing applications'
# shellcheck disable=SC2086
brew install ${brew_packages}

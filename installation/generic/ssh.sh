#!/bin/bash

# ---------------------------------------------
# Configure SSH configuration
# ---------------------------------------------

echo 'Creating ssh directory'
if [ ! -d "${HOME}/.ssh/config.d/" ]; then
  mkdir -p "${HOME}/.ssh/config.d/"
fi

echo 'Symlink ssh configuration'
if [ -f "${HOME}/.ssh/config" ]; then
  rm "${HOME}/.ssh/config"
fi
ln -s "${HOME}/.dotfiles/ssh/config" "${HOME}/.ssh/config"

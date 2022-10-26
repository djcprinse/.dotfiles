#!/bin/bash

# ---------------------------------------------
# Configure SSH configuration
# ---------------------------------------------

if [ ! -d "${HOME}/.ssh/config.d/" ]; then
  echo 'Creating ssh directory'
  mkdir -p "${HOME}/.ssh/config.d/"
fi

if [ -d "${HOME}/.ssh/config" ] || { [ -f "${HOME}/.ssh/config" ] && ! [ -L "${HOME}/.ssh/config" ]; }; then
  echo 'Backup existing ssh configuration'
  mv "${HOME}/.ssh/config" "${HOME}/.ssh/config.bak"
fi

echo 'Symlink ssh configuration'
ln -sf "${HOME}/.dotfiles/ssh/config" "${HOME}/.ssh/config"
chmod 600 "${HOME}/.ssh/config"

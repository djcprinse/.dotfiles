#!/bin/bash

# ---------------------------------------------
# Configure basic .gitignore and config
# ---------------------------------------------

if [ -d "${HOME}/.gitignore" ] || { [ -f "${HOME}/.gitignore" ] && ! [ -L "${HOME}/.gitignore" ]; }; then
  echo 'Backup existing .gitignore to .gitignore.bak'
  mv "${HOME}/.gitignore" "${HOME}/.gitignore.bak"
fi

echo 'Symlink global .gitignore'
ln -sf "${HOME}/.dotfiles/git/.gitignore" "${HOME}/.gitignore"

if [ -d "${HOME}/.gitconfig" ] || { [ -f "${HOME}/.gitconfig" ] && ! [ -L "${HOME}/.gitconfig" ]; }; then
  echo 'Backup existing .gitconfig to .gitconfig.bak'
  mv "${HOME}/.gitconfig" "${HOME}/.gitconfig.bak"
fi

echo 'Create .gitconfig'
{
  echo '[include]'
  echo 'path = ~/.dotfiles/git/.gitconfig'
  echo
} >> "${HOME}/.gitconfig"

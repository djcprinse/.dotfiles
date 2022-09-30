#!/bin/bash

# ---------------------------------------------
# Configure basic .gitignore and config
# ---------------------------------------------

if [ -f "${HOME}/.gitignore" ]; then
  echo 'Rename existing .gitignore to .gitignore.bak'
  mv "${HOME}/.gitignore" "${HOME}/.gitignore.bak"
fi

echo 'Symlink global .gitignore'
ln -s "${HOME}/.dotfiles/git/.gitignore" "${HOME}/.gitignore"

if [ -f "${HOME}/.gitconfig" ]; then
  echo 'Rename existing .gitconfig to .gitconfig.bak'
  mv "${HOME}/.gitconfig" "${HOME}/.gitconfig.bak"
fi

echo 'Create .gitconfig'
{
  echo '[include]'
  echo 'path = ~/.dotfiles/git/.gitconfig'
  echo
} >> "${HOME}/.gitconfig"

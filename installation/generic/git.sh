#!/bin/bash

# ---------------------------------------------
# Configure basic .gitignore and config
# ---------------------------------------------

echo 'Symlink global .gitignore'
rm $HOME/.gitignore
ln -s $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore

echo 'Symlink basic git config'
rm $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

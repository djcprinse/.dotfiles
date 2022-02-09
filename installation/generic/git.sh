#!/bin/bash

# ---------------------------------------------
# Configure basic .gitignore and config
# ---------------------------------------------

echo 'Rename existing .gitignore to .gitignore.bak'
mv $HOME/.gitignore $HOME/.gitignore.bak
echo 'Symlink global .gitignore'
ln -s $HOME/.dotfiles/git/.gitignore $HOME/.gitignore

echo 'Rename existing .gitconfig to .gitconfig.bak'
mv $HOME/.gitconfig $HOME/.gitconfig.bak

echo 'Create .gitconfig'
touch $HOME/.gitconfig
echo '[include]' >> $HOME/.gitconfig
echo "path = $HOME/.dotfiles/git/.gitconfig" >> $HOME/.gitconfig
echo >> $HOME/.gitconfig

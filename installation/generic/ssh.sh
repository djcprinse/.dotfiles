#!/bin/bash

# ---------------------------------------------
# Configure SSH configuration
# ---------------------------------------------

echo 'Creating ssh directory'
mkdir $HOME/.ssh/
mkdir $HOME/.ssh/config.d/

echo 'Symlink ssh configuration'
rm $HOME/.ssh/config
ln -s $HOME/.dotfiles/ssh/config $HOME/.ssh/config

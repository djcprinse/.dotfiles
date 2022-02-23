#!/bin/bash

echo
echo '#######################'
echo '### linux bootstrap ###'
echo '#######################'

./generic/terminal.sh
./generic/ssh.sh
./generic/git.sh
./generic/brew.sh
./linux/development-tools.sh
./linux/applications.sh

echo '#######################'
echo 'Ready setting up linux!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo '2. Set the terminal configuration to use the fonts'
echo '3. Adjust the theme colors to match the iTerm2 Smoooooth theme at https://github.com/eendroroy/alacritty-theme/blob/master/themes/smoooooth.yml'

echo '#######################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '#######################'

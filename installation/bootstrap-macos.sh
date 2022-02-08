#!/bin/bash

echo
echo '#######################'
echo '### macOS bootstrap ###'
echo '#######################'

./generic/terminal.sh
./generic/ssh.sh
./generic/git.sh
./macos/xcode-select.sh
./macos/brew.sh
./macos/development-tools.sh
./macos/applications.sh

echo '#######################'
echo 'Ready setting up macOS!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo '2. Set iTerm2 configuration included in $HOME/.dotfiles/iterm'

echo '#######################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '#######################'

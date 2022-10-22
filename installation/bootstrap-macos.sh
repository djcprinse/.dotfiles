#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo
echo '#######################'
echo '### macOS bootstrap ###'
echo '#######################'

"${script_dir}/generic/terminal.sh"
"${script_dir}/generic/ssh.sh"
"${script_dir}/generic/git.sh"
"${script_dir}/macos/xcode-select.sh"
"${script_dir}/macos/brew.sh"

read -r -p 'Do you want to install development tools? (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" = 'y' ]]; then
  "${script_dir}/macos/development-tools.sh"
fi

read -r -p 'Do you want to install applications? (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" = 'y' ]]; then
  "${script_dir}/macos/applications.sh"
fi

echo '#######################'
echo 'Ready setting up macOS!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo "2. Set iTerm2 configuration included in ${HOME}/.dotfiles/iterm"

echo '#######################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '#######################'

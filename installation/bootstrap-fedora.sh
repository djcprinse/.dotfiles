#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo
echo '########################'
echo '### fedora bootstrap ###'
echo '########################'

"${script_dir}/generic/terminal.sh"
"${script_dir}/generic/ssh.sh"
"${script_dir}/generic/git.sh"

read -r -p 'Do you want to install development tools? (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" = 'y' ]]; then
  "${script_dir}/fedora/development-tools.sh"
fi

read -r -p 'Do you want to install applications? (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" = 'y' ]]; then
  "${script_dir}/fedora/applications.sh"
fi

echo '########################'
echo 'Ready setting up fedora!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo '2. Set the terminal configuration to use the fonts'
echo '3. Adjust the theme colors to match the iTerm2 Smoooooth theme at https://github.com/eendroroy/alacritty-theme/blob/master/themes/smoooooth.yml'

echo '########################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '########################'

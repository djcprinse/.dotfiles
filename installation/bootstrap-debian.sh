#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo
echo '########################'
echo '### debian bootstrap ###'
echo '########################'

install_script() {
  while true; do
    read -rp "Do you want to install ${1}? (y/n) [y]? " yn
    yn=${yn:-'y'}
    case ${yn} in
      [Yy]*)
        ${2}
        break
        ;;
      [Nn]*)
        break
        ;;
      *) echo "Please answer yes or no (y/n)." ;;
    esac
  done
}

install_script 'development tools' "${script_dir}/debian/development-tools.sh"
install_script 'zsh terminal' "${script_dir}/generic/terminal.sh"
install_script 'ssh configuration' "${script_dir}/generic/ssh.sh"
install_script 'git configuration' "${script_dir}/generic/git.sh"
install_script 'applications' "${script_dir}/debian/applications.sh"

echo '########################'
echo 'Ready setting up debian!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo '2. Set the terminal configuration to use the fonts'
echo '3. Adjust the theme colors to match the iTerm2 Smoooooth theme at https://github.com/eendroroy/alacritty-theme/blob/master/themes/smoooooth.yml'

echo '########################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '########################'

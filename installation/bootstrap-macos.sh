#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo
echo '#######################'
echo '### macOS bootstrap ###'
echo '#######################'

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

install_script 'xcode-select' "${script_dir}/macos/xcode-select.sh"
install_script 'brew' "${script_dir}/macos/brew.sh"
install_script 'development tools' "${script_dir}/macos/development-tools.sh"
install_script 'zsh terminal' "${script_dir}/generic/terminal.sh"
install_script 'ssh configuration' "${script_dir}/generic/ssh.sh"
install_script 'git configuration' "${script_dir}/generic/git.sh"
install_script 'applications' "${script_dir}/macos/applications.sh"

echo '#######################'
echo 'Ready setting up macOS!'
echo 'Things to do to make the powerlevel10k theme work"'
echo '1. Install the recommended font as stated at https://github.com/romkatv/powerlevel10k#fonts'
echo "2. Set iTerm2 configuration included in ${HOME}/.dotfiles/iterm"

echo '#######################'
echo 'Optional goodies'

echo '1. Create an optional .dotfiles-* configuration for personal or work configuration'
echo '#######################'

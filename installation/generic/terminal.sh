#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# -----------------------------------------------
# Terminal
# -----------------------------------------------

echo 'Hide "last login" line when starting a new terminal session.'
touch "${HOME}/.hushlogin"

echo 'Installing oh-my-zsh'
if [ -d "${HOME}/.oh-my-zsh" ]; then
  echo 'Removing existing oh-my-zsh installation before proceeding'
  rm -rf "${HOME}/.oh-my-zsh"
fi

curl -fsSLo "${SCRIPT_DIR}/install.sh" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh "${SCRIPT_DIR}/install.sh" --unattended
rm "${SCRIPT_DIR}/install.sh"

echo 'Installing oh-my-zsh plugins'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone --depth=1 https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-completions"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"


# ---------------------------------------------
# Configure zsh
# ---------------------------------------------

echo 'Symlink .zshrc configuration'
if [ -f "${HOME}/.zshrc" ]; then
  rm "${HOME}/.zshrc"
fi
ln -s "${HOME}/.dotfiles/zsh/.zshrc" "${HOME}/.zshrc"

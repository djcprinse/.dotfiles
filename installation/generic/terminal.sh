#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
zsh_config_dir="${HOME}/.config/zsh"
zsh_cache_dir="${HOME}/.cache/zsh"

# -----------------------------------------------
# Terminal
# -----------------------------------------------

echo 'Hide "last login" line when starting a new terminal session.'
touch "${HOME}/.hushlogin"

echo 'Create zsh directories'
if [ -d "${zsh_config_dir}" ]; then
  mkdir -p "${zsh_config_dir}"
fi

if [ -d "${zsh_cache_dir}" ]; then
  mkdir -p "${zsh_cache_dir}"
fi

echo 'Installing oh-my-zsh'
if [ -d "${zsh_config_dir}/.oh-my-zsh" ]; then
  echo 'Removing existing oh-my-zsh installation before proceeding'
  rm -rf "${zsh_config_dir}/.oh-my-zsh"
fi

curl -fsSLo "${script_dir}/install.sh" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH=${zsh_config_dir}/.oh-my-zsh sh "${script_dir}/install.sh" --unattended
rm "${script_dir}/install.sh"

echo 'Installing oh-my-zsh plugins'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-${zsh_config_dir}/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone --depth=1 https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${zsh_config_dir}/.oh-my-zsh/custom}/plugins/zsh-completions"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${zsh_config_dir}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-${zsh_config_dir}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"


# ---------------------------------------------
# Configure zsh
# ---------------------------------------------

echo 'Symlink .zshenv'
if [ -f "${HOME}/.zshenv" ]; then
  rm "${HOME}/.zshenv"
fi

ln -s "${HOME}/.dotfiles/zsh/.zshenv" "${HOME}/.zshenv"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${HOME}/.dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH="${XDG_CONFIG_HOME}/zsh/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP=${XDG_CACHE_HOME}/zsh/.zcompdump-${ZSH_VERSION}

fpath+=${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-completions/src

plugins+=(autoupdate zsh-autosuggestions zsh-syntax-highlighting)
plugins+=(copypath git history history-substring-search man rsync screen ssh-agent sudo tmux z)
plugins+=(macos brew)
plugins+=(debian)
plugins+=(dnf yum)

if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  # gnubin; gnuman
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
fi

# Load the custom dotfiles zshrc files if available
for dir in ${HOME}/.dotfiles-*/; do
    # remove the trailing "/"
    dir=${dir%*/}

    for file in ${dir}/zsh/.zshrc; do
        [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
    done
done
unset file

source "${ZSH}/oh-my-zsh.sh"

# Load the shell dotfiles, and then custom dotfiles if available
# .dotfiles-* can be used for other settings
for file in ${HOME}/.dotfiles/zsh/.{exports,aliases}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
done
unset file

for dir in ${HOME}/.dotfiles-*/; do
    # remove the trailing "/"
    dir=${dir%*/}

    for file in ${dir}/zsh/.{exports,aliases}; do
        [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
    done
done
unset file

# Load p10k-lean zsh configuration
# To customize prompt, run `p10k configure` or edit ${HOME}/.dotfiles/zsh/p10k-lean.zsh.
[[ ! -f ${HOME}/.dotfiles/zsh/p10k-lean.zsh ]] || source ${HOME}/.dotfiles/zsh/p10k-lean.zsh

autoload -U compinit && compinit -d ${ZSH_COMPDUMP}

ZSH="${XDG_CONFIG_HOME}/zsh/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP=${XDG_CACHE_HOME}/zsh/.zcompdump-${ZSH_VERSION}

plugins+=(zsh-autosuggestions zsh-completions zsh-interactive-cd zsh-syntax-highlighting)
plugins+=(common-aliases copypath dirhistory git history history-substring-search man rsync screen ssh-agent sudo tmux z)
plugins+=(macos brew)
plugins+=(debian)
plugins+=(dnf yum)

source "${ZSH}/oh-my-zsh.sh"

# Load the shell dotfiles, and then custom dotfiles if available
# .dotfiles-* can be used for other settings
for file in ${HOME}/.dotfiles/zsh/.{exports,aliases}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
done

for dir in ${HOME}/.dotfiles-*/; do
    # remove the trailing "/"
    dir=${dir%*/}

    for file in ${dir}/zsh/.{exports,aliases,zshrc}; do
        [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
    done
done
unset file

# Load p10k-lean zsh configuration
source "${HOME}/.dotfiles/zsh/p10k-lean.zsh"

autoload -U compinit && compinit -d ${ZSH_COMPDUMP}

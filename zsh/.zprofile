# This file runs once at login.

# Set up a few standard directories based on:
#   https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Add all local binaries to the system path.
export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/sbin:${PATH}"

# Set vim as default editor
export EDITOR="vim"
# export VIMINIT="set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc"

# Prefer GB English and use UTF-8
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# Add colors to the less and man commands.
export LESS=-R
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb=$'\e[1;31mm'    # begin blinking
export LESS_TERMCAP_md=$'\e[1;36m'     # begin bold
export LESS_TERMCAP_us=$'\e[1;332m'    # begin underline
export LESS_TERMCAP_so=$'\e[1;44;33m'  # begin standout-mode - info box
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_ue=$'\e[0m'        # end underline
export LESS_TERMCAP_se=$'\e[0m'        # end standout-mode

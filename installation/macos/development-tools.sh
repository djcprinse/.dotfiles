#!/bin/bash

brew_packages='curl tmux zsh'
brew_packages_bsd_missing='watch wget wdiff autoconf'
brew_packages_bsd_counterparts='coreutils binutils diffutils ed findutils gawk gnu-indent gnu-sed gnu-tar gnu-which grep gzip screen grep gpatch'
brew_packages_bsd_outdated='flex'
brew_packages_gnu_outdated='bash emacs gpatch less m4 make nano bison'
brew_packages_gnu_preferred='libressl file-formula git openssh perl python rsync unzip vim'
brew_packages_optional='htop jq yq shellcheck openssl'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
# shellcheck disable=SC2086
brew install ${brew_packages} \
  ${brew_packages_bsd_missing} \
  ${brew_packages_bsd_counterparts} \
  ${brew_packages_bsd_outdated} \
  ${brew_packages_gnu_outdated} \
  ${brew_packages_gnu_preferred} \
  ${brew_packages_optional}

if [ ! -d '/usr/local/bin/' ]; then
  echo 'Create /usr/local/bin/ directory'
  mkdir -p '/usr/local/bin/'
fi

#!/bin/bash

dnf_packages='curl git iproute2 tmux vim-gtk util-linux-user zsh'
dnf_packages_optional='htop jq rsync shellcheck unzip php-cli'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
sudo dnf install -y ${dnf_packages} ${dnf_packages_optional}

echo 'Changing default shell to zsh'
sudo chsh -s /usr/bin/zsh

if ! [ -x "$(command -v php)" ]; then
  echo 'Installing composer v2'
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer --2.2

  read -r -p 'Do you want to install composer v1 (EOL)? (y/n) [y]? ' CONT
  CONT=${CONT:-'y'}
  if [[ "${CONT}" = 'y' ]]; then
    echo 'Installing composer v1'
    sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer1 --1
  fi

  php -r "unlink('composer-setup.php');"

  echo 'Installing php tools'
  composer global require "squizlabs/php_codesniffer"
  composer global require "friendsofphp/php-cs-fixer"
  composer global require "phpmd/phpmd"
fi

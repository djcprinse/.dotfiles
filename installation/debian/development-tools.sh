#!/bin/bash

apt_packages='curl git iproute2 tmux vim-gtk zsh'
apt_packages_optional='htop jq rsync shellcheck unzip php-cli'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
sudo apt-get update && apt-get install -y "${apt_packages}" "${apt_packages_optional}"

echo 'Changing default shell to zsh'
sudo chsh -s /usr/bin/zsh

if ! [ -x "$(command -v php)" ]; then
  echo 'Installing php'
  sudo apt-get install -qq software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get update

  # TODO Make installing php interactive so you can decide what version to install
  #sudo apt-get install -qq php
  #sudo apt-get install -qq php8.0
  sudo apt-get install -qq php7.4
  #sudo apt-get install -qq php7.3
  #sudo apt-get install -qq php7.2
  #sudo apt-get install -qq php7.1
  #sudo apt-get install -qq php7.0
  #sudo apt-get install -qq php5.6

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

echo 'Installing docker'
sudo apt-get install -qq \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -qq \
  docker-ce \
  docker-ce-cli \
  containerd.io

echo 'Installing ddev'
brew tap drud/ddev
brew install ddev

# TODO Make installing node interactive so you can decide what version to install
#brew install node
echo 'Installing node'
#brew install node@16
brew install node@14
brew link --overwrite --force node@14
#brew install node@12
#brew install node@10

#!/bin/bash

brew_packages='diffutils curl git tmux vim zsh'
brew_packages_optional='htop jq rsync shellcheck unzip openssl'

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing packages'
brew install ${brew_packages} ${brew_packages_optional}

echo 'Installing php'
brew tap shivammathur/php

# TODO Make installing php interactive so you can decide what version to install
brew install php
#brew install php@8.0
#brew install php@7.4
#brew link --overwrite --force php@7.4
#brew install php@7.3
#brew install php@7.2
#brew install php@7.1
#brew install php@7.0
#brew install php@5.6

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

echo 'Installing docker'
brew install docker

echo 'Installing ddev'
brew tap drud/ddev
brew install ddev

echo 'Installing node'
# TODO Make installing node interactive so you can decide what version to install
#brew install node
#brew install node@16
brew install node@14
brew link --overwrite --force node@14
#brew install node@12
#brew install node@10

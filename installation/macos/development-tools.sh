#!/bin/bash

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Installing zsh'
brew install zsh

echo 'Installing git'
brew install git

echo 'Installing vim'
brew install vim

echo 'Installing php'
brew tap shivammathur/php

# TODO Make installing php interactive so you can decide what version to install
#brew install php
#brew install php@8.0
brew install php@7.4
brew link --overwrite --force php@7.4
#brew install php@7.3
#brew install php@7.2
#brew install php@7.1
#brew install php@7.0
#brew install php@5.6

echo 'Installing composer v2'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin
php -r "unlink('composer-setup.php');"

read -p 'Do you want to install composer v1? (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ $CONT != 'y' ]]; then
  echo 'Installing composer v1'
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer1 --version=1.10.25
  php -r "unlink('composer-setup.php');"
fi

echo 'Installing php tools'
composer global require "squizlabs/php_codesniffer"
composer global require "friendsofphp/php-cs-fixer"
composer global require "phpmd/phpmd"

echo 'Installing docker'
brew install --cask docker

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

echo 'Installing tmux'
brew install tmux

echo 'Installing openssl@1.1'
brew install openssl@1.1

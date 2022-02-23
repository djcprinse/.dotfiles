#!/bin/bash

# -----------------------------------------------
# Programming Languages, Frameworks and CLI tools
# -----------------------------------------------

echo 'Updating apt-get'
sudo apt-get update

echo 'Installing zsh'
sudo apt-get install -qq zsh

echo 'Installing git'
sudo apt-get install -qq git

echo 'Installing vim'
sudo apt-get install -qq vim

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

echo 'Installing composer'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

echo 'Installing php tools'
composer global require "squizlabs/php_codesniffer"
composer global require "friendsofphp/php-cs-fixer"
composer global require "phpmd/phpmd"

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

echo 'Installing tmux'
sudo apt-get install -qq tmux

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

echo 'Installing php tools'
brew install php-code-sniffer
brew install php-cs-fixer
brew install phpmd

echo 'Installing composer'
brew install composer

echo 'Installing Docker'
brew install homebrew/cask/docker

echo 'Installing ddev'
brew tap drud/ddev
brew install ddev

# TODO Make installing node interactive so you can decide what version to install
#brew install node
#brew install node@10
#brew install node@12
echo 'Installing node'
brew install node@14
brew link --overwrite --force node@14

echo 'Installing openssl@1.1'
brew install openssl@1.1

echo 'Installing tmux'
brew install tmux

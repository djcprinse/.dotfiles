#!/bin/bash

# -----------------------------------------------
# Applications
# -----------------------------------------------

echo 'Installing Firefox'
sudo apt-get install -qq firefox

echo 'Installing Spotify'
curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -qq spotify-client

echo 'Installing Visual Studio Code'
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code

echo 'Installing PhpStorm'
curl -fsSLO https://download.jetbrains.com/webide/PhpStorm-2021.3.2.tar.gz
sudo tar -xzf PhpStorm-*.tar.gz -C /opt
rm -f PhpStorm-*.tar.gz

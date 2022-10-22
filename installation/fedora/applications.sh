#!/bin/bash

# -----------------------------------------------
# Applications
# -----------------------------------------------

echo 'Installing PhpStorm'
curl -fsSLO https://download.jetbrains.com/webide/PhpStorm-2022.2.3.tar.gz
sudo tar -xzf PhpStorm-*.tar.gz -C /opt
rm -f PhpStorm-*.tar.gz

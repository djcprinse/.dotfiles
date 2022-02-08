#!/bin/bash

echo '###########################'
echo '### .dotfiles installer ###'
echo '###########################'

read -p 'This script will help you setup your .dotfiles. Continue (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ $CONT != 'y' ]]; then
  echo 'Bye'
  exit 0;
fi

if [[ $OSTYPE == 'linux-gnu'* ]]; then
  echo
  echo 'Linux detected. Right now, Linux is unsupported for automated bootstrap.'
  exit 0;
elif [[ $OSTYPE == 'darwin'* ]]; then
  echo
  echo 'macOS detected.'
  ./bootstrap-macos.sh
else
  echo
  echo 'We have detected an unsupported OS for automated bootstrap. Aborting.'
  exit 0;
fi

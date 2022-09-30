#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo '###########################'
echo '### .dotfiles installer ###'
echo '###########################'

read -r -p 'This script will help you setup your .dotfiles. Continue (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" != 'y' ]]; then
  echo 'Bye'
  exit 0;
fi

if [[ ${OSTYPE} == 'linux-gnu'* ]]; then
  echo
  echo 'Linux detected. Right now, Linux supported is minimal for automated bootstrap.'
  "${SCRIPT_DIR}/bootstrap-linux.sh"
elif [[ ${OSTYPE} == 'darwin'* ]]; then
  echo
  echo 'macOS detected.'
  "${SCRIPT_DIR}/bootstrap-macos.sh"
else
  echo
  echo 'We have detected an unsupported OS for automated bootstrap. Aborting.'
  exit 0;
fi

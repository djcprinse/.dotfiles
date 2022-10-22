#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo '###########################'
echo '### .dotfiles installer ###'
echo '###########################'

read -r -p 'This script will help you setup your .dotfiles. Continue (y/n) [y]? ' CONT
CONT=${CONT:-'y'}
if [[ "${CONT}" != 'y' ]]; then
  echo 'Bye'
  exit 0;
fi

case $(uname -s) in
  'Linux'*)
    echo
    echo 'Linux detected. Right now, Linux supported is minimal for automated bootstrap.'

    if [ "$(grep -Ei 'redhat|fedora' /etc/*release)" ]; then
      echo
      echo 'fedora based distribution detected.'
      "${script_dir}/bootstrap-fedora.sh"
    if [ "$(grep -Ei 'debian|buntu' /etc/*release)" ]; then
      echo
      echo 'debian based distribution detected.'
      "${script_dir}/bootstrap-debian.sh"
    else
      echo
      echo 'Unsupported linux based distribution detected. Aborting.'
      exit 0;
    fi
    ;;
  'Darwin'*)
    echo
    echo 'macOS detected.'
    "${script_dir}/bootstrap-macos.sh"
    ;;
  *)
    echo
    echo 'We have detected an unsupported OS for automated bootstrap. Aborting.'
    exit 0;
    ;;
esac

#!/bin/bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo '###########################'
echo '### .dotfiles installer ###'
echo '###########################'

install() {
  case $(uname -s) in
    'Linux'*)
      echo
      echo 'Linux detected. Right now, Linux supported is minimal for automated bootstrap.'

      if [ "$(grep -Ei 'arch' /etc/*release)" ]; then
        echo
        echo 'arch based distribution detected.'
        "${script_dir}/bootstrap-arch.sh"
      elif [ "$(grep -Ei 'redhat|fedora' /etc/*release)" ]; then
        echo
        echo 'fedora based distribution detected.'
        "${script_dir}/bootstrap-fedora.sh"
      elif [ "$(grep -Ei 'debian|buntu' /etc/*release)" ]; then
        echo
        echo 'debian based distribution detected.'
        "${script_dir}/bootstrap-debian.sh"
      else
        echo
        echo 'Unsupported linux based distribution detected. Aborting.'
        exit
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
      exit
      ;;
  esac
}

while true; do
  read -rp 'This script will help you setup your .dotfiles. Continue (y/n) [y]? ' yn
  yn=${yn:-'y'}
  case ${yn} in
    [Yy]*)
      install
      break
      ;;
    [Nn]*)
      echo 'Bye'
      exit
      ;;
    *) echo "Please answer yes or no (y/n)." ;;
  esac
done

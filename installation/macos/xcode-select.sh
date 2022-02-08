#!/bin/bash

# Install Xcode select if it is not installed
if ! xcode-select --help &> /dev/null; then
  echo 'xcode-select is not installed. Trying to install xcode-select.'
  xcode-select --install

  if ! "$?" -eq 0; then
    echo "Something went wrong. Exiting..." && exit 1
  fi

  echo 'xcode-select has been installed.'
fi

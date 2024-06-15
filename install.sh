#!/bin/bash

echo "Installing for MacOS >>>>>>>>>"

if [ "$(uname)" != "Darwin" ]; then
  echo "Not running on OSX"
  exit 1
fi

echo "Brewing all the things >>>>>>>>>"
source install/brew.sh

echo "Updating OSX settings >>>>>>>>>"
source install/osx.sh

echo "Install dotfiles >>>>>>>>>"
source install/config.sh

echo "Setting zsh as default shell >>>>>>>>>"
chsh -s $(which zsh)

echo "Done."

#!/bin/bash

echo "install homebrew & packages..."
if test ! $(which brew); then
  echo "Installing homebrew"  
  #echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles" >> ~/.zshrc
  #source ~/.zshrc
  #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "installing homebrew packages..."


exit 0



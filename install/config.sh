#!/bin/bash
DOTFILES=$HOME/dotfiles

echo "install dotfiles/.config to ~/.config..."
if [ ! -d "${DOTFILES}" ]; then
  echo "dotfiles not found, please <git clone git@github.com:favesing/dotfiles.git> first!"
  exit 1
fi

if [ ! -d $HOME/.config ]; then
  echo "Create ~/.config"
  mkdir -p $HOME/.config
fi

# for config in $DOTFILES/.config/*; do
#   target=$HOME/.config/$(basename $config)
#   if [ -e $target ]; then
#     echo "~${target#$HOME} already exists... Skipping."
#   else
#     echo "Creating symlink for $config"
#     ln -s $config $target
#   fi
# done




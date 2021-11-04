#!/bin/bash

# Symlink the .zshrc file from .dotfiles/shell
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/default.zshrc $HOME/.zshrc

# Symlink Terminal profile from .dotfiles/shell
rm -rf $HOME/Library/Preferences/com.apple.Terminal.plist
ln -s $HOME/.dotfiles/shell/com.apple.Terminal.plist $HOME/Library/Preferences/com.apple.Terminal.plist

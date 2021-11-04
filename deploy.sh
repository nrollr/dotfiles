#!/bin/bash

# Install Oh My Zsh
echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed!"
exit

# Symlink the .zshrc file from .dotfiles/shell
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/default.zshrc $HOME/.zshrc

# Install all brew packages with bundle
echo "Installing brew packages"

brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/homebrew/brewfile
echo "Packages installed!"

# Symlink Terminal profile from .dotfiles/shell
rm -rf $HOME/Library/Preferences/com.apple.Terminal.plist
ln -s $HOME/.dotfiles/shell/com.apple.Terminal.plist $HOME/Library/Preferences/com.apple.Terminal.plist

# Clone Github repositories
echo "Cloning github repositories"

cd $HOME/Downloads && mkdir Github && cd Github
sh $HOME/.dotfiles/github/setup.sh
echo "Github repositories cloned!"

# Set macOS preferences
# source $HOME/.dotfiles/macos/setup.sh
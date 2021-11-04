#!/bin/bash

# Install Oh My Zsh
echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed!"

# Symlink the .zshrc file from .dotfiles/shell
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/default.zshrc $HOME/.zshrc

# Load Terminal profile
open ~/.dotfiles/shell/nord.terminal
defaults write com.apple.terminal "Default Window Settings" "nord.terminal"

# Install all brew packages with bundle
echo "Installing brew packages"

brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/homebrew/brewfile
echo "Packages installed!"

# Clone Github repositories
echo "Cloning github repositories"

cd $HOME/Downloads && mkdir Github && cd Github
sh $HOME/.dotfiles/github/setup.sh
echo "Github repositories cloned!"


# Set macOS preferences
# source $HOME/.dotfiles/macos/setup.sh
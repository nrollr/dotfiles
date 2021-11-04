#!/bin/bash

# Install all brew packages with bundle
echo "Installing brew packages"

brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/homebrew/brewfile
echo "Packages installed!"

# Install Oh My Zsh
echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed!"
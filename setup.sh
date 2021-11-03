#!/bin/bash

# Install Homebrew
# Includes installation of command line tools and git
echo "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

echo "Homebrew installed!"

# Clone the dotfiles repository
echo "Cloning dotfiles repository"
mkdir $HOME/.dotfiles && cd $HOME/.dotfiles
git clone git@github.com:nrollr/dotfiles.git .

echo "Dotfiles repository cloned!"
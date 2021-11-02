#!/bin/bash

# Install Homebrew
# Includes installation of command line tools and git
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
echo "Homebrew installed!"

# Clone the dotfiles repository
echo "Cloning dotfiles repository"
cd $HOME
mkdir .dotfiles && cd .dotfiles
git clone git@github.com:nrollr/dotfiles.git .
echo "Dotfiles repository cloned!"

# Install all brew packages with bundle
echo "Installing packages"
cd $HOME/.dotfiles/
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/homebrew/brewfile
echo "Packages installed!"

# Clone Github repositories
echo "Cloning github repositories"
cd $HOME/Downloads
mkdir Github && cd Github
$HOME/.dotfiles/github/repositories.sh
echo "Github repositories cloned!"

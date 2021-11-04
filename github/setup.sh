#!/bin/bash

# Clone Github repositories
echo "Cloning github repositories"

cd $HOME/Downloads && mkdir Github && cd Github
git clone git@github.com:nrollr/EC2-timeline.git
git clone git@github.com:nrollr/Tailwind-boilerplate.git

echo "Github repositories cloned!"
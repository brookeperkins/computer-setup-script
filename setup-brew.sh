#!/bin/bash

## Install our alias files and initialize them
clear
echo "Installing Core WSL Aliases and Helpers"
curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.wsl --output .wsl
curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.gitprompt --output .gitprompt
echo "source ~/.gitprompt" >> ~/.bashrc
echo "source ~/.wsl" >> ~/.bashrc
source ~/.wsl
source ~/.gitprompt


clear
echo "Updating APT Database"
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove

## Install HomeBrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
sudo apt-get install build-essential curl file git

## GIT
brew install git

## Tree
brew install tree

## Heroku
brew tap heroku/brew && brew install heroku

## AWS
brew install awscli

## Postgres
# clear
brew install postgres
echo "Create Postgres user and default database"
echo "   When Prompted ..."
echo "     - Use your wsl username as the database name"
echo "     - Provide your wsl username and password to create a new pg user"
echo "     - Say 'Yes' when asked if this user should be a Super User'"
echo ""
sudo -u postgres createuser --interactive --pwprompt
sudo -u postgres createdb -O `whoami` `whoami`

## Mongo
# brew install mongodb

## Node and Helper Apps
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
brew install nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm   [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
nvm install stable
nvm use stable
npm install -g nodemon
npm install -g live-server
npm install -g json-server


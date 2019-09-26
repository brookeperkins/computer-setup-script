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

clear
echo "Installing 'git'"
sudo apt install git
## TODO: Setup the git configuration to use SSH

clear
echo "Installing the 'tree' utility"
# Install Tree
sudo apt install tree

clear
echo "Installing 'node' with 'nvm'"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash && source ~/.bashrc && nvm install stable && nvm use stable

# clear
# echo "Installing helper applictions 'nodemon, live-server, json-server'"
npm install -g nodemon
npm install -g live-server
npm install -g json-server

# clear
# echo "Installing 'heroku'"
# bash <(curl -s https://cli-assets.heroku.com/install.sh)

# clear
# echo "Installing 'postgres database server and client'"
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install postgresql-10
# ## TODO: Auto Start?

# clear
# echo "Create Postgres user and default database"
# echo "   When Prompted ..."
# echo "     - Use your wsl username as the database name"
# echo "     - Provide your wsl username and password to create a new pg user"
# echo "     - Say 'Yes' when asked if this user should be a Super User'"
# echo ""
# sudo -u postgres createuser --interactive --pwprompt
# sudo -u postgres createdb -O `whoami` `whoami`

# clear
# echo "Installing 'mongo database server and client'"
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
# sudo apt-get update
# sudo apt-get install -y mongodb-org
# sudo mkdir -p ~/data/db
# ## TODO:  Auto Start?

# clear
# verify

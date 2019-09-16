#!/bin/bash

## Install our alias files and initialize them
curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.wsl --output .wsl
curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.gitprompt --output .gitprompt
source ~/.wsl
source ~/.gitprompt

echo "source ~/.gitprompt" >> ~/.bashrc
echo "source ~/.wsl" >> ~/.bashrc

## Update APT
sudo apt get update

# Install Git
sudo apt install git

# Install Tree
sudo apt install tree

# Install NPM and Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm use stable

# Install some global node apps
npm install -g nodemon
npm install -g live-server
npm install -g json-server

# Heroku
bash <(curl -s https://cli-assets.heroku.com/install.sh)

# Postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-10
sudo service postgresql start
# Auto Start?

echo "Create Postgres user"
sudo -u postgres createuser --interactive --pwprompt
sudo -u postgres createdb -O `whoami` `whoami`

# Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo mkdir -p ~/data/db
sudo mongod --dbpath ~/data/db
# Auto Start?

verify

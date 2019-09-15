#!/bin/bash

curl https://gist.githubusercontent.com/johncokos/66fad129ce3493d079755f83c4360e9f/raw/0b21422bdaf26923dd3c8686cb4aacec11817bbd/.wsl --output .wsl
curl https://gist.githubusercontent.com/johncokos/d1376b366f388523d7b446e11a91868e/raw/11133073c12ac5cf737bebaa3745a5fc066b3e82/.gitprompt --output .gitprompt

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

# Install some basic node apps
npm install -g live-server
npm install -g json-server

## Ensure we can open up VSC or Webstorm from inside WSL

# VERIFY
echo "GIT `which git`"
echo "TREE `which tree`"
echo "Live Server `which live-server`"
echo "JSON Server `which json-server`"
echo "NODE `which node`"
echo "NPM `which npm`"

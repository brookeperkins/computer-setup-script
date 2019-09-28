#!/bin/bash

isWSL() {
  UNAME=$(uname -r)
  [ -z "${UNAME##*Microsoft*}" ];
}

installDotFiles() {
  clear
  echo "Installing Core Aliases and Helpers"
  curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.gitprompt --output .gitprompt
  curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.aliases --output .aliases
  echo "source ~/.gitprompt" >> ~/.bashrc
  echo "source ~/.aliases" >> ~/.bashrc
  source ~/.gitprompt
  source ~/.aliases

  ## For WSL Users, install an additional dotfile
  if isWSL; then
    curl https://raw.githubusercontent.com/codefellows/computer-setup/master/.wsl --output .wsl
    echo "source ~/.wsl" >> ~/.bashrc
    source ~/.wsl
  fi

  mkdir ~/.cache
  chmod 777 ~/.cache
}

updateAPT() {
  if isWSL; then
    clear
    echo "Updating APT Database"
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt autoremove
  fi
}

installHomebrew() {
  clear
  echo "Istalling Homebrew"
  if isWSL; then
    echo "Windows, skipping homebrew"
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

installNode() {

  mkdir ~/.nvm

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"

  echo "export NVM_DIR=$NVM_DIR" >> ~/.nvmrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.nvmrc
  echo '[ -s "$NVM_DIR/etc/bash_completion" ] && . "$NVM_DIR/etc/bash_completion"' >> ~/.nvmrc
  echo "source ~/.nvmrc" >> ~/.bashrc

  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/etc/bash_completion" ] && . "$NVM_DIR/etc/bash_completion"

  nvm install stable

  npm install -g nodemon
  npm install -g live-server
  npm install -g json-server
}


installGit() {
  if isWSL; then
    sudo apt install git
  else
    brew install git
  fi
  # Do the ssh thing too?
}

installTree() {
  if isWSL; then
    sudo apt install tree
  else
    brew install tree
  fi
}

installHeroku() {
  if isWSL; then
    curl https://cli-assets.heroku.com/install.sh | sh
  else
    brew tap heroku/brew && brew install heroku
  fi
}

installAWS() {
  if isWSL; then
    sudo apt-get install awscli
  else
    brew install awscli
  fi
}

installPostgres() {
  clear
  if isWSL; then
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install postgresql-10
    sudo service postgresql start
  else
    brew install postgres
    brew services start postgresql
  fi

  echo "Create Postgres user and default database"
  echo "   When Prompted ..."
  echo "     - Use your wsl username as the database name"
  echo "     - Provide your wsl username and password to create a new pg user"
  echo "     - Say 'Yes' when asked if this user should be a Super User'"
  echo ""

  # sudo -u postgres createuser --interactive --pwprompt
  # sudo -u postgres createdb -O `whoami` `whoami`

  createuser --interactive --pwprompt
  createdb -O `whoami` `whoami`
}

installMongo() {

  clear
  echo "Installing 'mongo database server and client'"

  if isWSL; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo mkdir -p ~/data/db
    ## TODO:  Auto Start?
  else
    brew tap mongodb/brew
    brew install mongodb-community
    brew services start mongodb/brew/mongodb-community
  fi

}

## Let's Go!
installDotFiles
updateAPT
installHomebrew
installNode
installGit
installTree
installHeroku
installPostgres
installMongo

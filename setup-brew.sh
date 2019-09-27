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
  clear
  echo "Updating APT Database"
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt autoremove
}

installHomebrew() {
  clear
  echo "Istalling Homebrew"
  if isWSL; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bashrc && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bashrc
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    sudo apt-get install build-essential curl file git
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

installNode() {
  mkdir ~/.nvm
  if isWSL; then
    export NVM_ROOT="/home/linuxbrew/.linuxbrew/opt/nvm"
  else
    export NVM_ROOT="/usr/local/opt/nvm"
  fi
  brew install nvm

  echo "export NVM_HOME=$HOME/.nvm" >> ~/.nvmrc
  echo "export NVM_ROOT=$NVM_ROOT" >> ~/.nvmrc
  echo '[ -s "$NVM_ROOT/nvm.sh" ] && . "$NVM_ROOT/nvm.sh"' >> ~/.nvmrc
  echo '[ -s "$NVM_ROOT/etc/bash_completion" ] && . "$NVM_ROOT/etc/bash_completion"' >> ~/.nvmrc
  echo "source ~/.nvmrc" >> ~/.bashrc
  source ~/.nvmrc

  #export NVM_DIR="$HOME/.nvm"
  #[ -s "$NVM_ROOT/nvm.sh" ] && . "$NVM_ROOT/nvm.sh"
  #[ -s "$NVM_ROOT/etc/bash_completion" ] && . "$NVM_ROOT/etc/bash_completion"

  nvm install stable
  nvm use stable

  npm install -g nodemon
  npm install -g live-server
  npm install -g json-server
}


installGit() {
  brew install git
  # Do the ssh thing too?
}

installTree() {
  brew install tree
}

installHeroku() {
  if isWSL; then
    curl https://cli-assets.heroku.com/install.sh | sh
  else
    brew tap heroku/brew && brew install heroku
  fi
}

installAWS() {
  brew install awscli
}

installPostgres() {
  clear
  brew install postgres
  echo "Create Postgres user and default database"
  echo "   When Prompted ..."
  echo "     - Use your wsl username as the database name"
  echo "     - Provide your wsl username and password to create a new pg user"
  echo "     - Say 'Yes' when asked if this user should be a Super User'"
  echo ""
  sudo -u postgres createuser --interactive --pwprompt
  sudo -u postgres createdb -O `whoami` `whoami`
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
# installDotFiles
# updateAPT
# installHomebrew
# installNode
#installGit
#installTree
#installHeroku
 installPostgres
# installMongo

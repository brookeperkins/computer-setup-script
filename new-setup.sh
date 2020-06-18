#!/usr/bin/env bash
DEBIAN_FRONTEND=noninteractive
apt="sudo apt-get -qq -y"
y_install="sudo yum install -y -q -e 0"

usage() { echo "Usage: $0 " 1>&2; exit 1; }

_spin() {
  spinner="\\|/-\\|/-"
  tput civis # make cursor invisible
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

spin() {
  _spin &
  SPIN_PID=$!
}

end-spin() {
  kill -9 $SPIN_PID >/dev/null 2>&1
  tput cnorm
}

info() {
  echo -e "\e[1;36m${1}\e[0m" # cyan
}
warn() {
  echo -e "\e[1;33m${1}\e[0m" # yellow
}

apt-update() {
  info "Updating system packages"
  spin
  $apt update
  $apt upgrade
  end-spin
}

yum-update() {
  info "Updating system packages"
  spin
  sudo yum update -y -q -e 0
  end-spin
}

linux-update() {
  if [[ $distro == debian ]]; then
    apt-update
  elif [[ $distro == redhat ]]; then
    yum-update
  fi
}

app-check() {
  info "Checking to see if $1 is installed..."
  sleep 1
  if [[ -n $(command -v $1) ]]; then
    warn "$1 is already installed"
    return 0
  fi
  info "Not found.  Installing $1..."
  return 1
}

version-check() {
  echo -ne "\e[1;34m${1}\e[0m: "
  echo `$1 --version 2>/dev/null|| echo -e "\e[31mNot Installed\e[0m"`
}

install-mongo-debian() {
  curl -qo- https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  $apt update
  $apt install mongodb-org

  curl -qo- https://downloads.mongodb.com/compass/mongodb-compass-community_1.21.2_amd64.deb > ~/.alchemy/downloads/mongodb-compass-community_1.21.2_amd64.deb
  sudo dpkg -i ~/.alchemy/downloads/mongodb-compass-community_1.21.2_amd64.deb
}

install-mongo-redhat() {
  # TODO
  # Change this to the git location for the .repo file
  curl -qo- https://raw.githubusercontent.com/alchemycodelab/computer-setup-script/script-rewrite/lib/mongodb-org-4.2.repo | sudo tee /etc/yum.repos.d/mongodb-org-4.2.repo

  spin
  $y_install mongodb-org
  end-spin

  info "Downloading MongoDB Compass..."
  spin
  curl -so- https://downloads.mongodb.com/compass/mongodb-compass-1.21.2.x86_64.rpm > ~/.alchemy/downloads/mongodb-compass-1.21.2.x86_64.rpm
  end-spin
  info "Installing MongoDB Compass..."
  sleep 2
  spin
  $y_install ~/.alchemy/downloads/mongodb-compass-1.21.2.x86_64.rpm
  end-spin
}

install-mongo-darwin() {
  brew tap mongodb/brew
  brew install mongodb-community
  brew services start mongodb/brew/mongodb-community
}

install-mongo() {
  app-check mongo && return 0

  if [[ $OS == Linux ]]; then
    if [[ $distro == debian ]]; then
      install-mongo-debian
    elif [[ $distro == redhat ]]; then
      install-mongo-redhat
    fi
    if [[ -n $(command -v systemctl) ]]; then
      sudo systemctl enable mongodb
      sudo systemctl start mongodb
    fi
  else
    install-mongo-darwin
  fi
}

# Final report for students to screencap to submit and confirm everything
# is installed correctly
check-all-versions() {
  for app in ${apps[@]}
  do
    version-check ${app}
  done
}

install-heroku() {
  app-check heroku && return 0
  curl -o- https://cli-assets.heroku.com/install.sh | bash >/dev/null 2>&1
}

install-nvm() {
  if [[ -f "$HOME/.nvm/nvm.sh" ]]; then
    source $HOME/.nvm/nvm.sh
  fi
  
  app-check nvm && return 0
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  info "Installing node"
  nvm install node
  nvm alias default node
  npm install -g eslint
}

install-git() {
  app-check git && return 0
  if [[ $OS == Linux ]]; then
    if [[ $distro == debian ]]; then
      spin
      $apt install git
      end-spin
    elif [[ $distro == redhat ]]; then
      spin
      $y_install git
      end-spin
    fi
  else
    brew install git
  fi
}

install-homebrew() {
  app-check brew && return 0
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

distro-check() {
  if [[ $(command -v apt) ]]; then
    distro='debian'
  else if [[ $(command -v yum) ]]; then
    distro='redhat'
    fi
  fi
  info "Detected a ${distro}-based installation."
}

init() {
  distro-check
  if [[ $OS == Linux ]]; then
    linux-update
  elif [[ $OS == Darwin ]]; then
    install-homebrew
  fi
}

distro='none'
apps=('git' 'node' 'npm' 'eslint' 'heroku' 'mongo')
OS=$(uname -s)
trap "kill -9 $SPIN_PID" `seq 0 15`

set -e
if [[ ! -d ~/.alchemy ]]; then
  mkdir -p ~/.alchemy/downloads
fi

init

install-git
install-nvm
install-heroku
install-mongocurl -qo- https://raw.githubusercontent.com/alchemycodelab/computer-setup-script/script-rewrite/new-setup.sh | bash

check-all-versions

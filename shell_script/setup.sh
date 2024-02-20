#!/bin/bash
echo "Bash Script excuting ..."

bash --help

echo "update and upgrade ubuntu"
sudo apt-get update && sudo apt-get upgrade

echo "Install Curl"
sudo apt install curl
curl --version

# Install and setup Homebrew
echo "Install and setup Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/marko/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc
brew doctor
brew update
brew upgrade
brew --version
brew list

# install Nodejs
echo "Install @node20"
brew install node@20
brew install npm
node --version 
npm --version
npm install --global yarn
yarn --version

# Install Git
brew install git
git --version
git config --global user.email 'minhazul.islamcse@gmail.com'
git config --global user.name 'sohag47'

# Intsall and setup Docker 
echo "Intsall and setup Docker"
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version
docker compose version



echo "Bash Script excuted successfully."
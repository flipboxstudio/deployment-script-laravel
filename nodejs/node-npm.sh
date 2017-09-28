#!/bin/bash

echo "Cleaning up existing nodejs & npm..."
sudo apt remove nodejs npm

echo "Installing node 6.x"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Installing n, node package manager"
sudo npm install -g n

echo "Installing lts version of nodejs"
n lts
echo "Installing latest version of nodejs"
n latest

echo "Installing latest version of npm"
sudo npm install -g npm

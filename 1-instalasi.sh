#!/bin/bash

# TODO: Configure root password for MySQL
rootpass="TYPE-YOUR-FANCY-BUT-SECURE-MYSQL-ROOT-PASSWORD-HERE"

# Setting up environment
sudo locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8
sudo dpkg-reconfigure locales

# Update the repositories
echo "Getting latest update from repository"
sudo apt-get update

# Apache, Php, MySQL and required packages installation
echo "Installing required applications"
sudo apt-get -y install build-essential apache2 php5 curl libapache2-mod-php5 php5-mcrypt php5-curl php5-mysql php5-gd php5-cli php5-dev mysql-client mcrypt memcached php5-memcached beanstalkd git 

# Enable required PHP modules
echo "Enabling required PHP & Apache modules"
sudo php5enmod opcache
sudo a2enmod rewrite

# Installing NodeJS and required packages
echo "Installing required Node packages"
sudo apt-get -y install nodejs npm
npm config set prefix '~/.npm-packages'
export PATH="$PATH:$HOME/.npm-packages/bin"
npm install -g pm2
npm install -g bower
npm install -g grunt-cli
npm install -g gulp

# Install Composer
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# The following commands set the MySQL root password to configured below when you install the mysql-server package.
echo "Setting up MySQL"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $rootpass"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $rootpass"
sudo apt-get -y install mysql-server

# Restart all the installed services to verify that everything is installed properly
sudo service mysql restart > /dev/null

# Installing & configuring phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $rootpass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $rootpass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $rootpass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"﻿
sudo apt-get -y install phpmyadmin

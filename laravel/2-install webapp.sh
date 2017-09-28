#!/bin/bash

# EDIT these lines
# Use "develop" for testing purposes, or "master" for production
appbranch="develop"
appname="awesomewebapp"
repo="https://your-repo-provider.domain/user/repo.git"

curdir=$(pwd)
wwwdir="/var/www/$appname"
dbuser=$appname
dbpass="$appname-p455w0rd!"
# STOP editing

echo "Creating directory: $wwwdir"
sudo mkdir $wwwdir

echo "Setting up database"
# Configure MySQL DB for OACM
MYSQL=`which mysql`
Q1="CREATE DATABASE IF NOT EXISTS $dbuser;"
Q2="GRANT ALL ON *.* TO '$dbuser'@'localhost' IDENTIFIED BY '$dbpass';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
sudo $MYSQL -uroot -p -e "$SQL"
sudo service mysql restart

echo "Cloning application: $appname"
# Cloning application
sudo git clone $repo $wwwdir
sudo chown -R www-data:www-data $wwwdir
cd $wwwdir
sudo git checkout $appbranch

echo "Setting up application: $appname"
# Setting up application for the first time
composer install
sudo cp "$curdir/$appname.env" "$wwwdir/.env"
php artisan key:generate
php artisan migrate --seed

echo "Enabling subdomain"
# Copying sites configuration
sudo cp "$curdir/$appname.conf" /etc/apache2/sites-enabled/
# Enabling sites
sudo a2ensite $appname
# Restart all the installed services to verify that everything is installed properly
sudo service apache2 restart

echo "Finished installing application: $appname"

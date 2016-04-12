#!/bin/bash

sudo apt-get remove -y build-essential apache2 php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-mysql php5-gd php5-cli php5-dev mysql-client mcrypt memcached php5-memcached beanstalkd git phpmyadmin

composerfile=$(`which composer`)
sudo rm $composerfile

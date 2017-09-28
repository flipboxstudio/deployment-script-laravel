#!bin/bash

echo "uninstall existing mongo version"
sudo service mongod stop
sudo apt-get purge mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

echo "installing mongodb from 3.2"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# cd /lib/systemd/system/
# vim mongod.service
systemctl daemon-reload
# systemctl start mongod
# systemctl enable mongod
service mongod start

echo "check mongod status"
service mongod status
ps -ax | grep mongo

# from https://www.howtoforge.com/tutorial/install-mongodb-on-ubuntu-16.04/

echo "create new user for your database using db.createUser({user:\"user\", pwd:\"pwd\", roles:[\"readWrite\", \"dbAdmin\"]})"
mongo
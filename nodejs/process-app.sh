#!bin/bash

echo "installing deployd"
sudo npm install deployd-cli -g

echo "installing forever"
sudo npm install forever -g

echo "installing pm2"
sudo npm install pm2 -g

# https://medium.com/@orhan_safa/how-to-set-up-a-deployd-server-in-your-digitaloceans-droplet-fb847f86307b
# https://www.digitalocean.com/community/tutorials/how-to-use-pm2-to-setup-a-node-js-production-environment-on-an-ubuntu-vps
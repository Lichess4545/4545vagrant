#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source ".env" || { echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2 ; exit 1; }

sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install --assume-yes build-essential python3.6 python3.6-dev postgresql postgresql-server-dev-10 libjpeg-dev libpng-dev libgif-dev mercurial git libtiff-dev virtualenv redis curl

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g yarn

cd /home/vagrant/

ln -sf /vagrant/Chesster
ln -sf /vagrant/heltour

cd /home/vagrant/heltour
./start.sh

# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER heltour_lichess4545 WITH PASSWORD 'sown shuts combiner chattels';"
sudo -u postgres createdb -O heltour_lichess4545 heltour_lichess4545

cd /home/vagrant/Chesster
yarn install
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER chesster WITH PASSWORD 'scrappy pulpit gourde hinders';"
sudo -u postgres createdb -O chesster chesster

# TODO: make a wget that gets the latest database and .env files appropriately
curl https://www.lakin.ca/4/5/4/5/${4545VAGRANT_PW}/.env --output /home/vagrant/Chesster/.env
mkdir -p /home/vagrant/heltour/data/
curl https://www.lakin.ca/4/5/4/5/${4545VAGRANT_PW}/heltour_lichess4545_public.sql.bz2 --output /home/vagrant/heltour/latestdb.sql.bz2

cd /home/vagrant/Chesster
yarn run migrate

cd /home/vagrant/heltour/
source /home/vagrant/heltour/env/bin/activate
fab -R dev latestdb

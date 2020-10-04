#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source .env || { echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2 ; exit 1; }


sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install --assume-yes build-essential python3.6 python3.6-dev postgresql postgresql-server-dev-10 libjpeg-dev libpng-dev libgif-dev mercurial git libtiff-dev virtualenv redis curl ruby-sass

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

cd /home/vagrant/

ln -sf /vagrant/Chesster
ln -sf /vagrant/heltour

cd /home/vagrant/heltour
./start.sh

# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER heltour_lichess4545 WITH PASSWORD 'sown shuts combiner chattels';"
sudo -u postgres createdb -O heltour_lichess4545 heltour_lichess4545

# create and fill .pgpass
touch /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass
echo "localhost:*:heltour_lichess4545:heltour_lichess4545:sown shuts combiner chattels" > /home/vagrant/.pgpass


cd /home/vagrant/Chesster
yarn install --dev
yarn build
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER chesster WITH PASSWORD 'scrappy pulpit gourde hinders';"
sudo -u postgres createdb -O chesster chesster

# TODO: make a wget that gets the latest database and .env files appropriately
curl -s -# https://www.lakin.ca/4/5/4/5/${_4545VAGRANTPW}/.env --output /home/vagrant/Chesster/.env
mkdir -p /home/vagrant/heltour/data/
curl -s -# https://www.lakin.ca/4/5/4/5/${_4545VAGRANTPW}/heltour_lichess4545_public.sql.bz2 --output /home/vagrant/heltour/data/latestdb.sql.bz2

cd /home/vagrant/Chesster
export NODE_ENV=development
yarn run migrate --url 'postgres://chesster:scrappy pulpit gourde hinders@localhost/chesster'

cd /home/vagrant/heltour/
source /home/vagrant/heltour/env/bin/activate
fab -R vagrant latestdb

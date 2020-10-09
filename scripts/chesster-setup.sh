#!/bin/bash

cd /home/vagrant/Chesster
yarn install --dev --no-bin-links
yarn build
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER chesster WITH PASSWORD 'scrappy pulpit gourde hinders';"
sudo -u postgres createdb -O chesster chesster

cd /home/vagrant/Chesster
export NODE_ENV=development
yarn run migrate --url 'postgres://chesster:scrappy pulpit gourde hinders@localhost/chesster'

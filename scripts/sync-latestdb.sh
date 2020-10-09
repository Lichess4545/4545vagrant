#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source .env || { echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2 ; exit 1; }

mkdir -p /home/vagrant/heltour/data/
curl -s --progress-bar https://www.lakin.ca/4/5/4/5/${_4545VAGRANTPW}/heltour_lichess4545_public.sql.bz2 --output /home/vagrant/heltour/data/latestdb.sql.bz2


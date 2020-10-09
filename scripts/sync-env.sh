#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source .env || { echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2 ; exit 1; }

curl -s --progress-bar https://www.lakin.ca/4/5/4/5/${_4545VAGRANTPW}/.env --output /home/vagrant/Chesster/.env

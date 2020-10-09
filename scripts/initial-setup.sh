#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source .env || { echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2 ; exit 1; }

/vagrant/scripts/heltour-dependencies.sh
/vagrant/scripts/heltour-directories.sh
/vagrant/scripts/chesster-dependencies.sh
/vagrant/scripts/chesster-directories.sh

/vagrant/scripts/sync-env.sh
/vagrant/scripts/sync-latestdb.sh

/vagrant/scripts/chesster-setup.sh
/vagrant/scripts/heltour-setup.sh

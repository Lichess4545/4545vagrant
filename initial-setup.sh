#!/bin/bash
sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install --assume-yes build-essential python python-dev postgresql postgresql-server-dev-10 libjpeg-dev libpng-dev libgif-dev mercurial git libtiff-dev virtualenv python-pip redis

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

cd /home/vagrant/

ln -sf /vagrant/Chesster
ln -sf /vagrant/heltour

cd /home/vagrant/heltour
./start.sh

# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER heltour_lichess4545 WITH PASSWORD 'sown shuts combiner chattels';"
sudo -u postgres createdb -O heltour_lichess4545 heltour_lichess4545

cd /home/vagrant/Chesster
npm install --only=dev
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER chesster WITH PASSWORD 'scrappy pulpit gourde hinders';"
sudo -u postgres createdb -O chesster chesster
cp /vagrant/vagrantconfig.js /home/vagrant/Chesster/config/

cat >> /vagrant/Chesster/config/test_heltour_token.js << EOF
module.exports = {
  token: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
EOF

cat >> /vagrant/Chesster/config/test_chesster_slack_token.js << EOF
module.exports = {
  token: "xoxb-XXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXX"
}
EOF

cat >> /vagrant/Chesster/config/test_slack_token.js << EOF
module.exports = {
  token: "xoxb-XXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXX"
}
EOF

cd /home/vagrant/Chesster/config
ln -sf /vagrant/Chesster/config/test_slack_token.js slack_token.js
ln -sf /vagrant/Chesster/config/test_heltour_token.js heltour_token.js
ln -sf /vagrant/Chesster/config/test_chesster_slack_token.js chesster_slack_token.js

cd /home/vagrant/Chesster
npm run migrate ./config/vagrantconfig.js

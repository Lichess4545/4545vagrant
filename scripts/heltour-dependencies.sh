#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install --assume-yes build-essential python3 python3-dev postgresql postgresql-server-dev-12 libjpeg-dev libpng-dev libgif-dev mercurial git libtiff-dev virtualenv redis curl ruby-sass openjdk-17-jre-headless



# 4545vagrant
Support creating a local development environment for the Lichess4545 league website and slack bot.

# local repo setup
Clone this repository, then git clone both your chesster fork and
your heltour fork into the top-level-directory of this repository
ensuring the directory names are: `Chesster` and `heltour`

You will need a few `.env` files in order to run this. If you are a 45+45 developer
please contact lakinwecker on the slack for testing `.env` files. If you are another
developer you will need to make your own slack testing instance and setup the bot
integrations on your own.

# environment setup
Note: if you are developing on a Windows machine working with `VirtualBox` and `Vagrant`:
- You may need to install the vagrant-vbguest plugin: `vagrant plugin install vagrant-vbguest`
- Make sure git is not using CRLF for line endings: `git config --global core.autocrlf false`

Once the `.env` files are in place, run `vagrant up`

If this completes appropriately, you will have a testing database for heltour,
and appropriate keys in place to just run heltour/chesster for simple development.

You many need to update the database:
```
vagrant ssh
source heltour-env/bin/activate
cd heltour
python manage.py migrate
```

# running the environment

Run `vagrant ssh` in two different terminals. Then in one of them run:
```
source heltour-env/bin/activate
cd heltour
fab runserver
```
When that is started, In the other run:
```
cd Chesster
yarn run start
```

To enable the usage of the lichess API by heltour, open a third terminal and run:
```
vagrant ssh
source heltour-env/bin/activate
cd heltour
fab runapiworker
```

The website will be available at `localhost:8000`

Work on heltour/chesster out of those directories and commit/push like you normally
would.

When you're done working run:

`vagrant halt`

later on to start working again run:

`vagrant up`

then follow the instructions above to run Chesster / heltour.

# video setup introduction
This video gives an introduction to both heltour and Chesster for developers:
https://www.youtube.com/watch?v=zCt91lDLvOM

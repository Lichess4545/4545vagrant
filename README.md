Usage:

clone this repository, then git clone both your chesster fork and
your heltour fork into the top-level-directory of this repository
ensuring the directory names are: `Chesster` and `heltour`

You will need a few `.env` files in order to run this. If you are a 45+45 developer
please contact lakinwecker on the slack for testing `.env` files. If you are another
developer you will need to make your own slack testing instance and setup the bot
integrations on your own.

Once these `.env` files are in place, run `vagrant up`

If this completes appropriately, you will have a testing database for heltour,
and appropriate keys in place to just run heltour/chesster for simple development.

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

Work on heltour/chesster out of those directories and commit/push like you normally
would.

When you're done working run:

`vagrant halt`

later on to start working again run:

`vagrant up`

then follow the instructions above to run Chesster / heltour.


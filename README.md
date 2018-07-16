Usage:

clone this repository, then git clone both your chesster fork and
your heltour fork into the top-level-directory of this repository
ensuring the directory names are: `Chesster` and `heltour`

Then run `vagrant up`

To run chesster you will need a few keys. If you are a 45+45 mod, contact lakinwecker
for some testing ones you can use with our slack. If you are another developer you
will need to make your own slack and setup the bot integrations approprirately.

Three files are created with non-working keys, please edit them and put in working keys:
  * `Chesster/config/test_chesster_slack_token.js` -> get your own from your own slack or ask lakinwecker if you're a lichess league mod
  * `Chesster/config/test_slack_token.js` -> same as above
  * `Chesster/config/test_heltour_token.js` -> Create your own in the heltour admin
  * `Chesster/config/vagrantconfig.js` -> You shouldn't have to edit these.

Once the keys are in place, you will need to load a copy of the database to be able
to work on it. You can create an empty one using the normal django facilities, or
ask lakinwecker for a copy and he'll guide you through getting is setup.

Once the keys and the database are in place, run `vagrant ssh` in two different
terminals. Then in one of them run:
```
cd heltour
source env/bin/activate
fab runserver
```
When that is started, In the other run:
```
cd Chesster
./bin/start ./config/vagrantconfig.js
```

Work on heltour/chesster out of those directories and commit/push like you normally
would.

When you're done working run:

`vagrant halt`

later on to start working again run:

`vagrant up`

then follow the instructions above to run Chesster / heltour.


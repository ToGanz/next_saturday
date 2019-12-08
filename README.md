# README

This is an webapp for event planning. I plan to use with a group of friends to organize activities.

Users can signup, activate their accounts and reset their passwords. Then users can create events.

My aim in developing this app is to get the concept of authentication and authorization down and to improve my skills in writing Tests.
I copied the frontend of the app from a rails tutorial and only modified it

The app isn't finished yet. 
TODO's:

- The Homepage should be a calendar with all the events of the month
- the test suite for Interface and event attendance is not finished



## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

Or test the deployed version on heroku: https://next-saturday.herokuapp.com/
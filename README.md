# README

This is an webapp for event planning. I plan to use with a group of friends to organize activities.

Users can signup, activate their accounts and reset their passwords. Then users can create events.

My aim in developing this app is to get the concept of authentication and authorization down and to improve my skills in writing Tests.
I copied the frontend of the app from a rails tutorial and only modified it

The app isn't finished yet. 
TODO's:

- Users can create events, but not yet join events.
- The Homepage shows all upcoming events. Users should be able to click on one    event and join it as a participant. 
- The show page of the event should list all participants.
- The show page of the user (user's profile page) should show the upcoming        events they participate in. At the moment it just shows their created events.
- The Homepage should be a calendar with all the events of the month



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

deployed version on heroku: https://next-saturday.herokuapp.com/
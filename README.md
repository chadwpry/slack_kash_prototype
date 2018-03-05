# Kash Prototype

![alt text](https://github.com/chadwpry/slack_kash_prototype/raw/master/public/images/kash.jpg "Kash")

## Description

Kash is a Slack App prototype meant to demonstrate commands, ephemeral
messages, and simple interactive components.

## Where to start

### Expectations

You are currently using an apple computer for development. While this may work
in another operating system, the setup commands are tied directly to the
Darwin operating system.

You also have homebrew installed. The setup of this application makes use of
homebrew for installing binaries, most notably docker-compose. We will use
docker for setup of our databases in the application environment.

### Create a Slack App

Kash requires an application is setup within Slack. If you are not yet
familiar with how to create a Slack App, the link below will help.
Keep in mind you will need to create a Slack account to create apps.

https://api.slack.com/apps

### Setup your Rails application

Let's assume you have already cloned this respository and are currently in the
application directory. Our next step is to bootstrap the application. This will
install aa few binaries via homebrew.

```bash
script/bootstrap
```

After this command has completed execution, you will have installed all
homebrew dependencies, setup rbenv for ruby versioning, packaged your gems into
the vendor folder, and finally created an .env file. The .env file is located
in the root folder. This is a copy of .env.example and should not be
checked into your repository.

### Setup environment variables

You will need to locate the Basic Information section of your Slack App.
Within that section, you will find App Credentials. They are automatically
created for you by Slack. The Client ID, Client Secret, and Verification Token
are values we will need to add to our .env file, located in the root directory.

Once you have found the file, you can add them like the following example.

*note - It is not required to include multiple tokens. It is possible if
desired.*

```bash
SLACK_CLIENT_ID=<client_id>
SLACK_CLIENT_SECRET=<client_secret>
SLACK_VERIFICATION_TOKENS=<token>,<token>
```

### Spin up the Postgres and Redis

We will need database storage for our application to maintain stateful
information. I choose Postgresql for our database and Redis for data storage
relating to our background job processing. Use the command below to start
the database servers. This will need to be accomplished each time you start
development. You can taylor this expectation by running docker-compose up as
a daemon process within your script/server. I choose not to run a daemon
process to have more flexibility in shutting down components of the application
individually.

Execute the following command in a iterm (terminal) window. Keep in mind, you
will need to keep this window open while developing.

```bash
docker-compose up
```

### Create the databases

This command will create databases based on our config/database.yml file. It
will also run db:reset to clear all information. If that is not desired, just
remove bin/rake db:reset from the script/setup file.

```bash
script/setup
```

### Spin up the Rails application

Now that we have completed all the other setup steps, the only part remaining
is to start our Rails application. This can be done by calling a script
command.

```bash
script/server
```

## Contributing to Kash

First off, Kash loves contribution! He is a bit of a ham and enjoys interacting
with others. If you are interested in contributing, please submit pull requests,
propose features, and discuss issues.

## License
Kash is released under the [MIT License](http://www.opensource.org/licenses/MIT).

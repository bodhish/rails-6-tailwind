
# README

A simple rails starter with few addon's that i generally use.

### Includes
- Reason React
- Tailwind 
- Active Admin 
- Reform Rails 
- Devise
- Omniauth - Facebook & Google
- Fontawesome
- Pnotify
- Reason Utils [bs-fetch, @glennsl/bs-json, bs-platform, bs-webapi]


## How to use?

- Clone the repo
- rename `example.env` to `.env`
- replace all usages of `your_app_name`, `YourAppName` and `YOUR_APP_NAME` with you applciation name 


## Install and configure dependencies


#### On macOS

We'll use [Homebrew](https://brew.sh/) to fetch most of the packages on macOS:
- postgresql - Install [Postgres.app](http://postgresapp.com) and follow its
  [instructions](https://postgresapp.com/documentation/install.html), **including** the part about setting up
  command-line tools.

#### On Ubuntu

The following command should install all required dependencies on Ubuntu. If you're using another _flavour_ of Linux,
adapt the command to work with the package manager available with your distribution.

    $ sudo apt-get install postgresql postgresql-contrib autoconf libtool

### Install Ruby and Rubygems

Use [rbenv](https://github.com/rbenv/rbenv) to install the version of Ruby specified in the `.ruby-version` file.

Once Ruby is installed, fetch all gems using Bundler:

    $ bundle install

You may need to install the `bundler` gem if the version of Ruby you have installed comes with a different `bundler`
version. Simply follow the instructions in the error message, if this occurs.

If installation of of `pg` gem crashes, asking for `libpq-fe.h`, install the gem with:

#### On macOS:

    # Find the exact path to pg_config.
    $ find /Applications -name pg_config

    # Use the path returned by the above command in the following one. Replace X.Y.Z with the same version that failed to install.
    $ gem install pg -v 'X.Y.Z' -- --with-pg-config=/path/to/pg_config

#### On Ubuntu:

    $ sudo apt-get install libpq-dev

### Setup ReasonML & Javascript environment

1. Install NVM following instructions on the [offical repository.](https://github.com/creationix/nvm)
2. Install the LTS version of NodeJS: `nvm install --lts`
3. Install Yarn following [offical instructions.](https://yarnpkg.com/en/docs/install).
4. From the root of the repository, run the `yarn` command to install all node modules.

## Set credentials for local database

We'll now set a password for the `postgres` database username.

Make sure that the PostgreSQL server is running. Once that's done, we'll set a password for the
default database user. Open the `psql` CLI:

    # macOS
    $ psql -U postgres

    # Ubuntu
    $ sudo -u postgres psql

Then set a new password and quit.

    # Set a password for this username.
    postgres=# \password postgres

    # Quit.
    postgres=# \q

Feel free to alter these steps if you're familiar with setting up PostgreSQL.

## Configure application environment variables

1. Copy `example.env` to `.env`.

   ```
   $ cp example.env .env
   ```

2. Update the values of `DB_USERNAME` and `DB_PASSWORD` in the new `.env` file.

   Use the same values from the previous step. The username should be `postgres`, and the password will be whatever
   value you've set.

The `.env` file contains environment variables that are used to configure the application. The file contains
documentation explaining where you should source its values from.

## Compile ReasonML code

If you've used the `yarn` command to install JS dependencies, then ReasonML code should already be compiled at this
point. To compile ReasonML code again (if you've made changes), you can either do a one-time build, or set up a watcher.

    # One-time recompilation
    $ yarn run re:build

    # Recompile, and then watch for changes
    $ yarn run re:watch

## Run Webpack Dev Server

Start the Webpack Dev Server on another tab or window:

    $ bin/webpack-dev-server

## Start the Rails server

With `webpack-dev-server` running, start the Rails server:

    $ bundle exec rails server

You'll want all three of these processes running for best performance when developing.

> General setup instructions copied from [pupilfirst](https://github.com/pupilfirst/pupilfirst/edit/master/docs/developers/docs/development_setup.md)
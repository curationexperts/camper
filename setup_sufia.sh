#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Make sure we know where we are
mkdir -p ~/examples && cd ~/examples

### Roughly follow the instructions in the Sufia README
# Generate base Rails install
rails new sufia-demo
cd sufia-demo

# Add gems to Gemfile$
sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/" Gemfile  # 'cause linux platforms need the rubyracer
sed -i "s/rubygems.org'/rubygems.org' \n\n gem 'sufia', '~> 6.0.0' \n gem 'kaminari', github: 'jcoyne\/kaminari', branch: 'sufia'/" Gemfile 
bundle install

# Run the sufia generator & database migrations
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails generate sufia:install -f
rake db:migrate

# Don't download the jetty zip file if there's one already on the system
if [ -f "../../master.zip" ] ; then
  cp ../../master.zip tmp
fi

# Run the jetty generators
rake jetty:clean
rake sufia:jetty:config

#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Make sure we know where we are
mkdir -p ~/examples && cd ~/examples

### Duplicate steps from tutorial
# Lesson: generate a rails application
rails new hydra-demo
cd hydra-demo/
sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/" Gemfile  # 'cause linux platforms need the rubyracer

# Lesson: add the Hydra dependencies
sed -i "s/rubygems.org'/rubygems.org'\n\ngem 'hydra', '9.0.0'/" Gemfile 
bundle install
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails generate hydra:install 2>&1

# Lesson: install hydra jetty
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381

# Don't download the jetty zip file if there's one already on the system
if [ -f "../../v8.1.1.zip" ] ; then
  cp ../../v8.1.1.zip tmp
fi

# Run the jetty generator
rails g hydra:jetty 2>&1
cp -f tmp/v8.1.1.zip ../  # save a copy of the jetty zip file in the user's home folder
rails g hydra:jetty





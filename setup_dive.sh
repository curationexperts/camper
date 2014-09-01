#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Make sure we know where we are
mkdir -p ~/install && cd ~/install

### Duplicate steps from tutorial
# Lesson: generate a rails application
rails new hydra-demo
cd hydra-demo/
sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/" Gemfile  # 'cause linux platforms need the rubyracer

# Lesson: add the Hydra dependencies
sed -i "s/rubygems.org'/rubygems.org'\n\ngem 'hydra', '7.1.0'/" Gemfile 
bundle install
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails generate hydra:install 2>&1

# Lesson: install hydra jetty
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails g hydra:jetty 2>&1
cp -f tmp/v7.0.0.zip ../..  # save a copy of the jetty zip file in the user's home folder

# Now clean up after ourselves
cd ..
rm -rf hydra-demo





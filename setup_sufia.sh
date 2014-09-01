#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Make sure we know where we are
mkdir -p ~/install && cd ~/install

### Roughly follow the instructions in the Sufia README
# Generate base Rails install
rails new my_app
cd my_app

# Add gems to Gemfile
sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/" Gemfile  # 'cause linux platforms need the rubyracer
sed -i "s/rubygems.org'/rubygems.org' \n gem 'sufia', '4.0.0' \n gem 'kaminari', github: 'harai\/kaminari', branch: 'route_prefix_prototype' \n/" Gemfile 
bundle install

# Run the sufia generator
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails generate sufia:install -f

# We've already got a copy of hydrajetty from Dive into Hydra, so everything we need should be downloaded

# Now clean up after ourselves
cd ..
rm -rf my_app
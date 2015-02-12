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
# sed -i "s/rubygems.org'/rubygems.org' \n gem 'sufia', '6.0.0.rc3' \n gem 'kaminari', github: 'harai\/kaminari', branch: 'route_prefix_prototype' \n/" Gemfile 
sed -i "s/rubygems.org'/rubygems.org' \n gem 'sufia', '6.0.0.rc3'/" Gemfile 
bundle install

# Run the sufia generator
spring stop  # just in case spring causes issues, see https://github.com/rails/rails/issues/13381
rails generate sufia:install -f

# Don't download the jetty zip file if there's one already on the system
if [ -f "../../v8.1.1.zip" ] ; then
  cp ../../v8.1.1.zip tmp
fi

# Run the jetty generators
rake jetty:clean
rake sufia:jetty:config

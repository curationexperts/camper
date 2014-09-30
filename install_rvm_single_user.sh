#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Turn off gem documentation install by default
echo 'gem: --no-document' > ~/.gemrc
 	
# Install RVM, Ruby, Rails
\curl -L get.rvm.io | bash -s stable 
echo 'RVM Installed'
echo
source ~/.rvm/scripts/rvm
echo 'Sourced environment'
echo
rvm install ruby-2.1.3 
echo 'ruby Installed'
echo
rvm --default use ruby-2.1.3
echo 'default ruby set'
echo
gem install rails -v 4.1.6
echo 'Rails Installed'
echo

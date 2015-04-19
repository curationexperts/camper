#!/usr/bin/env bash
set -e

if [ "$EUID" -eq "0" ] ; then
        echo "Script must be run the target (non-root) user" >&2
        exit 1
fi

# Turn off gem documentation install by default
echo 'gem: --no-document' > ~/.gemrc

# Install public key to authentictate rvm 
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
 	
# Install RVM, Ruby, Rails
\curl -sSL https://get.rvm.io | bash -s -- --version 1.26.10
echo 'RVM Installed'
echo
source ~/.rvm/scripts/rvm
echo 'Sourced environment'
echo
rvm install ruby-2.2.0 
echo 'ruby Installed'
echo
rvm --default use ruby-2.2.0
echo 'default ruby set'
echo
gem install rails -v 4.2
echo 'Rails Installed'
echo

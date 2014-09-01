#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

# The Vagrant shell provisioner runs as root,
# But we need to run the rvm installs as the normal vagrant user
sudo -u vagrant -i /vagrant/install_rvm_single_user.sh

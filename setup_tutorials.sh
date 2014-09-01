#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

# The Vagrant shell provisioner runs as root,
# But we need to run the demo setups as the normal vagrant user
sudo -u vagrant -i /vagrant/setup_dive.sh	# Load Gems for Dive Into Hydra
sudo -u vagrant -i /vagrant/setup_sufia.sh

# Tame your XML with OM uses a subset of gems already installed for Dive Into Hydra
# Tame your RDF with ActiveFedora uses a subset of gems already installed for Dive Into Hydra
# Access Controls with Hydra uses the gems (and code) already creaded in Dive Into Hydra

#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

# Package prerequisites
/vagrant/install_packages.sh

# RVM, ruby, rails
/vagrant/install_rvm.sh

# Java
/vagrant/install_java.sh

# Redis
/vagrant/install_redis.sh

# Imagemagick
/vagrant/install_imagemagick.sh

# FITS
/vagrant/install_fits.sh

# ffmpeg
/vagrant/install_ffmpeg.sh


#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

# Possible fix for 'Hash Sum Mismatch' errors on apt-get update
sudo rm -fR /var/lib/apt/lists/*   # or you can specifically delete the file related to the erroring package

# update ubuntu
apt-get update -y && apt-get upgrade -y

# install necessary and/or useful libraries
apt-get install -y \
  autoconf \
  automake \
  bison \
  build-essential \
  curl \
  expect \
  git \
  git-core \
  libapr1 \
  libaprutil1 \
  libc6-dev \
  libltdl-dev \
  libreadline6 \
  libreadline6-dev \
  libsqlite3-0 libsqlite3-dev \
  libssl-dev \
  libtool \
  libxml2-dev \
  libxslt-dev \
  libxslt1-dev \
  libyaml-dev \
  ncurses-dev \
  sqlite3 \
  unzip \
  yasm \
  zlib1g \
  zlib1g-dev


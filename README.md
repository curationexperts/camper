Hydra Camp Box
==============

Scripts to build a Vagrant based VM for running Hydra Camp tutorials.

The current versions included by this build script are:

* Ubuntu 12.04.05 - server install
* rvm 1.25.29
* ruby 2.1.2
* Rails 4.1.5
* Redis server version 2.2.12
* java version 1.7.0_65 
* ImageMagick 6.6.9-7
* FITS 0.6.2
* ffmpeg 2.3.3

How to use this repo
--------------------

### Option #1 ###
Just use the fully configured boxfile included as part of each release version in this repo.

    PENDING

### Option #2 ###
Clone this repo to your local system and run the setup scripts yourself

    git clone
    vagrant up
    
Now you have a fully configured VM running Ubuntu server along with all of the necessary softward to support a complete Hydra development environment.

* To access the VM: `vagrant ssh`
* To stop the VM: `vagrant halt`
* To restart the VM: `vagrant up`
* To erase the VM and start over: `vagrant destroy`

Learn more about Vagrant here: https://docs.vagrantup.com
Learn more about Hydra here: https://wiki.duraspace.org/display/hydra/The+Hydra+Project
And here: https://github.com/projecthydra/hydra/wiki/Dive-into-Hydra


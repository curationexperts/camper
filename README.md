Hydra Camp Box
==============

Scripts to build a Vagrant based VM for running Hydra Camp tutorials.

The current versions included by this build script are:

* Ubuntu 12.04.05 - server install
* rvm 1.25.29
* ruby 2.1.3
* Rails 4.1.6
* Redis server version 2.2.12
* java version 1.7.0_65 
* ImageMagick 6.6.9-7
* FITS 0.6.2
* ffmpeg 2.3.3

The build scripts also install the gems necessary to run the following tutorials in the default gemset for ruby-2.1.2:

* Dive into Hydra
    * Includes `gem "hydra", "7.1.0"` and dependencies
* Tame your XML with OM
	* uses `gem "om", "3.1.0"` and dependencies (same as Dive into Hydra)
* Tame your RDF with ActiveFedora
	* uses `gem "active-fedora", "7.1.0"` and dependencies (same as Dive into Hydra)
* Set up Sufia
    * Includes `gem "sufia", "4.0.0"` and dependencies
* Set up Worthwhile
	* Includes `gem "worthwhile", "0.0.3"` and dependencies

How to use this repo
--------------------

### Option #1 ###
Just use Vagrant to load the fully configured boxfile for the release version in this repo. Both Vagrant and VirtualBox need to be installed on your local system.  

    vagrant init hydracamp https://googledrive.com/host/0BytolfRBVL3raVdZdW1VdTU4cTA/hydracamp-rc1.box
	vagrant up

### Option #2 ###
Download a VirtualBox archive of the same VM. This method requires VirtualBox, but does not require vagrant to be installed on your local system.

    PENDING

### Option #3 ###
Clone this repo to your local system and run the setup scripts yourself.  Both Vagrant and VirtualBox need to be installed on your local system.  

    git clone https://github.com/mark-dce/camper.git
	cd camper
    vagrant up
    
Now you have a fully configured VM running Ubuntu server along with all of the necessary softward to support a complete Hydra development environment.

#### Notes ####
Option #3 depends on a much smaller base box, but needs to run a significant number of additional configuration scripts and downloads.  This option may be quicker to run for single installs, but downloading the file for option #1 or #2 will be quicker for classroom and demo installations where you need the system installed on multiple machines - download the file to one machine and then copy it locally via network shares or usb drives.

The fully configured VM used by options #1 and #2 is approximately 1.25GB, so either of these options may take a considerable amount of time to download depending on your connection speed. 


Running Vagrant & Learning Hydra
--------------------------------

* To start the VM: `vagrant up`
* To access the VM: `vagrant ssh`
* To stop the VM: `vagrant halt`
* To halt and restart the VM: `vagrant reload`
* To erase the VM and start over: `vagrant destroy`

Learn more about Vagrant here: https://docs.vagrantup.com  
Learn more about Hydra here: https://wiki.duraspace.org/display/hydra/The+Hydra+Project  
And here: https://github.com/projecthydra/hydra/wiki/Dive-into-Hydra  


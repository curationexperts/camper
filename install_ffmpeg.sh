#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

#check if we have the desired version installed
if ffmpeg -version 2>&1 | grep -q '^ffmpeg version 2\.3' ; then	
# we've got the right version, nothing else to do!!!
	echo "ffmpeg version x.y.z already installed"
	exit 0
else
# wrong version or no java installed 
	echo "Installing ffmpeg"
# try package update
	mkdir -p ~/install && cd ~/install
	wget -c http://ffmpeg.org/releases/ffmpeg-2.5.3.tar.bz2
	tar -vxjf ffmpeg-2.5.3.tar.bz2
	cd ffmpeg-2.5.3
	./configure
	make
	make install
	
	# now check that we have the desired version as default
	if ffmpeg -version 2>&1 | grep -q '^ffmpeg version 2\.5\.3' ; then		
	# Updated successfully
		echo "ffmpeg version 2.5.3 installed successfully"
		exit 0
	else
	# Couldn't update - delete whatever is there and install from scratch
		echo 'ffmpeg could not be installed'
		exit 1
	fi
fi
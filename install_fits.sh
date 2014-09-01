mkdir -p ~/install && cd ~/install
wget -c http://fits.googlecode.com/files/fits-0.6.2.zip
unzip fits-0.6.2.zip  
chmod a+x fits-0.6.2/fits.sh  
cp -r fits-0.6.2/* /usr/local/bin/
ln -sf /usr/local/bin/fits.sh /usr/local/bin/fits
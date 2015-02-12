mkdir -p ~/install && cd ~/install
wget -c http://projects.iq.harvard.edu/files/fits/files/fits-0.8.4_0.zip
unzip fits-0.8.4_0.zip 
chmod a+x fits-0.8.4/fits.sh  
cp -r fits-0.8.4/* /usr/local/bin/
ln -sf /usr/local/bin/fits.sh /usr/local/bin/fits
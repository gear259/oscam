#!/bin/sh
su root
apt-get install libpcsclite-dev 
apt-get -y install subversion dialog
svn co http://svn.speedbox.me/svn/oscam-install/trunk oscam
chmod -R 0755 oscam
cd oscam
./install.sh

# oscam

-------OSCAM AUTOSCRIPT------

su root & wget https://raw.githubusercontent.com/gear259/oscam/master/installoscam.sh && bash ./installoscam.sh

###############################################################
# Title:.......Automatic install/update OScam #
# Author:......Prilly #
# Support:.....prilly@speedbox.me | MultiCS & CSP Forum #
# Date:........06 September 2015 #
# Description:.Automaticaly install OScam and support scripts #
# Updates OScam to latest or specific version #
################################################################

Automatic install script for Multi instance OScam deployments
it will install 1 to 9 instances of OScam depending on selection


1. It will compile OScam from streamboard for HEAD or desired SVN version.
both for upgrade and new installations

2. Install script will also install FIRMWARE for HID omnikey usb readers
(if selected) this firmware is downloaded from HID global,
http://www.hidglobal.com/drivers it will also
setup dependencys for smartreader (smargo usb) (if selected)

3. Init.d startup script for sysv is also installed, this makes monitoring
and default startup of oscam upon restart of server easy, it also support
status of running oscam deamon (support for systemd is on its way)

4. propperly set up logging for each instances of oscam /var/log/oscam

5. propperly setting up config directory AND install optimized default
config to avoid oscam instances to use same ports /usr/local/etc

6. install maintances script (/usr/local/etc/oscam_chk_inst.sh)
that takes care of all instances of OScam, it will check if oscam is running,
if not it wil start it, it grep checks oscam logs for DEADLOCK error
(trylock and ins40) if found it will restart oscam. it checks if logging
directorys is propperly setup (to perform grep testing for deadlock error)
this is a very powerfull script that makes shure oscam is running at all times,
it also logs to /var/log/oscam/oscam(instance number)/oscam_restart.
log here you can check how healty oscam is for each instance and
if errors are found and handled. maintance script is run from a
cron entry in /etc/crontab

7. Easy check how ALL instances is doing on your system by running
this command: ( cd /usr/local/etc/ | ./oscam_chk_inst.sh )

8. Install script also contains a upgrade function to upgrade ALL
instances of oscam to desired OR HEAD version ALWAYS use this to
change version of the running oscam binary (ALL instances of oscam
is running same SVN version, its not possible to have different SVN
versoins of oscam for different instances)
WHEN RUNNING UPGRADE OPTION NO CONFIG FILES ARE TOUCHED,
THIS PRESERV USER CHANGES IN OSCAM

This script will give you a good starting point with configs
and a proper log solution.
crash check script will parse logs for errors and will restart
oscam if undesired messages are logged.

Info:
################################################################
OScam binary is placed here: /usr/local/bin/
OScam temp directory: /tmp/.oscam{INSTANCE Number}/
OScam PID is placed here: /var/run/oscam{INSTANCE Number}.pid
OScam log directory: /var/log/oscam/oscam{INSTANCE Number}/
OScam Config directory: /usr/local/etc/oscam{INSTANCE Number}/

OScam maintance script: /usr/local/etc/oscam_chk_inst.sh
OScam init.d {start|stop|restart|status} script: /etc/init.d/oscam{INSTANCE Number}/

URL: http://your-ip:888(1->9)
Login: root/root
################################################################

This values are recommended to change after you have logged in

This script works only with Debian / Ubuntu 32 and 64 bit,
in Ubuntu you need to have root user to be able to run it,
sudo is not good enough.

To start or stop OScam you can use this commands, or you can use the restart
inside OScam Webif:

/etc/init.d/oscam{INSTANCE Number} start
/etc/init.d/oscam{INSTANCE Number} stop
/etc/init.d/oscam{INSTANCE Number} restart
/etc/init.d/oscam{INSTANCE Number} status

To run this script you need to be root users:
#################################################################
Code:
su root
apt-get install libpcsclite-dev
apt-get -y install subversion
svn co http://svn.speedbox.me/svn/oscam-install/trunk oscam
chmod -R 0755 oscam
cd oscam
apt-get install dialog
./install.sh
#################################################################

IMPORTANT: SysV is now replaced with Systemd. use systemctl start|stop|restart oscam(1-9).service
Startup scripts are now stored here: /etc/systemd/system/


If you have used this script and want to update to a
later OR SPECIFIC svn version of oscam use update selection

This script will prompt you with a menu asking if you want to
update to latest svn version of oscam or if you want to update
to a specific version,
if you choose specific enter the svn version number and hit enter.

Script will then replace current OScam binary with new one
making a downtime less then 5 sec

Run this ONLY if you have used the install script provided here.

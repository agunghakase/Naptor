#!/bin/bash

#This script for installing raptor
. config

#You must be root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  echo "or sudo $0"
  exit 1
fi



echo -e "INSTALLING NAPTOR VERSION "$NAPTORVER


#check configurasi nagios
echo "Check Nagios avaibility"
#check libexec folder, check nagios config, check nagios status
#Check nagios location nagios.cfg, objects and libexec 
[ -f $NAGIOSDIR/main/etc/nagios.cfg ] || echo -e "No nagios installed in $NAGIOSDIR. \n\nInstallation Failed.\n"
[ -f $NAGIOSDIR/main/etc/nagios.cfg ] || exit 1
[ -d $NAGIOSDIR/main/libexec ] || echo -e "Libexec not Found, Nagios installation not correct. \n\nInstallation Failed.\n"
[ -d $NAGIOSDIR/main/libexec ] || exit 1
[ -d $NAGIOSDIR/main/etc/objects ] || echo -e "Objects not Found, Nagios installation not correct. \n\nInstallation Failed.\n"
[ -d $NAGIOSDIR/main/etc/objects ] || exit 1



echo "Installing nagios agent..."
#copy file libexe ke nagios
cp libexec/* $NAGIOSLIB
#permission
chmod 755 $NAGIOSLIB/check_naptor $NAGIOSLIB/config $NAGIOSLIB/scan
chown nagios:nagios $NAGIOSLIB/check_naptor $NAGIOSLIB/scan $NAGIOSLIB/config


echo "Nagios Configuration"
#create dir naptorcfg
mkdir $NAPTORCFG
#copy file naptorcfg ke cfg
cp naptorcfg/* $NAPTORCFG
chown nagios:nagios $NAPTORCFG -R

echo "Creating logging files"
#create dir for log
mkdir $NAPTORLOG

#check nagios last config for re-installation
#if theres any naptor configuration string
cfgdir="cfg_dir=/opt/nagios/main/etc/naptorcfg"
cfgdir2="cfg_dir=\/opt\/nagios\/main\/etc\/naptorcfg"
#---------------------------------------------------
#Malfunction
sed -i -e 's/$cfgdir2/ /g' $NAGIOSCFG 
#----------------------------------------------------

#Add cfgdir Nagios Config at last line
echo $cfgdir >> $NAGIOSCFG

#create naptor to bin
echo ". "$NAPTORPATH"naptor.sh" > "/usr/bin/naptor"
chmod 755 /usr/bin/naptor
echo -e "Installation completed!"


#!/bin/bash

echo "Read the configuration Files..."
#Check root atau bukan

#Load config
. config

#check configurasi nagios
#check libexec folder, check nagios config, check nagios status


#This script for installing raptor
. config
echo "Removing nagios agent..."
rm $NAGIOSLIB/check_naptor $NAGIOSLIB/config $NAGIOSLIB/scan

echo "Removing Configuration"
#removing dir naptorcfg
rm $NAPTORCFG -rf

rm $NAPTORLOG -rf

#check nagios last config for re-installation
#if theres any naptor configuration string

#cfgdir="cfg_dir=\/opt\/nagios\/main\/etc\/naptorcfg"
#---------------------------------------------------
#Malfunction
sed -i -e 's/cfg_dir=\/opt\/nagios\/main\/etc\/naptorcfg//g' $NAGIOSCFG
#----------------------------------------------------

#Removing naptor on bin
rm /usr/bin/naptor

#Add cfgdir Nagios Config at last line
#echo $cfgdir >> $NAGIOSCFG
#restart Nagios
$NAGIOSEXEC restart

echo "Uninstalling Naptor done"


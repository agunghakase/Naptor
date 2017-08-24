#!/bin/bash

# NAPTOR IS NAGIOS APPLICATION MONITOR #
# Naptor used to monitoring your application backend state, if you want debug or checking process after implementation you can build using this application
# If you using NAPTOR make sure you have installed nagios first.
# Naptor @ August 2017

#load file config

. config

shelp=0;
helpusage(){

echo -e "USAGE    : ./naptor.sh [arguments]"
echo -e "SAMPLE   : ./naptor.sh -a \"Appname\" -i \"Downloading Start...\" -s 0"
echo -e "ARGUMENTS: "
echo -e "           -a   \"Application Name\"                      | Without space/symbols"
echo -e "           -i   \"Information state\"                     | Must be Character/Strings"
echo -e "           -s   [stateid]                               | stateid: 0=OK, 1=Warning, 2=Critical "
echo -e "           -u   \"Username\"                              | User execute your Application [optional]"
echo -e "           -h   Help documentation                      | Usage Manual [optional]"
echo "";
}

#check arguments
while getopts i:h:a:s: option
do
 case "${option}"
 in
 i) sinfo=${OPTARG};;
 h) shelp=1;;
 a) napp=${OPTARG};;
 s) stid=${OPTARG};;

 esac
done

#------------------------------------------------------------
#If the Requirements isnt Meet
if [ -z "$napp" ];then   #Application Name Must be Set
  echo "";
  echo "You must specify application name using -a \"Applicationname\""
  echo ""
  helpusage
  exit 1
fi
if [ -z "$sinfo" ];then #Information State must be Set
  echo "";
  echo "You must specify information state using -i \"Information State\""
  echo "";
  helpusage
  exit 1
fi
if [ -z "$stid" ];then  #State ID must be Set
  echo "";
  echo "You must specify state id using -s [stateid]"
  echo ""
  helpusage
  exit 1
fi

#--------------------------------------------------------------

#-------------------------------------------------------------
#OPEN MANUALS
if [ $shelp -eq 1 ] ;then
  helpusage
  exit 0
fi
#-------------------------------------------------------------


#---------------------------------------------------------------
#Write to logs
#File logs
flog="$NAPTORLOG"$napp".log"

#Timestamp Epoch
stime=`date +%s`

#create log all
logall="logdate=$stime;"              #Number
logall=$logall"logapp=\"$napp\";"     #String
logall=$logall"logstate=$stid;"       #Integer
logall=$logall"loginfo=\"$sinfo\";"   #String

#Creating File
echo $logall >> $flog


#Checking if theres new file log recreate service restart nagios
. $NAPTORPATH/scan



exit 0







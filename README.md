# Naptor
Naptor is Nagios Application Monitor, for help you monitoring your backend application anytime.




***HOW TO INSTALL NAPTOR APPLICATION

1. You must installed Nagios core first.
2. After installing nagios, extract the naptor file and then edit the config files. 

   #Nagios Path
   NAGIOSDIR=/opt/nagios/                  <---- change to your nagios dir

   #TESTED USING UBUNTU NAGIOS
   NAGIOSEXEC=/etc/init.d/nagios           <---- Change to your nagios exec
   
   to make sure your nagios exec run normaly, using terminal and type:
    /etc/init.d/nagios status

   if nagios status is started, then you can start to install.
   if not, start nagios daemon first.
   /etc/init.d/nagios start

3. After your configuration without problem, you can execute with root previledge 
   - Change file permission first
   chmod 755 naptor.sh scan config clean.sh
   - Installing application
   ./install.sh

   - For uninstalling application
   ./clean.sh


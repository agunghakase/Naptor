# Naptor
Naptor is Nagios Application Monitor, for help you monitoring your backend application process. You can use this application only on same server (your application and nagios server must be in same server). To remote monitoring under developing.

You can embed naptor to your application at folder class, after installing you add class, like (php, c, c++, etc) still need help to develop.




# HOW TO INSTALL NAPTOR APPLICATION

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

# HOW TO USE
1. Using Terminal/Console, you can point your application to exec naptor

   naptor -a "AppName" -i "Info state" -s [stateid]
   
   naptor -a "Firefox" -i "Updating patch 20/250 - 9%" -s 0
   
   a : application name
   
   i : your application information state
   
   s : state id (Nagios state id 0: ok, 1: Warning, 2: Critical)
   
You can define as you like.



2. Using class inside class folder, for example when using php:

- require_once("class.naptor.php");


- $naptor = new phpnaptor();

- $naptor->start("Rezero"); //add new service application name

- $naptor->write(0, "Rezero begin to extracting files 1002235/82931874 ");  //state id =0 and information state



- $naptor->write(2, "Rezero autocrawling fail "); 





 After you add naptor to your application, you can check via web to monitoring your application state

 Using browser  http://localhost/nagiosmain/  and then select Services in left menu.
   
 New application service will be added at your nagios service list.


   
   

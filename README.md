Deployment Scripts Manual
RUMA OACM, Polling, and OG

Written by Ace for Flipbox, 11 April 2016
ace@flipbox.co.id

------------------------------

NOTICE & DISCLAIMER:
I REQUIRE you to read these scripts throughly to get what it would do to your server. You might need to modify these scripts, so make sure you know what you do.
Eventhough I'm very sure that you know your job, I HIGHLY suggest to test these scripts on a testing VM first.
As you already know what will happen, I, Flipbox, and every people on this world WOULD NOT be responsible for any defective impact happened by executing these scripts. DO AT YOUR OWN RISK. Even so, you are allowed to contact me regarding any more information about these scripts.

What these scripts do:
- Installing required applications and modules to your server, such as Apache, MySQL, PHP, Git, etc.
- Configuring Apache & MySQL so that your user could easily access your awesome applications
- Rollback scenario by uninstalling/deleting installed application

What these scripts DON'T do:
- Creating VM and SSH access on it
- Configuring your DNS records
- Installing any malware or backdoor to your server
- Wiping out your server
- Making a sandwich or a cup of coffee
- Triggering World War III or ressurecting Adolf Hitler

----

PRE-STEP:
- Prepare 1 (virtual) server with public IP address
- Install Ubuntu 14.04 on it (preferably server version)
- Install & configure OpenSSH server on it. Don't forget the credential or you might have a bad dream
- Configure your DNS to have these 3 following subdomain records directing to VM public IP address: awesomewebapp.domain

HOW TO INSTALL:
- Open file "1-instalasi.sh". Edit "rootpass" variable as your soon-to-be MySQL root password. Save.
- (Optional) If you want to clone another branch, open file "2-instal webapp.sh". Change "appbranch" value as described on it. Also, save.
- Eventhough the file name is self-explanatory enough or in case you are unable to count numbers, here is the order to run the script:
	- 1-instalasi.sh -> for installing and configuring required platforms and modules
	- 2-instal webapp.sh -> cloning latest version of awesomewebapp to your web directory, setting up Apache, creating MySQL credential as needed, etc.
- Run the file with root access by typing "sudo /path/to/Deployment\ Scripts/directory/scriptname.sh"

HOW TO ROLLBACK:
- Rollback applications: run "sudo /path/to/Deployment\ Scripts/directory/4-rollback webapp.sh"
- Rollback installations: run "sudo /path/to/Deployment\ Scripts/directory/3-rollback.sh"

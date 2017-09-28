Deployment Scripts Manual for NodeJS on Ubuntu Xenial

Written by Aqid for [Flipbox](http://flipbox.co.id/) - 2017

Manual modified from Ace

------------------------------

**NOTICE & DISCLAIMER:**

I REQUIRE you to read these scripts throughly to get what it would do to your server. You might need to modify these scripts, so make sure you know what you do.
Eventhough I'm very sure that you know your job, I HIGHLY suggest to test these scripts on a testing VM first.
As you already know what will happen, I, Flipbox, and every people on this world WOULD NOT be responsible for any defective impact happened by executing these scripts. DO AT YOUR OWN RISK. Even so, you are allowed to contact me regarding any more information about these scripts.

**What these scripts do:**

- Installing required applications and modules to your nodejs application such as mongodb, node package manager, latest npm, forever and pm2 process manager

**What these scripts WON'T do:**

- Creating your initial server ( Apache, Nginx, FTPD, etc. I strongly suggest that you use [this script](https://github.com/lj2007331/lnmp) or other 3rd party provider )
- Configuring your DNS records
- Installing any malware or backdoor to your server
- Wiping out your server
- Making a sandwich or a cup of coffee
- Triggering World War III or ressurecting Adolf Hitler

----

**HOW TO INSTALL:**

- Open file "1-instalasi.sh". Edit "rootpass" variable as your soon-to-be MySQL root password. Save.
- (Optional) If you want to clone another branch, open file "2-instal webapp.sh". Change "appbranch" value as described on it. Also, save.
- Eventhough the file name is self-explanatory enough or in case you are unable to count numbers, here is the order to run the script:
	- 1-instalasi.sh -> for installing and configuring required platforms and modules
	- 2-instal webapp.sh -> cloning latest version of awesomewebapp to your web directory, setting up Apache, creating MySQL credential as needed, etc.
- Run the file with root access by typing "sudo /path/to/Deployment\ Scripts/directory/scriptname.sh"
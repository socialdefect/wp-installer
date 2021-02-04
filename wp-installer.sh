!#/bin/bash

### Dependencies
# wp-cli installed system-wide as wp and added to $PATH variable
# PHP7.2+
# MYSQL of MariaDB
# Site database
# Database user

### Please fill out all the variables below or in the config file
### Should be self explanotory

### DB variables
DB_NAME=''
DB_USER=''
DB_PASS=''
DB_HOST='localhost'
DB_PREFIX='wp_'

### Site variables
SITE_URL='https://mysite.com'
SITE_TITLE='My Wordpress Site'
ADMIN=''
ADMIN_PASS=''
ADMIN_EMAIL='info@mysite.com'
WP_LANG='en_US'

### Filesystem variables
WEBROOT="/var/www/html"
FS_USER="www-data"

## Clear screen
clear


### Checking for PHP
which php
if [ $? = 0 ]; then
	echo "Found: `php --version`"
else
	echo 'Could not find php on this system'
	echo 'Please install it before running this script again..'
	exit 1
fi

### Check for wp-cli and install when needed
echo 'Checking if wp-cli is installed on this system...'
if [ $? = 0 ]; then
		echo "Found `wp --version`"
		wp --info
else
		echo 'This script could not detect a wp-cli install'
		echo 'Make sure you named it wp and its accessable system-wide'
		echo
		echo 'Press [CTRL]+[C] to Quit and install wp-cli manually'
		echo 'Or wait 10 sec for the script to attempt an automated install..'
		echo 'The script will require wget to be installed and your user must have sudo permissions!'
		sleep 10
		clear
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
		if [ $? = 0 ]; then
			chmod +x wp-cli.phar
			sudo mv wp-cli.phar /usr/local/bin/wp
			if [ `which wp` != '/usr/local/bin/wp' ]; then
				echo 'Failed to install wp-cli system-wide'
				echo 'Please try a manual install as explained in the README'
				exit 1
			else
				echo 'WP-CLI has been installed successfuly..'
			fi
			echo 'Installing wp bash completion...'
			wget https://github.com/wp-cli/wp-cli/raw/master/utils/wp-completion.bash
			mv wp-completion.bash ~/.wp-completion.bash
			if [ $? = 0 ]; then
				echo '. ~/.wp-completion.bash' >> ~/.bashrc
				echo 'Successfuly installed wp-cli bash completion'
				wp --version
				wp --info
				sleep 3
			fi
		else
			echo 'Failed to download wp-cli. Cannot continue...'
			exit 1
		fi

fi
clear

### Check for config file and source it if it exists
if [ -f /etc/wp-installer.conf ]; then
	echo 'Found configuration file.'
	echo 'Importing settings from config file...'
	. /etc/wp-installer.conf
else
	if [ -f ~/wp-installer.conf ]; then
		echo 'Found configuration file in user home.'
		echo 'Importing settings from config file...'
		. ~/wp-installer.conf
	else
		echo 'No config file was found!'
		echo  'Using setting from the main script...'
	fi
fi


### Setup Warning
echo && echo 'DONT FORGET TO FILL OUT ALL REQUIRED VARIABLES IN THE CONFIG FILE!!!' && echo
sleep 2
echo 'Wordpress will be installed in this directory:'
echo "   $WEBROOT"
echo
echo 'Install starts in 5 seconds...'
echo
echo 'Press [CTRL]+[C] to Quit' && echo
sleep 5

### Change working directory to $WEBROOT
cd "$WEBROOT"

### Set up the wp core in current directory
echo && echo 'WP core word gedownload...' && echo
sudo -u "$FS_USER" wp core download

### Create wp-config.php
sudo -u "$FS_USER" wp core config --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --dbprefix="DB_PREFIX"

### Install wp database
sudo -u "$FS_USER" wp core install --url="$SITE_URL" --title="$SITE_TITLE" --admin_user="$ADMIN" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_EMAIL"

### set Language
echo && echo "Installing language pack $WP_LANG"  && echo
sudo -u "$FS_USER" wp language core install "$WP_LANG"
sudo -u "$FS_USER" wp language core activate "$WP_LANG"

## Install plugins
echo && echo 'Installing and activating plugins and theme...' && echo

sudo -u "$FS_USER" wp plugin install --activate $PLUGINS
sudo -u "$FS_USER" wp theme install --activate "$THEME"


echo && echo 'Wordpress installation finished!'
echo "Visit your site at $SITE_URL" && echo

exit $?

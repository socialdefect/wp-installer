To be able to use this script you will need the following dependencies:
PHP at least version 7.2
MYSQL of MariaDB
wp-cli
wget *optional. Only used for installing wp-cli when its not present

Install WP-CLI:
1) Download: https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
2) Open terminal and navigate to the download folder
3) Make wp-cli executable: chmod +x wp-cli.phar
4) Cpoy to local bin folder: sudo mv wp-cli.phar /usr/local/bin/wp  (requires root access)

Install WP-CLI Bash completion (Optional):
1) Download: https://github.com/wp-cli/wp-cli/raw/master/utils/wp-completion.bash
2) Place the file in your HOME directory
3) Add the following line to your .bashrc file ( the . is not a typo)
    . $HOME/wp-completion.bash
4) Check wp-cli installation by executing "wp --info"

Now you can run the wp command from any directory

Install wp-installer system-wide:
1) open terminal in the dir that contains the script
2) Make the script executable: chmod +x wp-installer.sh
3) Copy to local bin folder: sudo mv wp-installer.sh /usr/local/bin/wp-installer  (root access required)

Now you can run the wp-installer command from any directory



Run the script:
0) Create a database user and a fresh database for the installation
1) Open /usr/local/bin/wp-installer in a text editor
2) Fill out all required variables in the config file and place it under /etc or in your home directory
3) execute: wp-installer (it might ask you for your root passwd when installing under a different user)

Be sure to fill out all variables as all are required for the script to finish without errors.
Its a dumb script for now. I might add error handeling later on...


When you are working on a local site it might be smart to redirect your hostname to the local site.
1) Open /etc/hosts in a text editor
2) Add an entry for your site. The first part is the local server IP address, the second part the domain name.
        (Example)
        127.0.0.1   mysite.com

This way its like working on a live website so theres way less changes to be made when uploading to your webhost.
If you need to access your live site during development you can disable the redirect by placing a # in front of the line.

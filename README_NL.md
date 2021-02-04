Om het script te kunnen gebruiken heb je een Mac of Linux PC nodig met de volgende software:
PHP minstens versie 7.2
MYSQL of MariaDB
wp-cli


WP-CLI Installeren:
1) Download: https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
2) Open terminal in de map van de download
3) Voer dit commando uit om uitvoerbaar te maken: chmod +x wp-cli.phar
4) Kopieer naar de executables map: sudo mv wp-cli.phar /usr/local/bin/wp  (heeft admin wachtwoord nodig)

WP-CLI Bash completion Installeren (Optioneel):
1) Download: https://github.com/wp-cli/wp-cli/raw/master/utils/wp-completion.bash
2) Plaats het bestand in je HOME directory
3) Voeg de volgende regel toe aan je .bashrc bestand
    source $HOME/wp-completion.bash
4) Check of wp-cli werkt door in de terminal "wp --info" uit te voeren

Vervolgens is wp-cli als commando beschikbaar op je systeem (wp)

wp-installer script installeren naar executables map:
1) open terminal in de map met het script
2) Voer uit om uitvoerbaarte maken: chmod +x wp-installer.sh
3) Kopieer naar systeem map: sudo mv wp-installer.sh /usr/local/bin/wp-installer  (heeft admin wachtwoord nodig)

Vanaf nu kan je het wp commando en het install script (wp-installeruitvoeren vanuit elke map op je systeem.



Script uitvoeren:
0) Maak een database en database gebruiker aan voor de installatie
1) Open /usr/local/bin/wp-installer in een tekst editor
2) Vul de waarden van de variabelen in bovenaan het script
3) sla het script op
4) Open een terminal en cd naar de map waar je wordpress wil installeren
5) Voer het script uit: wp-installer (waar nodig word een admin wachtwoord gevraagd)

Zorg dat alle variabelen goed zijn ingevuld dan zal het script binnen een paar minuten klaar zijn want  
het is geen slim script dus als er een var leeg of fout is kan je alles opnieuw doen.


Als je de site wil gebruiken om lokaal te werken moet je ook nog je /etc/hosts bestand aanpassen.
1) Open /etc/hosts in een tekst editor
2) Maak een verwijzing beginnend met het lokale ip van de server, dan een spatie of tab en de hostnaam die je wil gebruiken.
        (Voorbeeld)
        192.168.1.5   dev.mysite.com

Als je op deze manier werkt kan de site direct worden geupload naar je live domein zonder de config en database 
aanpassingen te doen en ook heb je zo meteen alle juiste URL's op de site.

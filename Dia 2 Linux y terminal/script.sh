#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y

sudo cp index.html /var/www/html

sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

sudo systemctl restart apache2
sudo systemctl status apache2


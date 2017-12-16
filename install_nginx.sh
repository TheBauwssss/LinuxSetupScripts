#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied! Updating apt..."
	apt update
fi

echo "Instaling NGinx with PHP 7..."

#nginx with php setup
apt remove apache2 -y
apt install nginx php7.0-cli php7.0-cgi php7.0-fpm -y
ufw allow 'Nginx HTTP'
ufw allow 'Nginx HTTPS'
ufw reload
#!/bin/bash

#Uninstall unused crap, LET OP: packages worden niet correct verwijders, deze commandos handmatig uitvoeren!
apt purge --auto-remove apache2* -y
apt purge --auto-remove postfix -y
apt purge --auto-remove rsyslog -y

apt update
apt upgrade -y
apt install software-properties-common htop locate nano unzip zip screen tree git ncdu -y

add-apt-repository ppa:fish-shell/release-2
apt update
apt install fish -y

apt install nginx php7.0-cli php7.0-cgi php7.0-fpm -y

#Change default shell
chsh -s $(which fish)

#Execute the below line manually in fish!
#set -g fish_prompt_pwd_dir_length 0

#PHP v7.2 (nginx):

#Uninstall old nginx + php from above
apt purge --auto-remove nginx php7.0-cli php7.0-cgi php7.0-fpm -y

#Add repo, key and update sources
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
add-apt-repository ppa:ondrej/php
#apt-add-repository ppa:ondrej/nginx-mainline
apt update
apt upgrade -y

#Install new php version
apt install nginx php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline -y
apt install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-intl php7.2-sqlite3 -y

#LET OP: deze fix doorvoeren om shutdown te fixen:
https://askubuntu.com/a/879430
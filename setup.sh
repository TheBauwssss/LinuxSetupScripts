#!/bin/bash

echo "Roderick's Linux Setup Script"
#Edited 16-12-2017 23:12

echo "Updating apt..."
apt update

echo "Upgrading packages..."
apt upgrade -y

chmod +x install_essentials
chmod +x install_fish.sh
chmod +x install_firewall.sh
chmod +x install_nginx.sh

#Call subscripts, parameter disables 'apt update' command from running with each subscript
./install_essentials.sh no
./install_fish.sh no
./install_firewall.sh no
./install_nginx.sh no

echo "Updating database for locate..."
updatedb

echo ""
echo "################################################"
echo "# Setup complete, please log out and back in   #"
echo "# to complete the installation process!        #"
echo "################################################"
echo ""
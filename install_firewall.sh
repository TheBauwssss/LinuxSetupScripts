#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied! Updating apt..."
	apt update
fi

echo "Instaling firewall..."

#firewall setup
apt install ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

echo "Installing Fail2Ban..."
apt install fail2ban -y
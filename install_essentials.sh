#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied! Updating apt..."
	apt update
fi

echo "Installing essentials..."

apt install htop locate nano unzip zip screen tree git curl ncdu -y

echo ""
echo "Enabling ssh root login with password..."

echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config
echo "PasswordAuthentication yes" | tee -a /etc/ssh/sshd_config

service sshd restart
service ssh restart
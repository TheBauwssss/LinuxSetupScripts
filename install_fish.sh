#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied! Updating apt..."
	apt update
fi

echo "Instaling Fish, related tools and configs..."

apt install fish python3-dev python3-pip -y

#Install thefuck
pip3 install thefuck

#Set fish as default shell
chsh -s $(which fish)

#Create fish config file
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish

#Enable fuck
echo "thefuck --alias | source" | tee -a ~/.config/fish/config.fish

#Make fish always give the full path, for older versions
echo "set -U fish_prompt_pwd_dir_length 0" | tee -a ~/.config/fish/config.fish

#Make fish show full paths in newer versions
mkdir -p ~/.config/fish/functions

cp fish_config/fish_title.fish ~/.config/fish/functions/fish_title.fish
cp fish_config/prompt_pwd.fish ~/.config/fish/functions/prompt_pwd.fish 
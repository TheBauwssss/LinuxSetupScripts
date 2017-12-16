#!/bin/bash

echo "Instaling Fish, related tools and configs..."

apt update

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


touch ~/.config/fish/functions/fish_title.fish

echo "function fish_title
    hostname
    echo ' - ' $_
end" | tee ~/.config/fish/functions/fish_title.fish



touch ~/.config/fish/functions/prompt_pwd.fish

echo "function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
    if test  \"$PWD\" != \"$HOME\"
        printf \"%s\" (echo $PWD|sed -e 's|/private||' -e \"s|^$HOME|~|\")
    else
        echo '~'
    end
end" | tee ~/.config/fish/functions/prompt_pwd.fish 
#!/bin/bash
#Asking for initsetup.sh
read -r -p "Do you want to run initial setup first? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    bash initsetup.sh
fi
#Set Var
user="$(whoami)"
current_path=$(pwd)

#Removing original hyperland config and creating symlink to new
rm /home/$user/.config/hypr/hyprland.conf
ln -s $current_path/hypr/hyprland.conf /home/$user/.config/hypr/hyprland.conf

echo "Install Complete"

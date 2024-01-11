#!/bin/bash

#Set Var
user="$(whoami)"
current_path=$(pwd)
hypr_config_location=$(/home/$user/.config/hypr)
echo $hypr_config_location
#Asking for initsetup.sh#
read -r -p "Do you want to run initial setup first? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bash initsetup.sh
fi

#Create Scripts Folder
mkdir /home/$user/.config/hypr/scripts

#Removing original hyperland config and creating symlink to new
rm /home/$user/.config/hypr/hyprland.conf
ln -s $current_path/hypr/hyprland.conf /home/$user/.config/hypr/hyprland.conf

#setting Wallpaper
mkdir /home/$user/.config/hypr/wallpaper
cp $current_path/wallpapers/evening-landscape.jpg /home/$user/.config/hypr/wallpaper
ln -s $current_path/scripts/wallpaper.sh /home/$user/.config/hypr/scripts/wallpaper.sh

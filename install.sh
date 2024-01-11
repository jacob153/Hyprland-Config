#!/bin/bash

#Set Var
user="$(whoami)"
current_path=$(pwd)
hypr_config_location=$(/home/$user/.config/hypr)

#Asking for initsetup.sh#
read -r -p "Do you want to run initial setup first? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bash inisetup.sh
fi

#Create Scripts Folder
mkdir hypr_config_location/scripts

#Removing original hyperland config and creating symlink to new
rm hypr_config_location/hyprland.conf
ln -s $current_path/hypr/hyprland.conf hypr_config_location/hyprland.conf

#setting Wallpaper
mkdir $hypr_config_location/wallpaper
cp $current_path/wallpapers/evening-landscape.jpg $hypr_config_location/wallpaper
ln -s $current_path/scripts/wallpaper.sh hypr_config_location/scripts/wallpaper.sh

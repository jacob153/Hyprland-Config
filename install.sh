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

#Create Scripts Folder
mkdir /home/$user/hypr/scripts

#Removing original hyperland config and creating symlink to new
rm /home/$user/.config/hypr/hyprland.conf
ln -s $current_path/hypr/hyprland.conf /home/$user/.config/hypr/hyprland.conf

#setting Wallpaper
mkdir /home/$user/.config/hypr/wallpaper
cp $current_path/wallpapers/evening-landscape.jpg /home/$user/hypr/wallpaper
ln -s $current_path/scripts/wallpaper.sh /home/$user/hypr/scripts/wallpaper.sh

echo "Install Complete"

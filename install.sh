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

rm -r /home/$user/.config/hypr
cp -r $current_path/hypr /home/$user/.config/hypr

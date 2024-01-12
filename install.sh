#!/bin/bash

#Set Var
user="$(whoami)"
current_path=$(pwd)
hypr_config_location=$(/home/$user/.config/hypr)
echo $hypr_config_location
#Asking for initsetup.sh#
read -r -p "Do you want to run initial setup first? If unsure, assume yes. [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bash scripts/initsetup.sh #running initial setup script
fi

#remove default configs and copy in new
rm -r /home/$user/.config/hypr

#cp -r $current_path/hypr /home/$user/.config/hypr
rsync -av --progress $current_path/hypr /home/$user/.config --exclude hyprpaper.conf

#wallpaper config generation
echo "preload = /home/$user/.config/hypr/wallpapers/1.jpg" >> /home/$user/.config/hypr/hyprpaper.conf
echo "wallpaper on every monitor, trying set to:" $1
IFS=$'\n'
for l in $(hyprctl monitors | grep "Monitor")
do
    TMP=${l##*Monitor }
    TMP=${TMP%% (*}
    echo "set for" $TMP
    echo "wallpaper = $TMP,/home/$user/.config/hypr/wallpapers/1.jpg" >> /home/$user/.config/hypr/hyprpaper.conf
done
echo "splash = true" >> /home/$user/.config/hyprpaper.conf
echo "ipc = off" >> /home/$user/.config/hyprpaper.conf

#Enable LY
read -r -p "Is ly already enabled? [y/N] " response2
if [[ "$response2" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Skipping enable daemon"
else
	sudo systemctl enable --now ly
fi

echo "Install complete. You may need to logout or reboot for configuration to take full effect.gu"

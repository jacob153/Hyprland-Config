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
else
    sudo pacman -Syyu --noconfirm
fi

#remove default configs and copy in new
rm -r /home/$user/.config/hypr

#cp -r $current_path/hypr /home/$user/.config/hypr
rsync -av --progress $current_path/hypr /home/$user/.config --exclude hyprpaper.conf

#wallpaper config generation
echo "preload = /home/$user/.config/hypr/wallpapers/1.png" >> /home/$user/.config/hypr/hyprpaper.conf
echo "wallpaper on every monitor, trying set to:" $1
IFS=$'\n'
for l in $(hyprctl monitors | grep "Monitor")
do
    TMP=${l##*Monitor }
    TMP=${TMP%% (*}
    echo "set for" $TMP
    echo "wallpaper = $TMP,/home/$user/.config/hypr/wallpapers/1.png" >> /home/$user/.config/hypr/hyprpaper.conf
done
echo "splash = true" >> /home/$user/.config/hyprpaper.conf
echo "ipc = off" >> /home/$user/.config/hyprpaper.conf

#copy gtk theme by Fausto-Korpsvart
echo "Copying gtk theme and applying"
sudo cp -r $current_path/gtk/gtk-2.0 /usr/share/themes/Gruvbox-Dark
sudo cp -r $current_path/gtk/gtk-3.0 /usr/share/themes/Gruvbox-Dark
sudo cp -r $current_path/gtk/gtk-4.0 /usr/share/themes/Gruvbox-Dark
sudo cp $current_path/gtk/index.theme /usr/share/themes/Gruvbox-Dark
#applly gtk theme by 
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Dark'

#Copy and apply icons by jmattheis
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk ~/.icons/gruvbox-dark-icons-gtk
gsettings set org.gnome.desktop.interface icon-theme 'gruvbox-dark-icons-gtk'

#Copy waybar theme
cp -r waybar /home/$user/.config

#creating restart-hyprpaper command
sudo cp $current_path/scripts/restart-hyprpaper /usr/bin
sudo chmod +x /usr/bin/restart-hyprpaper

#restarting hyprpaper
restart-hyprpaper

#Enable LY
read -r -p "Is ly already enabled? [y/N] " response2
if [[ "$response2" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Skipping enable daemon"
else
	sudo systemctl enable --now ly
fi

echo "Install complete. You may need to logout or reboot for configuration to take full effect.gu"

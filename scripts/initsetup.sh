#!/bin/bash

#Asking if hyperland is already installed before attempting configuration
read -r -p "Do you need hyperland and ly installed? [y/N] " response
read -r -p "Is this a laptop with bluetooth? [y/N] " response2
read -r -p "Do you want to install discord-screenaudio application? This will allow screensharing. [y/N] " response3
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	pkgs=(hyprland polkit nano kitty rofi thunar nwg-dock-hyprland-bin brightnessctl pavucontrol playerctl ly rsync waybar wlogout otf-font-awesome jsoncpp-doc hyprpaper xdg-desktop-portal xdg-desktop-portal-hyprland pipewire wireplumber xwaylandvideobridge-bin cliphist librewolf-bin)
else
    pkgs=(rsync waybar wlogout nano kitty rofi thunar nwg-dock-hyprland-bin otf-font-awesome jsoncpp-doc hyprpaper xdg-desktop-portal xdg-desktop-portal-hyprland pipewire wireplumber xwaylandvideobridge-bin brightnessctl pavucontrol playerctl cliphist librewolf-bin)
fi

#Set Var
user="$(whoami)"
current_path=$(pwd)

##general system update
sudo pacman -Syyu --noconfirm

#Create aur dir
mkdir /home/$user/aur
cd /home/$user/aur

#install git
sudo pacman -S --needed base-devel git --noconfirm

#install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

#Installing Packages
if [[ "$response2" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    ysy -S bluez --noconfirm
    sudo systemctl enable bluetooth
    sudo systemctl start bluetooth
fi
yay -S "${pkgs[@]}"  --noconfirm

if [[ "$response3" =~ ^([yY][eE][sS]|[yY])$ ]]
    yay -S discord-screenaudio
then

#reinstalling fontconfig to correct font-awesome from being set as system default
yay -S fontconfig --noconfirm

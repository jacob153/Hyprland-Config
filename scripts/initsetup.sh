#!/bin/bash

#Asking if hyperland is already installed before attempting configuration
read -r -p "Do you need hyperland and ly installed? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	pkgs=(hyprland polkit brightnessctl pavucontrol playerctl ly rsync wee-wayland otf-font-awesome jsoncpp-doc hyprpaper xdg-desktop-portal xdg-desktop-portal-hyprland pipewire wireplumber xwaylandvideobridge-bin)
else
    pkgs=(rsync eww-wayland otf-font-awesome jsoncpp-doc hyprpaper xdg-desktop-portal xdg-desktop-portal-hyprland pipewire wireplumber xwaylandvideobridge-bin brightnessctl pavucontrol playerctl)
fi

#Set Var
user="$(whoami)"
current_path=$(pwd)

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
yay -S "${pkgs[@]}"  --noconfirm

read -r -p "Do you want to install discord-screenaudio application? This will allow screensharing. [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    yay -S discord-screenaudio
then

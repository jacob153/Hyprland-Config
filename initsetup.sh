#!/bin/bash

#Set Var
user="$(whoami)"
current_path=$(pwd)
pkgs=(waybar otf-font-awesome jsoncpp-doc)

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

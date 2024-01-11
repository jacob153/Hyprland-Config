#!/bin/bash

#Set Var
user="$(whoami)"
current_path=$(pwd)

# This is so if another wallpaper is active this kills it before running
killall swaybg

# Path to the image ( change to the actual path )
imagePath="/home/$user/.config/hypr/wallpaper/evening-landscape.jpg"

# Change the wallpaper
swaybg -i $imagePath -m fill

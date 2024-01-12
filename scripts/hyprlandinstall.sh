#!/bin/bash
pkgs2=(hyprland ly)

read -r -p "This will install hyperland and ly enter y to acceps? [y/N] " response2
if [[ "$response2" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	yay -S "${pkgs2[@]}"  --noconfirm
else
    echo "Skipping, If you do not have hyperland already installed you may encounter some issues"
fi


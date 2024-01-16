# Hyprland-Config
This is currently for my personal setup and is not ready for the public. Running these scripts might not work. If you MUST play, copy and paste the install command from below.


# Install

    $ git clone https://github.com/jacob153/Hyprland-Config.git && cd Hyprland-Config && bash install.sh

## Known Issues
- Wallpaper not applying after running script
	- sometimes the wallpaper script isn't fully generated when the initsetup.sh scrip is executed. Re-run the install.sh script and don't run the initial setup script again.
- Bluetooth module in waybar says "no-controller"
	- if you are on a computer that does not have bluetooth this will show no-controller. If your laptop/pc does have bluetooth you need to install "bluez" from aur and enable the "bluetooth" systemd service
	- `sudo pacman -S bluez && sudo systemctl enable --now bluetooth` note: press win + b to restart waybar after this
- Some of the waybar buttons are not working
	- yeah, I'm still working on it give me some time and I'm sure I'll have something figured out

## Projects used

Note: There are parts and pieces from these other projects used to make mine

 - [ML4W](https://gitlab.com/stephan-raabe/dotfiles)
	 - Used to start waybar configuration and theme
- [zft9xgy Discussion Comment](https://github.com/hyprwm/hyprpaper/issues/108#issue-1996375016)
	- Used to help build script to generate wallpaper conf


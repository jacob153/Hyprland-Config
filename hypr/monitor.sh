# script to set wallpaper on every monitor when hyprpaper doesnt want to
# it just iterate through monitors and set things
echo "preload = /home/jahuffine/.config/hypr/wallpapers/1.jpg" >> hyprpaper.conf
echo "wallpaper on every monitor, trying set to:" $1
#hyprctl hyprpaper preload $1
IFS=$'\n' # stackoverflow told me that i shouldnt use it but my scripting skills are too bad :3
for l in $(hyprctl monitors | grep "Monitor")
do
    TMP=${l##*Monitor }
    TMP=${TMP%% (*}
    echo "set for" $TMP
    echo "wallpaper = $TMP,/home/jahuffine/.config/hypr/wallpapers/1.jpg" >> hyprpaper.conf
 # hyprctl hyprpaper wallpaper $TMP,$1
done
echo "splash = true" >> hyprpaper.conf
echo "ipc = off" >> hyprpaper.conf
echo "done"

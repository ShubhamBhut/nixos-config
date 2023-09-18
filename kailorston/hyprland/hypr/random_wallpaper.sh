set_wallpaper() {

    monitor="eDP-1"

    wallpaper_dir="$HOME/Pictures/wallpapers/current"

    files=($wallpaper_dir/*)

    random_file=("${files[RANDOM % ${#files[@]}]}")

    echo $random_file

    hyprctl hyprpaper wallpaper "$monitor,$random_file"

}

set_wallpaper

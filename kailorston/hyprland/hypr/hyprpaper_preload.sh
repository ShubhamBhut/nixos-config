preload_wallpaper() {

    monitor="eDP-1"

    wallpaper_dir="$HOME/Pictures/wallpapers/current"

    wallpapers=$(find "$wallpaper_dir" -type f | sort -R )

    for wallpaper in $wallpapers; do
        preload_string+="preload = "$wallpaper"\n"
    done

    echo -en "$preload_string" > ~/src/nixos-config/kailorston/hyprland/hypr/hyprpaper.conf
    # echo -en "wallpaper = eDP-1, /home/kailorston/Pictures/wallpapers/dawn_after_rain_by_rajanandepu_dc7v1aa-fullview.jpg" > ~/src/nixos-config/kailorston/hyprland/hypr/hyprpaper.conf

}

preload_wallpaper

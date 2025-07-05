#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/.config/Wallpapers"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# Infinite loop to change wallpaper every X seconds
while true; do
    # Randomly select a wallpaper
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # Set the wallpaper using feh
    wal -i "$RANDOM_WALLPAPER" -n 
    feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"

    # Wait for a specified amount of time (e.g., 3600 seconds = 1 hour)
    sleep 1200
done

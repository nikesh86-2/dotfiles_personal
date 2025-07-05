#!/bin/bash

# Get the current status of Spotify
status=$(playerctl status 2>/dev/null)

if [ "$status" == "Playing" ]; then
    # Get the current song information
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    
    # Format the output
    echo "%{F#00ff00} %{F-}$title - $artist%{F#ffffff} | $album"
elif [ "$status" == "Paused" ]; then
    echo "%{F#ffff00} Paused%{F-}"
else
    echo "%{F#ff0000} Not Playing%{F-}"
fi

#!/bin/bash

# Check if playerctl is installed and if Spotify is running
if ! command -v playerctl &> /dev/null; then
    echo "playerctl not found"
    exit 1
fi

## Fetch the current playback status
status=$(playerctl --player=spotify status 2>/dev/null)
#if [ $status != 0 ]; then
#    echo ""
#    exit 1
#fi

# Fetch the current song info
artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
title=$(playerctl --player=spotify metadata title 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo " $artist - $title"
else
    echo " $artist - $title"
fi



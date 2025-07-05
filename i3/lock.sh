#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
rm /tmp/screen.png
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
magick "$tmpbg" -blur 0x2 "$tmpbg"

# lock the screen with the blurred screenshot
pgrep i3lock || i3lock -i "$tmpbg"

swayidle -w \
	timeout 300 'exec hyprlock' \
	timeout 600 'hyprctl dispatch dpms off' \
	resume 'hyprctl dispatch dpms on' \
	before-sleep 'pgrep hyprlock || exec hyprlock' &

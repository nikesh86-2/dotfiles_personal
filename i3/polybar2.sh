#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 2; done
sleep 10
# Get the list of connected monitors
MONITORS=$(xrandr --listactivemonitors | awk 'NR>1 {print $4}')

# Launch polybar for each monitor
for MONITOR in $MONITORS; do
    MONITOR=$MONITOR --reload polybar example &
    MONITOR=$MONITOR --reload polybar example1 &
done

MONITOR=$MONITOR polybar --reload example 2>&1 | tee -a ~/.polybar.log &
MONITOR=$MONITOR polybar --reload example1 2>&1 | tee -a ~/.polybar.log &

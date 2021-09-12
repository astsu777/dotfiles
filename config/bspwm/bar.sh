#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
for screen in $(bspc query -M --names)
do
    polybar desktop -r --config="$HOME"/.config/bspwm/polybar-fancy/config.ini &
	# polybar mainbar0 -r --config="$HOME"/.config/bspwm/polybar-regular/config.ini &
done

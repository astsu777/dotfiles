#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
if [[ -d /usr/share/xbps.d ]]; then
	polybar mainbar0 -r --config="$HOME"/.config/bspwm/polybar-txt.config &
else
	polybar mainbar0 -r --config="$HOME"/.config/bspwm/polybar.config &
fi

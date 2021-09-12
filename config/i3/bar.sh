#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar desktop -r --config="$HOME"/.config/i3/polybar-fancy/config.ini &
# polybar mainbar0 -r --config="$HOME"/.config/i3/polybar-regular/config.ini &

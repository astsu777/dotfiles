#!/usr/bin/env bash
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Tue 19 Oct 2021 18:42:01
# Last modified: Wed 04 Jan 2023 12:48:32
# Version: 1.0
#
# Description: SpectrWM autostart script
#=========================================================================

# Configure wallpaper
if type feh >/dev/null 2>&1; then
	if [ -d "$HOME/.local/share/wallpapers" ]; then
		feh --bg-scale --no-fehbg --randomize "$HOME"/.local/share/wallpapers/* &
	else
		feh --bg-scale --no-fehbg "$HOME"/.config/spectrwm/background.jpg &
	fi
fi

# Launch Simple X Hotkey Daemon
if type sxhkd >/dev/null 2>&1; then
	sxhkd -c "$HOME"/.config/sxhkd/sxhkdrc &
fi

# Launch Dunst if installed (notification)
if type dunst >/dev/null 2>&1; then
	dunst &
fi

# Launch Unclutter (hide mouse cursor)
if type unclutter >/dev/null 2>&1; then
	unclutter &
fi

# Launch Flameshot if installed
if type flameshot >/dev/null 2>&1; then
	flameshot &
fi

# Display volume icon in systray
if type volumeicon >/dev/null 2>&1 && [ ! -n "$(pgrep volumeicon)" ]; then
	volumeicon &
fi

# Turn on Numlock
if type numlockx >/dev/null 2>&1; then
	numlockx on &
fi

# Launch a session manager
if type lxpolkit >/dev/null 2>&1; then
	lxpolkit &
fi

# Launch a session manager
if type lxsession >/dev/null 2>&1 && [ ! -d /usr/share/xbps.d ]; then
	lxsession &
fi

# Launch Redshift (night light)
if type redshift >/dev/null 2>&1 && [ ! -n "$(pgrep redshift-gtk)" ]; then
	redshift-gtk &
fi

# Launch Nextcloud client
if type nextcloud >/dev/null 2>&1; then
	nextcloud --background &
fi

# Launch compositer for fancy graphical effects
if type picom >/dev/null 2>&1; then
	picom &
fi

#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Sat 28 Aug 2021 10:43:35
# Last modified: Thu 29 Sep 2022 22:30:42
# Version: 1.0
#
# Description: scratchpad for BSPWM
#=========================================================================
if [ -z "$1" ]; then
	echo "Usage: $0 <name of hidden scratchpad window>"
	exit 1
fi

pids=$(xdotool search --class "${1}")
for pid in $pids; do
	echo "Toggle $pid"
	bspc node "$pid" --flag hidden -f
done

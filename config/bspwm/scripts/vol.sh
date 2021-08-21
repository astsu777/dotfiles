#!/usr/bin/env sh
#===================================================
# Author: Gaetan (gaetan@ictpourtous.com)
# Creation: Sat Aug 2021 21:44:51
# Last modified: Sat Aug 2021 21:45:15
# Version: 1.0
#
# Description: print the current volume level
#===================================================
vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
state="$(amixer get Master | tail -n1 | awk '{print $6}')"
if [ "$state" = "[off]" ]; then
	icon="🔇"
else
	if [ "$vol" -gt "70" ]; then
		icon="🔊"
	elif [ "$vol" -lt "30" ]; then
		icon="🔈"
	else
		icon="🔉"
	fi
fi
printf "%s %s\\n" "$icon" "$vol%"

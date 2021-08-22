#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:06:34
# Last modified: Sun 22 Aug 2021 12:06:46
# Version: 1.0
#
# Description: print the current volume
#=========================================================================

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
printf "%s %s\\n" "V:" "$vol%"

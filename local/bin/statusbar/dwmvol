#!/bin/bash
vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
state="$(amixer get Master | tail -n1 | awk '{print $6}')"
if [[ "$state" == "[off]" ]]; then
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
printf "%s %s \\n" "$icon" "$vol%"

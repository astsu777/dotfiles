#!/usr/bin/env bash
#===================================================
# Author: Gaetan (gaetan@ictpourtous.com)
# Creation: Sat Aug 2021 21:42:15
# Last modified: Sat Aug 2021 21:42:28
# Version: 1.0
#
# Description: loop through all attached batteries and format the info
#===================================================
if [ -f /sys/class/power_supply/BAT?*/charge_now ]; then
	for battery in /sys/class/power_supply/BAT?*; do
		# If non-first battery, print a space separator.
		[ -n "${capacity+x}" ] && printf " "
		# Sets up the status and capacity
		case "$(cat "$battery/status")" in
			"Full") status="⚡" ;;
			"Discharging") status="🔋" ;;
			"Charging") status="🔌" ;;
			"Not charging") status="🛑" ;;
			"Unknown") status="♻️" ;;
		esac
		capacity=$(bc -l <<< "scale=2; $(cat $battery\/charge_now) / $(cat $battery\/charge_full) * 100" | cut -d'.' -f1)
		# Will make a warn variable if discharging and low
		[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
		# Prints the info
		printf "%s %s%d%% " "$status" "$warn" "$capacity"; unset warn
	done && exit 0
fi
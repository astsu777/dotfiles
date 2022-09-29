#!/usr/bin/env bash
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Tue 19 Oct 2021 17:42:04
# Last modified: Thu 29 Sep 2022 22:28:02
# Version: 1.0
#
# Description: outputs status bar information for SpectrWM
#=========================================================================

#=======================
# Updates
#=======================
updates() {
	updatesarch="$(checkupdates 2> /dev/null | wc -l)"
	updatesaur="$(yay -Qum 2> /dev/null | wc -l)"
	updates=$(($updatesarch + $updatesaur))
	updicon=""
	printf "%s %s\\n"  "$updicon" "$updates"
}

#=======================
# News
#=======================
news() {
	news=$(newsboat -x print-unread | awk '{print $1}')
	newsicon=""
	printf "%s %s\\n"  "$newsicon" "$news"
}

#=======================
# CPU
#=======================
cpu() {
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	cpuicon=""
	printf "%s %s\\n" "$cpuicon" "$cpu%"
}

#=======================
# Memory
#=======================
mem() {
	usage=$(free -t | awk 'NR == 2 {print $3/$2*100}' | cut -d'.' -f1)
	memicon=""
	printf "%s %s\\n" "$memicon" "$usage%"
}

#=======================
# IP
#=======================
internet() {
	nic=$(ip route get 8.8.8.8 2>/dev/null | sed 's/.*dev \([^ ]*\).*/\1/;t;d')
	ipAddr=$(ip route get 8.8.8.8 2>/dev/null | sed 's/.*src \([^ ]*\).*/\1/;t;d')
	case "$nic" in
		wl*) ipicon="" ;;
		*) ipicon="" ;;
	esac
	if [ -z "$ipAddr" ]; then ipAddr="-" && ipicon=""; fi
	printf "%s %s\n" "$ipicon" "$ipAddr"
}

#=======================
# Network
#=======================
net() {
	update() {
		sum=0
		for arg; do
			read -r i < "$arg"
			sum=$(( sum + i ))
		done
		cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
		[ -f "$cache" ] && read -r old < "$cache" || old=0
		printf %d\\n "$sum" > "$cache"
		printf %d\\n $(( sum - old ))
	}
	rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
	tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)
	printf " %4sB  %4sB\\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)
}

#=======================
# Disk
#=======================
hdd() {
	hdd1="$(df -h / | awk 'NR==2 {print $3}')"
	hdd2="$(df -h / | awk 'NR==2 {print $2}')"
	hddicon=""
	printf "%s %s\\n" "$hddicon" "$hdd1"/"$hdd2"
}

#=======================
# Temperature
#=======================
temp() {
	TEMP="$(sensors 2>/dev/null |awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
	tempicon=""
	if [ "$TEMP" != 0 ]; then
		printf "%s %s\n" "$tempicon" "$TEMP°C"
	fi
}

#=======================
# Battery
#=======================
battery() {
	if [ -f /sys/class/power_supply/BAT?*/charge_now ]; then
		for battery in /sys/class/power_supply/BAT?*; do
			# If non-first battery, print a space separator.
			[ -n "${capacity+x}" ] && printf " "
			# Sets up the status and capacity
			case "$(cat "$battery/status")" in
				"Full") status="" ;;
				"Discharging") status="" ;;
				"Charging") status="" ;;
				"Not charging") status="" ;;
				"Unknown") status="" ;;
			esac
			capacity=$(bc -l <<< "scale=2; $(cat $battery\/charge_now) / $(cat $battery\/charge_full) * 100" | cut -d'.' -f1)
			# Will make a warn variable if discharging and low
			[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
			# Prints the info
			printf "%s %s%d%%" "$status" "$warn" "$capacity"; unset warn
		done && exit 0
	fi
}

#=======================
# Volume
#=======================
volume() {
	vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	state="$(amixer get Master | tail -n1 | awk '{print $6}')"
	if [ "$state" = "[off]" ]; then
		volicon=""
	else
		if [ "$vol" -gt "70" ]; then
			volicon=""
		elif [ "$vol" -lt "30" ]; then
			volicon=""
		else
			volicon=""
		fi
	fi
	printf "%s %s\\n" "$volicon" "$vol%"
}

#=======================
# Weather
#=======================
weather() {
	weather=$(curl -s http://v2.wttr.in/\?format="%t" | sed 's/[+]//')
	wicom=""
	temp=$(echo "$weather" | awk '{print $1}')
	printf "%s %s\n" "$wicon" "$temp"
}

#=======================
# Date & time
#=======================
clock() {
	dte="$(date +"%a %B %d %R"| sed 's/  / /g')"
	clockicon=""
	printf "%s %s\n" "$clockicon $dte"
}

#=======================
# Bar
#=======================
# The bar has a limit of the amount of characters to put in it.
# This script includes functions that are unused because of this.
while :; do
	if [ -f /sys/class/power_supply/BAT?*/charge_now ]; then
		echo "+@fg=6; $(updates) +@fg=7; $(cpu) +@fg=2; $(mem) +@fg=3; $(net) +@fg=4; $(hdd) +@fg=5; $(battery) +@fg=2; $(volume) +@fg=0; $(clock)+@fg=0;"
	else
		echo "+@fg=6; $(updates) +@fg=7; $(cpu) +@fg=2; $(mem) +@fg=3; $(net) +@fg=4; $(hdd) +@fg=2; $(volume) +@fg=0; $(clock)+@fg=0;"
	fi
	sleep 2
done


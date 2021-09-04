#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Fri 03 Sep 2021 23:06:10
# Last modified: Sat 04 Sep 2021 15:40:56
# Version: 1.0
#
# Description: shows the current IP address and if connected to Internet or not
# Show wifi 📶 and percent strength or 📡 if none.
# Show 🌐 if connected to ethernet or ❎ if none.
# Show 🔒 if a vpn connection is active
#=========================================================================

ipAddr=$(ip route get 8.8.8.8 2>/dev/null | sed 's/.*src \([^ ]*\).*/\1/;t;d')
if [ -z "$ipAddr" ]; then ipAddr="-"; fi

case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) wifiicon="📡 " ;;
	up) wifiicon="$(awk '/^\s*w/ { print "📶", int($3 * 100 / 70) "% " }' /proc/net/wireless)" ;;
esac

printf "%s%s%s %s\n" "$wifiicon" "$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate 2>/dev/null)" "$(sed "s/.*/🔒/" /sys/class/net/tun*/operstate 2>/dev/null)" "$ipAddr"

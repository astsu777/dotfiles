#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Fri 03 Sep 2021 23:06:10
# Last modified: Sat 04 Sep 2021 16:05:22
# Version: 1.0
#
# Description: shows the current IP address and if connected to Internet or not
#=========================================================================

nic=$(ip route get 8.8.8.8 2>/dev/null | sed 's/.*dev \([^ ]*\).*/\1/;t;d')
ipAddr=$(ip route get 8.8.8.8 2>/dev/null | sed 's/.*src \([^ ]*\).*/\1/;t;d')
case "$nic" in
	wl*) icon="📶" ;;
	*) icon="🌐" ;;
esac
if [ -z "$ipAddr" ]; then ipAddr="-" && icon="❎"; fi

printf "%s %s\n" "$icon" "$ipAddr"

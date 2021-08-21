#!/usr/bin/env sh
#===================================================
# Author: Gaetan (gaetan@ictpourtous.com)
# Creation: Sat Aug 2021 21:43:14
# Last modified: Sat Aug 2021 21:49:15
# Version: 1.0
#
# Description: print unread news from Newsboat
#===================================================
if type newsboat > /dev/null 2>&1; then
	/usr/bin/notify-send "📰 Updating RSS feeds..."
	news=$(newsboat -x print-unread | awk '{print $1}')
	icon="📰"
	printf "%s %s\\n"  "N:" "$news"
	/usr/bin/notify-send "📰 RSS feeds updated"
fi

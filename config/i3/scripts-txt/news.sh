#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:06:05
# Last modified: Sun 22 Aug 2021 12:06:10
# Version: 1.0
#
# Description: print unread news from Newsboat
#=========================================================================

if type newsboat > /dev/null 2>&1; then
	/usr/bin/notify-send "📰 Updating RSS feeds..."
	news=$(newsboat -x print-unread | awk '{print $1}')
	icon="📰"
	printf "%s %s\\n"  "N:" "$news"
	/usr/bin/notify-send "📰 RSS feeds updated"
fi

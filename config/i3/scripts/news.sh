#!/bin/sh
if type newsboat > /dev/null 2>&1; then
	/usr/bin/notify-send "📰 Updating RSS feeds..."
	news=$(newsboat -x print-unread | awk '{print $1}')
	icon="📰"
	printf "%s %s\\n"  "$icon" "$news"
	/usr/bin/notify-send "📰 RSS feeds updated"
fi

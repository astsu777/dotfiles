#!/bin/sh
if type newsboat > /dev/null 2>&1; then
	news=$(newsboat -x print-unread | awk '{print $1}')
	icon="📰"
	printf "%s %s \\n"  "$icon" "$news"
fi

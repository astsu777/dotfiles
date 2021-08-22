#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:06:49
# Last modified: Sun 22 Aug 2021 12:06:55
# Version: 1.0
#
# Description: get the weather conditions from current location (IP based)
#=========================================================================

weather=$(curl -s http://v2.wttr.in/\?format="%c+%t" | sed 's/[+]//')
icon=$(echo "$weather" | awk '{print $1}')
temp=$(echo "$weather" | awk '{print $2}')
printf "%s %s \n" "W:" "$temp"

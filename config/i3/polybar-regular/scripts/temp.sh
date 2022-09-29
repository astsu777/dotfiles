#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Sun 22 Aug 2021 12:03:43
# Last modified: Mon 23 Aug 2021 11:38:26
# Version: 1.0
#
# Description: print CPU temperature
#=========================================================================

TEMP="$(sensors 2> /dev/null |awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
icon="🌡"
if [ "$TEMP" != 0 ]; then
	printf "%s %s" "$icon" "$TEMP°C"
fi
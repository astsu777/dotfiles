#!/usr/bin/env sh
#===================================================
# Author: Gaetan (gaetan@ictpourtous.com)
# Creation: Sat Aug 2021 21:44:30
# Last modified: Sat Aug 2021 21:44:48
# Version: 1.0
#
# Description: print the number of available updates
#===================================================
updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(yay -Qum 2> /dev/null | wc -l)"
updates=$(($updatesarch + $updatesaur))
icon="📦"
printf "%s %s\\n"  "$icon" "$updates"

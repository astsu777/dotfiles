#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:06:23
# Last modified: Sun 22 Aug 2021 12:06:28
# Version: 1.0
#
# Description: print the number of available updates
#=========================================================================

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(yay -Qum 2> /dev/null | wc -l)"
updates=$(($updatesarch + $updatesaur))
icon="📦"
printf "%s %s\\n"  "U:" "$updates"
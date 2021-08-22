#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:02:56
# Last modified: Sun 22 Aug 2021 12:03:15
# Version: 1.0
#
# Description: get the disk space of '/' mount point
#=========================================================================

hdd1="$(df -h / | awk 'NR==2 {print $3}')"
hdd2="$(df -h / | awk 'NR==2 {print $2}')"
icon="💾"
printf "%s %s%s\\n" "$icon" "$hdd1"/"$hdd2"

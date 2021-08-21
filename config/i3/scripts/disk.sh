#!/usr/bin/env sh
#===================================================
# Author: Gaetan (gaetan@ictpourtous.com)
# Creation: Sat Aug 2021 21:41:49
# Last modified: Sat Aug 2021 21:42:11
# Version: 1.0
#
# Description: get the disk space of '/' mount point
#===================================================
hdd1="$(df -h / | awk 'NR==2 {print $3}')"
hdd2="$(df -h / | awk 'NR==2 {print $2}')"
icon="💾"
printf "%s %s%s\\n" "$icon" "$hdd1"/"$hdd2"

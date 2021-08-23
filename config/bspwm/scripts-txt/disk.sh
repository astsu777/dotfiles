#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Sun 22 Aug 2021 12:05:44
# Last modified: Mon 23 Aug 2021 11:39:27
# Version: 1.0
#
# Description: get the disk space of '/' mount point
#=========================================================================

hdd1="$(df -h / | awk 'NR==2 {print $3}')"
hdd2="$(df -h / | awk 'NR==2 {print $2}')"
icon="💾"
printf "%s %s\\n" "D:" "$hdd1"/"$hdd2"

#!/bin/bash
hdd1="$(df -h / | awk 'NR==2 {print $3}')"
hdd2="$(df -h / | awk 'NR==2 {print $2}')"
icon="💾"
printf "%s %s%s\\n" "$icon" "$hdd1"/"$hdd2"

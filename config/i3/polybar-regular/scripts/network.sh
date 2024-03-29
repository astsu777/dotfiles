#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Sun 22 Aug 2021 12:03:21
# Last modified: Mon 23 Aug 2021 11:38:11
# Version: 1.0
#
# Description: prints the upload/download speed
#=========================================================================

update() {
    sum=0
    for arg; do
        read -r i < "$arg"
        sum=$(( sum + i ))
    done
    cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
    [ -f "$cache" ] && read -r old < "$cache" || old=0
    printf %d\\n "$sum" > "$cache"
    printf %d\\n $(( sum - old ))
}

rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

printf "⬇ %4sB ⬆ %4sB\\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)

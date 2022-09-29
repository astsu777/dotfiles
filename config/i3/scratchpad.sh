#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @astsu777
# Creation: Sat 28 Aug 2021 10:43:35
# Last modified: Thu 29 Sep 2022 22:30:21
# Version: 1.0
#
# Description: scratchpad for i3
#=========================================================================
if ! pgrep -f 'st -c scratchpad'; then
	st -c scratchpad -g 120x34
fi

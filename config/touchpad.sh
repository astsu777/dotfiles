#!/usr/bin/env sh
#=========================================================================
# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT
# Creation: Mon 23 Aug 2021 15:06:02
# Last modified: Mon 23 Aug 2021 15:06:39
# Version: 1.0
#
# Description: configure the touchpad on laptops
#=========================================================================

#=======================
# Apple MacBook
#=======================
if grep -E '^Mac' /sys/class/dmi/id/chassis_version > /dev/null 2>&1 && grep -E '^(8|9|10|14)$' /sys/class/dmi/id/chassis_type > /dev/null 2>&1; then
	# Enable tap to click on my Macbook
	xinput set-prop bcm5974 "libinput Tapping Enabled" 1
fi
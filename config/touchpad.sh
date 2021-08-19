#!/bin/sh

# MACBOOK
if grep -E '^Mac' /sys/class/dmi/id/chassis_version > /dev/null 2>&1 && grep -E '^(8|9|10|14)$' /sys/class/dmi/id/chassis_type > /dev/null 2>&1; then
	# Enable tap to click on my Macbook
	xinput set-prop bcm5974 "libinput Tapping Enabled" 1
fi
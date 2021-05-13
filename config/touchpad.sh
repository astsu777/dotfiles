#!/bin/bash

# MACBOOK
if [[ $(cat /sys/class/dmi/id/chassis_type) =~ ^(8|9|10|14)$ ]] && [[ $(cat /sys/class/dmi/id/chassis_version) =~ ^Mac ]]; then
	# Enable tap to click on my Macbook
	xinput set-prop bcm5974 "libinput Tapping Enabled" 1
fi
#!/bin/bash
weather=$(curl -s http://v2.wttr.in/\?format="%c%t" | sed 's/[+]//g')
printf "%s\\n" "$weather"

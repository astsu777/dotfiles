#!/bin/bash
weather=$(curl -s http://wttr.in/"$1"\?format="%c%t")
printf "%s \n" "$weather"

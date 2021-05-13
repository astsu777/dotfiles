#!/bin/bash

# Feed script a url
# If an image, it will view in feh.
# If a video or a gif, it will view in mpv
# If music file or pdf it will download.
# Otherwise opens link in browser.

ext="${1##*.}"
mpvFiles="mkv mp4 gif avi"
fehFiles="png jpg jpeg jpe"
wgetFiles="mp3 flac opus mp3?source=feed pdf shn ogg"

if echo $fehFiles |grep -w $ext > /dev/null; then
		nohup feh "$1" > /dev/null &
elif echo $mpvFiles |grep -w $ext > /dev/null; then
		nohup mpv --loop --quiet "$1" > /dev/null &
elif echo $wgetFiles |grep -w $ext > /dev/null; then
		nohup wget "$1" > /dev/null &
else
		nohup $BROWSER "$1" > /dev/null &
fi
#!/bin/env bash
#find . -type f -name '*.ogg' -print0 | while IFS= read -d $'\0' f; do
#find . -name \*.ogg | (

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in $(find -name \*.ogg -o -name \*.m4a -o -name \*.flac -o -name \*.aac -o -name \*.wma); do
#	while read f; do
		newFile=${f%.*} ;
		newFile=${newFile% - YouTube}; # I usually download some song recvers from YouTube.
		newFile=$newFile".mp3";
		
		bit1=`ffmpeg -i "$f" 2>&1 | grep Audio | awk -F", " '{print $5}' | cut -d' ' -f1`
		bit2=`ffmpeg -i "$f" 2>&1 | grep bitrate | awk -F", " '{print $3}' | cut -d':' -f2 | cut -d' ' -f2`
		
		echo "bit method1=$bit1 & method2=$bit2"
		bit=$bit1
		if [ -z "$bit" ]; then
			bit=$bit2			
		fi
		
		echo $f, bitrate=$bit
		if [ -n "$bit" ]; then
			#cp "$f" ./crappyData
			echo "bitrate=$bit" &>"$f".info
			ffmpeg -i "$f" -vn -ab ${bit}k -map_metadata 0 -id3v2_version 3  "$newFile" &>"$f".info
			echo "Rename file $f as backup"
			#mv "$f" "$f".bak
		else
			#ffmpeg -i "$f" -vn -map_metadata 0 -id3v2_version 3 "$newFile" # this is if we don't have an output from the grep line above, ffmpeg will keep the original quality, that is 192k for 192k
			echo "Failed to find bitrate for $f."
			#mv "$f" "$f".bak			
		fi   
		echo "*****"
	done
#)

IFS=$SAVEIFS

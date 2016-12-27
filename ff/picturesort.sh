#!/bin/bash

# This script copies files from my homedirectory into the webserver directory.
# A new directory is created every hour.
# If the pics are taking up too much space, the oldest are removed.

while true; do 
	DISKFUL=$(df -h $WEBDIR | grep -v File | awk '{print $5 }' | cut -d "%" -f1 -)

	until [ $DISKFUL -ge "90" ]; do 

        	DATE=`date +%Y%m%d`
        	HOUR=`date +%H`
        	mkdir $WEBDIR/"$DATE"
                                                                                
        	while [ $HOUR -ne "00" ]; do
                	DESTDIR=$WEBDIR/"$DATE"/"$HOUR"
                	mkdir "$DESTDIR"
                	mv $PICDIR/*.jpg "$DESTDIR"/
                	sleep 3600
                	HOUR=`date +%H`
        	done

	DISKFULL=$(df -h $WEBDIR | grep -v File | awk '{ print $5 }' | cut -d "%" -f1 -)
	done

	TOREMOVE=$(find $WEBDIR -type d -a -mtime +30)
	for i in $TOREMOVE; do
		rm -rf "$i";
	done

done
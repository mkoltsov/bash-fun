#!/bin/bash

# This script does a very simple test for checking disk space.

space=`df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -`
alertvalue="80"

if [ "$space" -ge "$alertvalue" ]; then
  echo "At least one of my disks is nearly full!" | mail -s "daily diskcheck" root
else
  echo "Disk space normal" | mail -s "daily diskcheck" root
fi
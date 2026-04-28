#!/bin/bash

site="10.0.17.6/IOC.html"
page=$(curl -sL "$site")

iocs=$(echo "$page" | grep "<td>" | cut -d'>' -f2 | cut -d'<' -f1 | awk 'NR%2==1')

echo "$iocs" > IOC.txt

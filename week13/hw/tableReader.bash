#!/bin/bash

link="10.0.17.6/Assignment.html"

page=$(curl -sL "$link")

#ths=$(echo "$page" | grep "<th>" | cut -d'>' -f2 | cut -d'<' -f1)
tds=$(echo "$page" | grep "<td>" | cut -d'>' -f2 | cut -d'<' -f1)

lineCount=$(echo "$tds" | wc -l)
eachTableCount=$(("lineCount" / 2))
rows=$(("$eachTableCount" / 2))

# every other = temp
tempatureData=$(echo "$tds" | head -n "$eachTableCount" | awk 'NR%2==1')
# dates all
dates=$(echo "$tds" | head -n "$eachTableCount" | awk 'NR%2==0')
pressureData=$(echo "$tds" | tail -n "$eachTableCount" | awk 'NR%2==1')

i=1
while [ "$i" -le "$rows" ]; do
	# bad but works
	temp=$(echo "$tempatureData" | head -n "$i" | tail -n 1)
	pressure=$(echo "$pressureData" | head -n "$i" | tail -n 1)
	date=$(echo "$dates" | head -n "$i" | tail -n 1)

	echo "$pressure $temp $date"

	i=$(("$i" + 1))

done




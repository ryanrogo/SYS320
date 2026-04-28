#!/bin/bash

logfile="$1"
IOCfile="$2"

iocs=$(cat "$IOCfile")

matches=$(grep -Ff "$IOCfile" "$logfile")

results=$(echo "$matches" | cut -d' ' -f1,4,7 | tr -d '[')

echo "$results" > report.txt


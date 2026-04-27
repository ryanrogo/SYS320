#!/bin/bash

logfile="/home/champuser/fileaccesslog.txt"
emailform="/home/champuser/SYS320/week15/hw/emailform.txt"

echo "File was accessed on $(date | tr ':' '-')" >> "$logfile"

echo "To: ryan.rogowski@mymail.champlain.edu" > "$emailform"
echo "From: ryan.rogowski@mymail.champlain.edu" >> "$emailform"
echo "Subject: Access to Sensitive File" >> "$emailform"
echo "" >> "$emailform"
cat "$logfile" >> "$emailform"
cat "$emailform" | /usr/sbin/ssmtp ryan.rogowski@mymail.champlain.edu


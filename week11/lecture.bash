#!/bin/bash

file="/var/log/apache2/access.log"

# results=$(cat "$file" | grep 'GET /page2.html' | cut -d' ' -f1,7  | tr -d '[]"')

# echo "$results"

function pageCount() 
{
pages=$(cat $file | grep "GET" | cut -d ' ' -f7 | tr -d '[]"')
echo "$pages" | sort | uniq -c
}

#pageCount

# HW assignment
function countingCurlAccess()
{

ips=$(cat "$file" | grep "curl" | grep "GET" | cut -d ' ' -f1,12 | tr -d '[]"')
echo "$ips" | sort | uniq -c 
}

countingCurlAccess



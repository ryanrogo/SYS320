#!/bin/bash

#usage: bash IPlist.bash 10.0.17
[ $# -ne 1 ] && echo "Usage: $0 <prefix>" && exit 1

prefix=$1

#verify input length
[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1

#ping all possible addresses
for i in {1..254}
do
	ping -c 1 "$prefix.$i" | grep "64 bytes from" | \
	grep -E -o "$prefix\.[0-9]+"
done

#!/bin/bash

ip addr | grep -E -o "inet ([0-9]{1,3}\.){3}[0-9]{1,3}/24 brd" | \
awk '{print $2}' | cut -d/ -f1

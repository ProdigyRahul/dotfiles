#!/bin/bash
# System uptime, short format

raw=$(uptime -p | sed 's/up //')
short=$(echo "$raw" | sed 's/ hours\?/h/;s/ minutes\?/m/;s/ days\?/d/;s/,//g')

echo "{\"text\":\"${short}\",\"tooltip\":\"Uptime: ${raw}\"}"

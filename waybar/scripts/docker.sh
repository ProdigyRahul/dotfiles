#!/bin/bash
# Running Docker container count

count=$(docker ps -q 2>/dev/null | wc -l)

if [[ "$count" -gt 0 ]]; then
  names=$(docker ps --format '{{.Names}}' 2>/dev/null | paste -sd ', ')
  echo "{\"text\":\"󰡨 ${count}\",\"tooltip\":\"${count} running: ${names}\",\"class\":\"running\"}"
else
  echo "{\"text\":\"󰡨 0\",\"tooltip\":\"No containers running\",\"class\":\"stopped\"}"
fi

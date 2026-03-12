#!/bin/bash
# GPU usage + temperature via nvidia-smi

data=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,name --format=csv,noheader,nounits 2>/dev/null)

if [[ -z "$data" ]]; then
  echo '{"text":"N/A","tooltip":"GPU unavailable","class":"off"}'
  exit 0
fi

usage=$(echo "$data" | cut -d',' -f1 | tr -d ' ')
temp=$(echo "$data" | cut -d',' -f2 | tr -d ' ')
name=$(echo "$data" | cut -d',' -f3 | tr -d ' ')

class="cool"
if (( temp >= 80 )); then class="hot"
elif (( temp >= 65 )); then class="warm"
fi

echo "{\"text\":\"${usage}% ${temp}°\",\"tooltip\":\"${name}\\nUsage: ${usage}%\\nTemp: ${temp}°C\",\"class\":\"${class}\"}"

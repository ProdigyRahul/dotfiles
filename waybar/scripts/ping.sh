#!/bin/bash
# Ping latency to 8.8.8.8

ms=$(ping -c1 -W2 8.8.8.8 2>/dev/null | grep -oP 'time=\K[\d.]+')

if [[ -z "$ms" ]]; then
  echo '{"text":"--","tooltip":"No connection","class":"bad"}'
  exit 0
fi

ms_int=${ms%.*}
class="good"
if (( ms_int >= 100 )); then class="bad"
elif (( ms_int >= 50 )); then class="warn"
fi

echo "{\"text\":\"${ms_int}ms\",\"tooltip\":\"Ping 8.8.8.8: ${ms}ms\",\"class\":\"${class}\"}"

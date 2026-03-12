#!/bin/bash
# Cycle power profiles: performance → balanced → power-saver → performance

current=$(powerprofilesctl get 2>/dev/null)

case "$current" in
  performance) next="balanced" ;;
  balanced)    next="power-saver" ;;
  *)           next="performance" ;;
esac

powerprofilesctl set "$next"

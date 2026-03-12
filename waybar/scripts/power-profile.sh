#!/bin/bash
# Show current power profile with icon

profile=$(powerprofilesctl get 2>/dev/null)

case "$profile" in
  performance)
    icon="󰓅"
    class="performance"
    ;;
  balanced)
    icon="󰾅"
    class="balanced"
    ;;
  power-saver)
    icon="󰌪"
    class="powersaver"
    ;;
  *)
    icon="⚡"
    class="unknown"
    ;;
esac

echo "{\"text\":\"${icon}\",\"tooltip\":\"Power: ${profile}\",\"class\":\"${class}\"}"

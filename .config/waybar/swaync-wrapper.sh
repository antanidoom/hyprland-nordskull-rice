#!/bin/bash
# Script per Waybar + swaync
# Restituisce JSON valido con icona per le notifiche

# Recupera le notifiche non lette
NOTIFS=$(swaync-client -c 2>/dev/null | jq length 2>/dev/null)

# Se non ci sono notifiche o swaync non risponde, icona vuota
if [ -z "$NOTIFS" ] || [ "$NOTIFS" -eq 0 ]; then
    ICON="󰂜"  # campanella vuota
else
    ICON="󰂰"  # campanella piena / con notifica
fi

# Output JSON per Waybar
echo "{\"text\":\"$ICON\",\"tooltip\":\"$NOTIFS notifiche\"}"

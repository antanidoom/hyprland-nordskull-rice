#!/bin/bash

# Legge il valore attuale
# Cerca: value:'NUMERO
QUANTUM=$(pw-metadata -n settings 0 clock.force-quantum 2>/dev/null | grep -oP "value:'\K\d+")

# Se è vuoto (0 o non settato), default a 0
if [ -z "$QUANTUM" ]; then
    QUANTUM="0"
fi

# --- LOGICA TOGGLE (Click) ---
if [ "$1" == "toggle" ]; then
    if [ "$QUANTUM" == "256" ]; then
        # Se siamo Pro, passiamo a Chill (1024)
        pw-metadata -n settings 0 clock.force-quantum 1024 > /dev/null 2>&1
    else
        # Se siamo Chill (o altro), passiamo a Pro (256)
        pw-metadata -n settings 0 clock.force-quantum 256 > /dev/null 2>&1
    fi
    # Aggiorna l'icona subito
    pkill -RTMIN+8 waybar
    exit
fi

# --- OUTPUT JSON (Per Waybar) ---
if [ "$QUANTUM" == "256" ]; then
    echo '{"text": "🎸 Pro", "tooltip": "Pro Audio ATTIVO (256 samples)", "class": "active"}'
else
    echo '{"text": "🛋️ Chill", "tooltip": "Pro Audio SPENTO (1024 samples)", "class": "inactive"}'
fi

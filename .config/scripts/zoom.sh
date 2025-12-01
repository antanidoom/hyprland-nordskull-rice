#!/usr/bin/env bash

# Legge il valore attuale dello zoom da Hyprland
current=$(hyprctl getoption cursor:zoom_factor | grep float | awk '{print $2}')

# Gestione argomenti
if [ "$1" = "in" ]; then
    # Aumenta di 0.1
    new=$(echo "$current + 0.1" | bc)
elif [ "$1" = "out" ]; then
    # Diminuisce di 0.1
    new=$(echo "$current - 0.1" | bc)
    # Evita di andare sotto 1.0 (che romperebbe la visualizzazione)
    if (( $(echo "$new < 1.0" | bc -l) )); then new=1.0; fi
else
    # Reset totale (es. se passi "reset")
    new=1.0
fi

# Applica il nuovo zoom
hyprctl keyword cursor:zoom_factor $new

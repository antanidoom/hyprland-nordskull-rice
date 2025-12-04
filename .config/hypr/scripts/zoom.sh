#!/usr/bin/env bash

# Legge il valore attuale dello zoom
current=$(hyprctl getoption cursor:zoom_factor | grep float | awk '{print $2}')

# --- CONFIGURAZIONE VELOCITÀ ---
# Prima era 0.1. Mettiamo 0.5 per renderlo molto più rapido.
# Se è TROPPO veloce, prova 0.25
step=0.4

# Gestione argomenti
if [ "$1" = "in" ]; then
    # Aumenta
    new=$(echo "$current + $step" | bc)
elif [ "$1" = "out" ]; then
    # Diminuisce
    new=$(echo "$current - $step" | bc)
    # Evita di andare sotto 1.0
    if (( $(echo "$new < 1.0" | bc -l) )); then new=1.0; fi
else
    # Reset
    new=1.0
fi

# Applica
hyprctl keyword cursor:zoom_factor $new

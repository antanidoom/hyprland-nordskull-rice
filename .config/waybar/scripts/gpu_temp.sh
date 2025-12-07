#!/bin/bash

# Cerca tra tutti i sensori hwmon
for i in /sys/class/hwmon/hwmon*; do
    # Legge il nome del sensore
    NAME=$(cat "$i/name" 2>/dev/null)

    # Se il nome è "amdgpu", abbiamo trovato la scheda video!
    if [ "$NAME" == "amdgpu" ]; then
        # Legge la temperatura (è in milligradi, es. 45000)
        TEMP_RAW=$(cat "$i/temp1_input")
        # Divide per 1000 per avere i gradi (45)
        TEMP_C=$(($TEMP_RAW / 1000))

        # Stampa solo il numero per Waybar
        echo "$TEMP_C"
        exit 0
    fi
done

# Se non trova nulla, stampa 0
echo "0"

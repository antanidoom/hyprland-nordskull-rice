#!/usr/bin/env bash

# Percorsi
DIR="$HOME/Pictures/Screenshots"
NAME="screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
FULLPATH="$DIR/$NAME"

# Crea cartella se non esiste
mkdir -p "$DIR"

# 1. SELEZIONA L'AREA (Slurp)
# Se premi ESC, slurp non restituisce nulla e lo script si ferma gentilmente
GEOMETRY=$(slurp)
if [ -z "$GEOMETRY" ]; then
    exit 0
fi

# 2. SCATTA LA FOTO (Grim)
# Usa la geometria selezionata per salvare il file
grim -g "$GEOMETRY" "$FULLPATH"

# 3. VERIFICA E NOTIFICA
if [ -f "$FULLPATH" ]; then

    # Copia negli appunti
    wl-copy < "$FULLPATH"

    # Invia notifica con anteprima
    ACTION=$(notify-send -i "$FULLPATH" \
             "Screenshot Catturato" \
             "Salvato e copiato negli appunti.\nClicca per aprire la cartella" \
             --action="apri=Apri Cartella" \
             --wait)

    # Gestione Click
    if [ "$ACTION" = "apri" ]; then
        thunar "$DIR"
    fi
else
    notify-send -u critical "Errore Screenshot" "Impossibile creare il file con Grim"
fi

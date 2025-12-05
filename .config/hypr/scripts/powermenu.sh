#!/usr/bin/env bash

# Percorsi assoluti (più sicuri)
CONF="$HOME/.config/wofi/config_power"
STYLE="$HOME/.config/wofi/style_power.css"

# Definizione delle opzioni
lock="  Blocca"
suspend="  Sospendi"
logout="  Logout"
reboot="  Riavvia"
shutdown="  Spegni"

# Genera la lista
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Esegui Wofi
# --cache-file /dev/null: Non salvare la cronologia dei comandi
selected=$(echo -e "$options" | wofi --show dmenu --conf "$CONF" --style "$STYLE" --cache-file /dev/null)

# Rimuovi l'icona e lo spazio iniziale dalla selezione per il case switch (se necessario)
# Ma qui usiamo la stringa intera per semplicità nel case

case $selected in
    "$lock")
        loginctl lock-session
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac

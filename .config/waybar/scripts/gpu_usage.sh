#!/bin/bash
# Cerca automaticamente la scheda AMD e legge la percentuale
PATH_GPU=$(find /sys/class/drm/card*/device/ -name "gpu_busy_percent" | head -n 1)
cat "$PATH_GPU"

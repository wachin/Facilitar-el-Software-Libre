#!/bin/bash

cd ../..
target_dir="$(pwd)/Tutoriales/Dolphin"

window_id=$(xdotool search --class "dolphin" --limit 1 --name "Dolphin")

if [ -n "$window_id" ]; then
    # Si se encuentra una ventana, actívala y envía las teclas para cambiar de directorio
    xdotool windowactivate --sync "$window_id"
    xdotool key ctrl+l
    xdotool type "$target_dir"
    xdotool key Return
else
    # Si no se encuentra una ventana, abre una nueva instancia de Dolphin
    dolphin "$target_dir"
fi
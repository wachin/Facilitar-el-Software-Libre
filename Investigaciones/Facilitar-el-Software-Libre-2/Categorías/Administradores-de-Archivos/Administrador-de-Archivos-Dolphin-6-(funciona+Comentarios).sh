#!/bin/bash

# Este script ayuda a abrir una carpeta específica en el programa Dolphin

# Primero, nos movemos al directorio correcto
cd ../..

# Guardamos la dirección de la carpeta que queremos abrir
target_dir="$(pwd)/Tutoriales/Dolphin"

# Buscamos si ya hay una ventana de Dolphin abierta
# Es como buscar una ventana específica en tu escritorio
window_id=$(xdotool search --class "dolphin" --limit 1 --name "Dolphin")

# Si encontramos una ventana de Dolphin abierta...
if [ -n "$window_id" ]; then
    # Hacemos que esa ventana sea la activa (como hacer clic en ella)
    xdotool windowactivate --sync "$window_id"

    # Presionamos Ctrl+L, que es el atajo para escribir una dirección en Dolphin
    xdotool key --clearmodifiers ctrl+l

    # Escribimos la dirección de la carpeta que queremos abrir
    xdotool type --delay 0 "$target_dir"

    # Presionamos Enter para confirmar y abrir la carpeta
    xdotool key Return

# Si no encontramos ninguna ventana de Dolphin abierta...
else
    # Abrimos una nueva ventana de Dolphin en la carpeta que queremos
    dolphin "$target_dir"
fi

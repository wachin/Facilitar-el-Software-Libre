#!/bin/bash

cd ../..
target_dir="$(pwd)/Tutoriales/Dolphin"

window_id=$(xdotool search --class "dolphin" --limit 1 --name "Dolphin")

if [ -n "$window_id" ]; then
    xdotool windowactivate --sync "$window_id"
    xdotool key --clearmodifiers ctrl+l
    xdotool type --delay 0 "$target_dir"
    xdotool key Return
else
    dolphin "$target_dir"
fi

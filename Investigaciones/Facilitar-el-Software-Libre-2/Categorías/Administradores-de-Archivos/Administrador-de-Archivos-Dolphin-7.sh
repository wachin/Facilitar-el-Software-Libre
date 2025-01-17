#!/bin/bash

cd ../..
target_dir="$(pwd)/Tutoriales/Dolphin"

if qdbus org.kde.dolphin-* /dolphin/Dolphin_1 org.kde.dolphin.MainWindow.activeViewSetUrl "file://$target_dir" 2>/dev/null; then
    : # No hacer nada si tuvo éxito
else
    dolphin "$target_dir"
fi

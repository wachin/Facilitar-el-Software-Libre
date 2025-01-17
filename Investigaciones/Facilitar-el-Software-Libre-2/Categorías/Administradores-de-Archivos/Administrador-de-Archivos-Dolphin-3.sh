#!/bin/bash
cd ../..
target_dir="$(pwd)/Tutoriales/Dolphin"

# Intenta activar una ventana existente de Dolphin
qdbus org.kde.dolphin-* /dolphin/Dolphin_1 org.kde.dolphin.MainWindow.activeViewSetUrl "file://$target_dir" 2>/dev/null || dolphin "$target_dir"


#!/bin/bash

cd ../..
target_dir="$(pwd)/Tutoriales/Dolphin"

# Intenta enviar un comando a una instancia existente de Dolphin
kdialog --passivepopup "dolphin:$target_dir" 0

# Si no hay una instancia abierta, abre una nueva
if [ $? -ne 0 ]; then
    dolphin "$target_dir"
fi


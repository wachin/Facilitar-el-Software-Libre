#!/bin/bash

### Auto push script
echo "Agregando cambios al stage..."
git add .
echo "Realizando commit..."
git commit -m "Actualización $(date)"
echo "Enviando cambios al repositorio remoto..."
git push origin main
echo "Proceso finalizado."
read


#!/bin/bash
### Proyecto 1 ###
set -o xtrace
git add .
git commit -m "Guardar automáticamente el commit P1 $(date)"
git push origin master 


#!/bin/bash

#
# Run this to update the user name for the installation
#

APPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

	grep -RiIl ./ | xargs sed -i "s@USERX@$APPDIR@g"
	
# sed -i -e "s@^Icon=.*@Icon=$APPDIR/src/contents/icon.png@" "$APPDIR"/Shutter-Encoder.desktop


# 
# Tomado del orignal del colocador de la ruta del lanzador de Zotero para que funcione el Desktop
# https://askubuntu.com/questions/84007/find-and-replace-text-within-multiple-files
# https://askubuntu.com/a/84482
#
#
#

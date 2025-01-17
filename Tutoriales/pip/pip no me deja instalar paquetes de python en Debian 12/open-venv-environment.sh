#!/bin/bash

konsole --noclose -e bash -c '
    echo "Activando el entorno virtual..."
    source $HOME/.venv/bin/activate
    echo "Entorno virtual activado."
    echo "Ejecutando md_to_blogger.py..."
    python3 md_to_blogger.py
    echo "Ejecución de md_to_blogger.py completada."
    echo ""
    echo "El entorno virtual sigue activo. Para desactivarlo, escribe \"deactivate\" y presiona Enter."
    echo "Para salir sin desactivar, simplemente presiona Enter."
    echo ""
    read -p "> " user_input
    if [ "$user_input" = "deactivate" ]; then
        deactivate
        echo "Entorno virtual desactivado."
    fi
    echo "Presiona Enter para cerrar esta ventana."
    read
    konsole_pid=$PPID
    qdbus org.kde.konsole-$konsole_pid /konsole/MainWindow_1 org.qtproject.Qt.QWidget.close
' -p tabtitle=PFSLE

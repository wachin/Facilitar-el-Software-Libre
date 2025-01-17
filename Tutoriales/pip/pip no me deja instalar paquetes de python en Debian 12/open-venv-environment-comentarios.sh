#!/bin/bash

# Este script abre una nueva ventana de Konsole, activa un entorno virtual de Python,
# ejecuta un script de Python y luego permite al usuario desactivar el entorno antes de cerrar.

# Abre una nueva ventana de Konsole y ejecuta los siguientes comandos en ella
konsole --noclose -e bash -c '
    # El comando `konsole --noclose -e bash -c` es una instrucción para abrir una
    # nueva ventana de Konsole (el emulador de terminal usado en entornos KDE)
    # con ciertas opciones específicas. Vamos a desglosarlo parte por parte:
    # `konsole`: Este es el comando básico para abrir una nueva ventana de Konsole.
    # `--noclose`: Esta opción le dice a Konsole que no cierre la ventana automáticamente
    # cuando el comando que se está ejecutando termine. Normalmente, si abres Konsole
    # para ejecutar un comando específico, la ventana se cerraría cuando ese comando
    # terminara. Con `--noclose`, la ventana permanece abierta.
    # `-e`: Esta opción significa "ejecutar". Le dice a Konsole que debe ejecutar el
    # comando que viene a continuación.
    # `bash`: Este es el nombre del shell que queremos usar. Bash es uno de los shells
    # más comunes en sistemas Unix y Linux.
    # `-c`: Esta es una opción para bash que significa "comando". Le dice a bash que
    # debe ejecutar el comando que viene a continuación como una cadena de texto.
    # Entonces, cuando pones todo junto: `konsole --noclose -e bash -c '...'`
    # Significa: "Abre una nueva ventana de Konsole, no la cierres automáticamente
    # cuando termine, y ejecuta el siguiente comando usando bash".
    # Todo lo que va dentro de las comillas simples `'...'` después de `-c` es el
    # comando (o serie de comandos) que se ejecutará en esa nueva ventana de Konsole.
    # Este enfoque nos permite abrir una nueva ventana de Konsole y ejecutar una serie
    # de comandos en ella, manteniendo la ventana abierta hasta que decidamos cerrarla
    # explícitamente (en nuestro caso, usando qdbus al final del script).

    # Muestra un mensaje indicando que se está activando el entorno virtual
    echo "Activando el entorno virtual..."

    # Activa el entorno virtual de Python
    source $HOME/.venv/bin/activate

    # Confirma que el entorno virtual ha sido activado
    echo "Entorno virtual activado."

    # Anuncia que se va a ejecutar el script de Python
    echo "Ejecutando test_venv.py..."

    # Ejecuta el script de Python
    python3 test_venv.py

    # Confirma que el script ha terminado de ejecutarse
    echo "Ejecución de test_venv.py completada."

    # Deja una línea en blanco para mejor legibilidad
    echo ""

    # Explica al usuario sus opciones
    echo "El entorno virtual sigue activo. Para desactivarlo, escribe \"deactivate\" y presiona Enter."
    echo "Para salir sin desactivar, simplemente presiona Enter."
    echo ""

    # Espera la entrada del usuario
    read -p "> " user_input

    # Si el usuario escribe "deactivate", desactiva el entorno virtual
    if [ "$user_input" = "deactivate" ]; then
        deactivate
        echo "Entorno virtual desactivado."
    fi

    # Indica al usuario cómo cerrar la ventana
    echo "Presiona Enter para cerrar esta ventana."
    read

    # Obtiene el ID del proceso de Konsole
    konsole_pid=$PPID

    # Usa qdbus para enviar un comando de cierre a la ventana de Konsole
    qdbus org.kde.konsole-$konsole_pid /konsole/MainWindow_1 org.qtproject.Qt.QWidget.close
' -p tabtitle=PFSLE  # Establece el título de la pestaña como "PFSLE"

#!/bin/bash

export NNN_PLUG='f:finder;o:execonbash;p:launch;v:imgview'

konsole -p tabtitle='PFSLE' -e nnn "auto-push-script.sh"

# export NNN_PLUG='f:finder;o:execonbash;p:launch;v:imgview'

# Este comando define una variable de entorno llamada NNN_PLUG que configura los plugins disponibles para el administrador de archivos de línea de comandos nnn. Los plugins son funciones adicionales que extienden las capacidades de nnn. Al exportar esta variable en tu archivo ~/.bashrc o en el script que lance nnn, haces que estos plugins estén disponibles

# export: Este comando establece una variable de entorno que estará disponible para todos los programas que se ejecuten en la sesión actual de la terminal.

# NNN_PLUG: Es la variable de entorno específica de nnn que se utiliza para definir y configurar los plugins.

# 'f:finder;o:execonbash;p:launch;v:imgview': Esta es la lista de plugins que se están configurando. Cada plugin se define con un par de valores separados por dos puntos (:), donde el primer valor es la tecla que activará el plugin y el segundo es el nombre del plugin. Los plugins en la lista son:

# f:finder: Asocia la tecla f con el plugin finder. Este plugin generalmente se utiliza para buscar archivos o directorios de manera interactiva.

# o:execonbash: Asocia la tecla o con el plugin execonbash. Este plugin se usa para ejecutar comandos en bash desde nnn.

# p:launch: Asocia la tecla p con el plugin launch. Este plugin se utiliza para lanzar archivos o aplicaciones según su tipo.

# v:imgview: Asocia la tecla v con el plugin imgview. Este plugin se utiliza para ver imágenes dentro de nnn.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# konsole -p tabtitle='PFSLE' -e nnn "auto-push-script-2.sh"

# Este comando ejecuta el terminal konsole con opciones específicas para abrir una nueva pestaña con un título personalizado y ejecutar un archivo de script utilizando el administrador de archivos nnn. Aquí está el desglose de cada parte del comando:

# konsole: Es el emulador de terminal predeterminado para el entorno de escritorio KDE en Linux.

# -p tabtitle='PFSLE': Esta opción establece el título de la pestaña en PFSLE. La opción -p permite pasar propiedades personalizadas a konsole. En este caso, la propiedad tabtitle se utiliza para cambiar el título de la pestaña.

# -e nnn "auto-push-script-2.sh": La opción -e especifica el comando que se ejecutará dentro de la terminal konsole. Aquí, se está utilizando nnn, que es un administrador de archivos de línea de comandos, para abrir el archivo de script auto-push-script-2.sh. Al abrir el archivo en nnn, puedes navegar por el archivo o ejecutarlo, pero en este caso usaremos el atajo de teclado "Shift + ;" para escribir ; y que se muestren las opciones key: f o p y con lo cual presionaremos o para que se ejecute el script.

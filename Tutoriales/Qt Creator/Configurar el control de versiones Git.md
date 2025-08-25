
Tengo instalado Qt Creator 9 en Debian 12, y al crear un proyecto hay una parte donde se puede añadir el control de versiones Git, y al darle clic en configurar aparece esto:

Pestaña Git

Configuration
Prepend to PATH:

Miscellaneous
Long count 100   Timeout 30s

[ ] Pull with rebase

Gitk
Arguments:

Repository Browser
Commnad: 


## Pestaña de Configuración de Git en Qt Creator


**Prepend to PATH**

Esto añade una ruta de directorio al **PATH** del sistema. Es útil si el ejecutable de Git no se encuentra en una ubicación estándar y el sistema operativo no puede encontrarlo automáticamente.

**Miscellaneous**

  * **Long count 100**: Establece un límite de 100 para el número de **commits** a mostrar en las vistas de registro. Esto ayuda a optimizar el rendimiento.
  * **Timeout 30s**: Es el tiempo de espera de 30 segundos para las operaciones de Git. Si una operación tarda más, se considera que ha fallado.

**Pull with rebase**

Al activar esta opción, al ejecutar el comando **git pull**, se usa la opción **--rebase**. Esto reorganiza los commits locales sobre los commits remotos en lugar de crear un nuevo commit de fusión.

**Gitk Arguments**

**Gitk** es una herramienta gráfica para explorar el historial de un repositorio de Git. En esta sección se pueden añadir argumentos de línea de comandos para personalizar su comportamiento.

**Repository Browser Command**

Esta opción permite especificar el comando de un navegador de repositorio de Git para abrirlo desde Qt Creator.

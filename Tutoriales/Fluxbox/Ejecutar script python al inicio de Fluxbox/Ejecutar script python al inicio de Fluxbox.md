### Ejecutar script python al inicio de Fluxbox

Imaginese el siguiente entorno:

#### Problema Inicial

Un usuario había creado un script en Python ubicado en la ruta `/home/wachin/Dev-python/xsct_gui/xsct_gui.py`. Cuando abría una terminal, ingresaba al directorio donde estaba el script y lo ejecutaba con:

```bash
cd /home/wachin/Dev-python/xsct_gui
python3 xsct_gui.py
```

Esto funcionaba perfectamente. Sin embargo, el usuario deseaba que este script se ejecutara automáticamente al iniciar el ordenador. Estaba utilizando Fluxbox como gestor de ventanas y había creado un lanzador en bash (`Launcher.sh`) para ejecutar el script al inicio.

#### Configuración del Lanzador

El usuario creó un archivo llamado `Launcher.sh` en la misma ruta que el script de Python, con el siguiente contenido:

```bash
#! /bin/bash

python3 xsct_gui.py
```

Luego, agregó el lanzador al archivo de inicio de Fluxbox (`~/.fluxbox/startup`) con la siguiente línea:

```bash
# xsct_gui python script
/home/wachin/Dev-python/xsct_gui/Launcher.sh &
```

#### Error Encontrado

A pesar de seguir estos pasos, al intentar ejecutar el lanzador manualmente desde la terminal, el siguiente error aparecía:

```bash
wachin@netinst:~$ /home/wachin/Dev-python/xsct_gui/Launcher.sh
python3: can't open file '/home/wachin/xsct_gui.py': [Errno 2] No such file or directory
```

Este error indicaba que, al intentar ejecutar el script desde el lanzador, el intérprete de Python estaba buscando el archivo `xsct_gui.py` en el directorio raíz del usuario (`/home/wachin/`) en lugar de en su ubicación real.

#### Causa del Problema

El problema radicaba en que el lanzador se estaba ejecutando desde un directorio diferente al esperado. El script estaba siendo llamado desde el directorio `~` (`/home/wachin/`), por lo que Python no podía encontrar el archivo `xsct_gui.py`, que en realidad estaba en el directorio `/home/wachin/Dev-python/xsct_gui`.

#### Solución

La solución consistió en modificar el archivo `Launcher.sh` para que primero cambiara al directorio correcto antes de intentar ejecutar el script de Python.

El archivo `Launcher.sh` fue modificado de la siguiente manera:

```bash
#! /bin/bash

cd /home/wachin/Dev-python/xsct_gui
python3 xsct_gui.py
```

Este script ahora cambia al directorio correcto antes de ejecutar el script `xsct_gui.py`.

#### Permisos de Ejecución

Para asegurarse de que el archivo `Launcher.sh` tuviera los permisos adecuados para ejecutarse, el usuario ejecutó el siguiente comando en la terminal:

```bash
chmod +x /home/wachin/Dev-python/xsct_gui/Launcher.sh
```

Este comando otorgó los permisos de ejecución al archivo `Launcher.sh`.

#### Verificación en Fluxbox

Finalmente, el archivo de inicio de Fluxbox (`~/.fluxbox/startup`) fue revisado para confirmar que la entrada correcta se había añadido:

```bash
# xsct_gui python script
/home/wachin/Dev-python/xsct_gui/Launcher.sh &
```

Con esta configuración, el script se ejecutó correctamente al iniciar el sistema, y también pudo ser lanzado manualmente desde la terminal sin errores.

#### Conclusión

Este tutorial muestra cómo solucionar problemas de rutas relativas cuando se ejecutan scripts al inicio del sistema en Linux. En resumen, es importante asegurarse de que los scripts se ejecuten en el directorio correcto utilizando `cd` dentro del lanzador, y siempre verificar que los permisos de ejecución sean los adecuados.

Dios les bendiga
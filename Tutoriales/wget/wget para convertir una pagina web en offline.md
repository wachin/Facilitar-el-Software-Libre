
Para hacer que una página web funcione offline es usando herramientas como **wget**, que permiten descargar el contenido de una página completa para verla sin conexión


### Usar `wget` para descargar el sitio web
`wget` también puede descargar sitios completos para usarlos sin conexión.

1. Instala `wget` (si aún no lo tienes instalado):

   ```
   sudo apt install wget
   ```

2. Descarga el sitio con `wget`:
   ```
   wget -m -k -p -E https://editor.codecogs.com -P ~/editor_codecogs_offline
   ```

   - `-m`: Activa el modo "mirror" para clonar todo el sitio.
   - `-k`: Convierte los enlaces para que funcionen localmente.
   - `-p`: Descarga todos los archivos necesarios para que funcione correctamente.
   - `-E`: Guarda los archivos HTML con la extensión `.html`.
   - `-P`: Define la carpeta de destino para la descarga.

3. Una vez descargado, abre el archivo `index.html`:
   ```
   xdg-open ~/editor_codecogs_offline/editor.codecogs.com/index.html
   ```

> **Limitación**: Es posible que algunos recursos dinámicos o dependencias externas no funcionen sin conexión, especialmente si el editor utiliza servicios en la nube.

Estas opciones deberían permitirte usar el editor en modo offline, aunque la funcionalidad puede estar limitada dependiendo de las dependencias online que tenga la página original.
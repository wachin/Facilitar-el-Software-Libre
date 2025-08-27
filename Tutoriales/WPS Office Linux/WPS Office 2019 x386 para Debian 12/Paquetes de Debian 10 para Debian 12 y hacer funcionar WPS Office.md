Gracias por el listado 🙌. Revisando tu árbol de instalación veo que están todos los **recursos**, `.so`, `.pak`, `.html`, etc., pero falta verificar lo más importante:


2. **Revisa `libtcmalloc`**:
   El script intenta cargar:

   ```
   /opt/kingsoft/wps-office/office6/libtcmalloc.so.4.5.3
   ```

   Si no existe, hay que cambiar el lanzador para no usar `LD_PRELOAD=$TCMALLOC_PATH`.

3. **Compatibilidad con Debian 12**:
   Esa versión antigua (`11.1.0.8392`, del 2019) fue compilada contra librerías viejas de Debian 10/Ubuntu 18.04.
   En Debian 12, librerías como `libc6`, `libstdc++6`, `libfreetype6`, `libpng12`, `libtiff4` o `libjpeg62` ya no están.
   Sin ellas, el binario ni siquiera arranca.

---

libc6

En Debian 12 están


libstdc++6      v 12.2.0-14+deb12u1

libfreetype6           v 2.12.1+dfsg-5+deb12u4
motor de tipografías de FreeType 2, archivos de biblioteca compartida

libpng16-16                        v 1.6.39-2
PNG library - runtime (version 1.6)

libtiff6               v 4.5.0-6+deb12u2
biblioteca de «Tag Image File Format» (TIFF)

libjpeg62-turbo           v 1:2.1.5-2
biblioteca de tiempo de ejecución libjpeg-turbo JPEG
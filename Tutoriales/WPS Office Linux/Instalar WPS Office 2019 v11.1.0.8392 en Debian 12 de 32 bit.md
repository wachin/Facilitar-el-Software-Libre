# Instalar WPS Office 2019 v11.1.0.8392 en Debian 12 de 32 bit 

3. **Compatibilidad con Debian 12**:
   Esa versión antigua (`11.1.0.8392`, del 2019) fue compilada contra librerías viejas de Debian 10/Ubuntu 18.04.
   En Debian 12, librerías como `libc6`, `libstdc++6`, `libfreetype6`, `libpng12`, `libtiff4` o `libjpeg62` ya no están.
   Sin ellas, el binario ni siquiera arranca.

## Solución

* **Instalar las librerías antiguas manualmente** (desde `debian oldstable`)
* **Migrar a la última versión de WPS Office Linux (2022 o 2023 de 64 bit)**, que sí tiene binarios para glibc modernos.



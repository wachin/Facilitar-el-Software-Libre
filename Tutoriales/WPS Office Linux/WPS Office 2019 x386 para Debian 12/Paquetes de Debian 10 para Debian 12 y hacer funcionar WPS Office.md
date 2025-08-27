Gracias por el listado 🙌. Revisando tu árbol de instalación veo que están todos los **recursos**, `.so`, `.pak`, `.html`, etc., pero falta verificar lo más importante:

* En `/opt/kingsoft/wps-office/office6/` debería haber los **binarios principales**:
  `wps`, `et`, `wpp`, `wpp`, y también bibliotecas críticas como `libtcmalloc.so.4.5.3`.

En tu listado (lo que alcanzamos a ver) aparecen muchos subdirectorios, pero **no aparece el ejecutable `wps` dentro de `office6/`**, que es lo que tu lanzador intenta abrir:

```bash
/opt/kingsoft/wps-office/office6/wps
```

👉 Si ese archivo binario no existe, el script nunca va a arrancar nada, aunque todo lo demás esté instalado.

---

### Qué podemos hacer:

1. **Confirma si existen los binarios**:

   ```bash
   ls -lh /opt/kingsoft/wps-office/office6/ | grep wps
   ls -lh /opt/kingsoft/wps-office/office6/ | grep et
   ls -lh /opt/kingsoft/wps-office/office6/ | grep wpp
   ```

   Si no están, la instalación quedó incompleta o ese `.deb` que usabas en Debian 10/11 ya no trae ejecutables compatibles.

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

### Próximos pasos que te recomiendo:

* Confirma si **el binario `wps` existe dentro de `office6`**.
* Si está, prueba a ejecutarlo directamente para ver el error real:

  ```bash
  /opt/kingsoft/wps-office/office6/wps
  ```
* Si no está → ese `.deb` ya no sirve en Debian 12 (instala solo recursos, no los ejecutables).

En ese caso, habría que:

* **Instalar las librerías antiguas manualmente** (desde `debian oldstable` o con `multiarch`), o
* **Migrar a la última versión de WPS Office Linux (2022 o 2023)**, que sí tiene binarios para glibc modernos.

---

¿Quieres que te prepare una guía para:
🔹 1) intentar **hacer funcionar esa versión 2019 en Debian 12** instalando librerías antiguas faltantes, o
🔹 2) mejor **migrar a una versión más nueva de WPS Office** que sí es compatible?

# Instalación de fuentes tipográficas de Windows en Linux

En muchas guías antiguas se recomienda copiar las fuentes de Windows a la carpeta personal `~/.fonts`.  
Esto **sigue siendo funcional en 2025**, pero el archivo de configuración de Fontconfig en Debian 12:

/etc/fonts/fonts.conf

indica claramente:

```xml
<dir prefix="xdg">fonts</dir>
<!-- the following element will be removed in the future -->
<dir>~/.fonts</dir>
```

Esto significa que `~/.fonts` **será removida en el futuro**, y la ubicación recomendada según el estándar **XDG Base Directory** es:

```
~/.local/share/fonts
```

Por lo tanto, si instalas fuentes solo para tu usuario, es mejor usar esa ruta recomendada para ya ir acostumbrandose

## Instalación de fuentes para todo el sistema

Si el equipo tiene **varios usuarios** y todos necesitan las fuentes de Windows, se deben instalar **para todo el sistema**.

### ¿Dónde van las fuentes del sistema?

Las fuentes del sistema en Linux se guardan en:

/usr/share/fonts/truetype/

Podemos crear una carpeta nueva, por ejemplo:

/usr/share/fonts/truetype/windows

y dentro de ella pegar todas las fuentes de Windows.

## ¿Cómo copiar las fuentes sin usar la terminal?

Para mover archivos a esa carpeta necesitamos permisos de administrador. Hay varias formas de hacerlo gráficamente:

### 1. Usando **Krusader**

1.) Instalar Krusader (si no lo tiene):

```bash
sudo apt install krusader
```

2.) Ejecutar Krusader como superusuario:

```bash
sudo krusader
```

3.) Navegar a la carpeta donde tienes las fuentes de Windows y copiarlas.
4.)Abrir una pestaña con `Ctrl + T` e ir a `/usr/share/fonts/truetype/`, crear la carpeta `windows` y pegar allí las fuentes.
   *(También puedes hacerlo usando el otro panel en lugar de crear una pestaña).*

### 2. Usando **Double Commander (GTK o QT)**

1.) Instalar Double Commander:

```bash
sudo apt install doublecmd-gtk
```

o si usas KDE Plasma o LXQT:

```bash
sudo apt install doublecmd-qt
```

2.) Ejecutar Double Commander con permisos de superusuario:

```bash
sudo doublecmd-gtk
```

o:

```bash
sudo doublecmd-qt
```

3.) Copiar las fuentes a `/usr/share/fonts/truetype/windows`.

## Consejos para usar el administrador de archivos como superusuario

* **Tenga mucho cuidado** de no borrar ni mover carpetas o archivos del sistema operativo. Si elimina o mueve algo crítico, el sistema puede dejar de funcionar y podría ser necesario reinstalarlo.
* **No abra sus archivos personales (imágenes, documentos, etc.)** desde el administrador de archivos ejecutado como superusuario.
  Esto se debe a que el programa que abre esos archivos puede heredar permisos de superusuario y cambiar la propiedad de los mismos, provocando que luego no pueda acceder a ellos desde su usuario normal.
* **Cierre el administrador de archivos cuando termine de usarlo como superusuario.**
  Dejarlo abierto puede ser peligroso porque, al volver más tarde y olvidar que sigue con permisos de administrador, podría borrar o mover algo importante sin darse cuenta.

## Actualizar el caché de fuentes (opcional)

Después de copiar las fuentes, se recomienda actualizar el caché de fuentes:

```bash
sudo fc-cache -fv
```

### 🔁 ¿Cuándo sí se necesita `fc-cache -fv`?

1. **Cuando instalas fuentes en directorios no estándar**, como uno que creaste manualmente o no es reconocido automáticamente.
2. **Cuando haces scripts automatizados o instalaciones sin sesión gráfica activa**, por ejemplo en servidores o instalaciones masivas.
3. **Cuando un programa específico no detecta la fuente nueva**, a pesar de reiniciarlo.
4. **Cuando tienes problemas con fuentes corruptas, cache antigua o conflictos**, y necesitas regenerar toda la caché de fuentes.

### ✅ RESUMEN

Cuando instalas una fuente en directorios estándar como:

* `~/.fonts` (obsoleto pero aún funcional en muchos sistemas)
* `~/.local/share/fonts` (recomendado para instalaciones por usuario)
* `/usr/share/fonts` (para todo el sistema)

el sistema detecta automáticamente los archivos `.ttf`, `.otf`, etc. La mayoría de los entornos de escritorio modernos y programas (como LibreOffice, GNOME, KDE, etc.) **usan `fontconfig`**, que suele monitorear automáticamente los cambios en esos directorios.

LibreOffice, al reiniciarse, vuelve a cargar las fuentes disponibles a través de `fontconfig`, por eso ya te aparecen sin hacer nada.


### 📜 Un poco de historia

Durante mucho tiempo, el lugar "de facto" para instalar fuentes a nivel de usuario era:

* `~/.fonts` (es decir, una carpeta `.fonts` en tu directorio personal)

Este método funcionaba bien y era el más documentado en distros como Debian, Ubuntu, etc., desde antes de 2010. Muchos tutoriales antiguos (y aún varios actuales) siguen recomendando esta ruta.

---

### 🆕 ¿Qué cambió?

A partir de las **especificaciones de XDG** (X Desktop Group), las distribuciones comenzaron a migrar a una estructura más estandarizada para los archivos de usuario. En esa estructura:

* Los datos del usuario se almacenan en `~/.local/share/`
* Por tanto, las **fuentes por usuario** se instalan en:

  ```
  ~/.local/share/fonts
  ```

Este cambio fue adoptado gradualmente, y **`fontconfig` desde versiones modernas (como la que trae Debian 12)** reconoce y monitorea automáticamente esa ruta como válida para fuentes.
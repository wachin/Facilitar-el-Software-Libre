## Cómo instalar Fuentes TrueType de Windows en Linux

Si tienes una copia de Windows puedes entrar en la sesión de Windows y copiar las fuentes ubicadas en:

 `C:\Windows\Fonts`

y pegarlas en un pendrive una carpeta creada con tal fin.

También si tienes Dual Boot o si usas un Pendrive con Linux portable puedes Inicia sesión en Linux y Copia los archivos de fuentes (`.ttf`) desde `C:\Windows\Fonts` 

- Luego **Crea un directorio para las fuentes** (por ejemplo, en tu home) Para ver los archivos ocultos usa Ctrl + H para ver los archivos ocultos:

.fonts/windows_fonts

esto para el usuario actual

o

`/usr/share/fonts/windows_fonts`

para todos los usuarios, pero deberás hacer esto como superusuario

   - **Copia todos los archivos TTF, OTF y TTC**

puedes hacerlo con tu administrador de archivos favorito como Thunar, Nemo, Nautilus, Dolphin, etc

   - **Ignora los archivos `.fon`**, ya que no funcionarán, o borralos después.
  
   - **Actualiza la caché de fuentes (opcional)**:
     ```bash
     fc-cache -fv
     ```
Actualizar la cache es opcional pues los programas después de cerrarlos y abrirlos otra vez reconocerán las fuentes nuevas.

---

La mayoría de las fuentes que has copiado desde Windows 10 **funcionarán en Linux Debian**, pero hay algunas consideraciones importantes según el formato de los archivos:

---

### 1. Formatos compatibles en Linux:
   - **TTF (TrueType Font)**: Sí, son totalmente compatibles.
   - **OTF (OpenType Font)**: También son compatibles.
   - **TTC (TrueType Collection)**: Son archivos que contienen múltiples fuentes en un solo archivo. Linux puede manejarlos, pero a veces requieren herramientas como `fontforge` para extraer las fuentes individuales y que funcionen.
   - **FON (Windows Bitmap Font)**: **No son compatibles directamente**. Son fuentes bitmap antiguas de Windows y no funcionarán bien en Linux (ej: `app850.fon`, `coure.fon`, `modern.fon`, `roman.fon`, `script.fon`, `smalle.fon`, `sserife.fon`, `vga850.fon`, `vgafix.fon`, `vgasys.fon`).

---

### 2. Fuentes que NO funcionarán bien o requieren conversión:
   - Los archivos `.fon` (como `app850.fon`, `coure.fon`, etc.) **no son útiles en Linux**. Estas fuentes son específicas de Windows y no se renderizan correctamente en entornos Linux modernos.
   - Algunos archivos `.ttc` (como `cambria.ttc`, `mingliub.ttc`, etc.) pueden requerir extracción de sus componentes con herramientas como `fontforge` para usarlos individualmente.

---

### 3. Verificación:
   - Usa herramientas como `gnome-font-viewer`,  `fontmatrix` o `font-manager` para confirmar que las fuentes se reconocen.
  
---

### 4. Notas adicionales:
   - **Licencias**: Algunas fuentes de Windows (como Calibri, Cambria, Segoe UI) son propiedad de Microsoft.
   - **Fuentes TTC**: Si necesitas extraer fuentes individuales de un archivo `.ttc`, instala `fontforge`:
     ```bash
     sudo apt install fontforge
     ```
     Luego ábrelo, carga el `.ttc` y guárdalas como archivos `.ttf` separados.

---

### Resumen:
- **Funcionarán**: Todos los archivos `.ttf`, `.otf` y algunos `.ttc` (con herramientas).
- **No funcionarán**: Los archivos `.fon`
- **Recomendación**: Elimina los archivos `.fon` y usa las fuentes TTF/OTF restantes.

   - Luego actualiza la caché de fuentes con:
    ```bash
    fc-cache -fv
    ```
---

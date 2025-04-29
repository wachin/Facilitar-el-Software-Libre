# Tutorial de Nano

## Introducción
Nano es un editor de texto sencillo y fácil de usar, ideal para principiantes en sistemas Unix/Linux. A diferencia de otros editores como Vim o Emacs, Nano tiene una interfaz intuitiva y comandos claros, lo que lo hace perfecto para editar archivos de texto desde la línea de comandos.

**Nota**: Si estás familiarizado con otros editores como Vim, notarás que Nano no requiere aprender modos de edición complejos, lo que lo convierte en una excelente opción para principiantes.

---

## Abrir un archivo
Para abrir un archivo en Nano, usa el siguiente comando en la terminal:

```bash
nano nombre_del_archivo
```

- Si el archivo no existe, Nano lo creará automáticamente.
- Para abrir un archivo en una ubicación específica, usa la ruta completa. Por ejemplo:

```bash
nano /ruta/al/archivo/miarchivo.txt
```

---

## **Editar el archivo**
Una vez dentro de Nano:
1. Usa las **flechas del teclado** para moverte arriba, abajo, izquierda y derecha.
2. Escribe directamente para insertar texto en la posición del cursor.
3. Usa **Backspace** para borrar caracteres antes del cursor y **Delete** para borrar caracteres después del cursor.
4. Si estás en una terminal gráfica, puedes seleccionar texto con el mouse para copiar y pegar.

---

## **Guardar el archivo**
Para guardar los cambios:
1. Presiona `Ctrl + O` (abreviado como `^O` en Nano).
2. Nano te pedirá confirmación del nombre del archivo. Si deseas guardarlo con el mismo nombre, simplemente presiona **Enter**.
3. Si deseas cambiar el nombre del archivo al guardarlo, escribe el nuevo nombre y luego presiona **Enter**.

**Ejemplo:**
```plaintext
Nombre del fichero a escribir: miarchivo_nuevo.txt
```

---

## **Cerrar Nano**
Para salir de Nano:
1. Presiona `Ctrl + X` (abreviado como `^X` en Nano).
2. Si has realizado cambios sin guardar, Nano te preguntará si deseas guardarlos:
   - Presiona **Y** para guardar los cambios.
   - Presiona **N** para descartar los cambios.

---

## **Comandos básicos**
Aquí tienes una lista de los comandos más útiles en Nano, organizados en una tabla para facilitar su consulta:

| Comando          | Acción                              |
|------------------|-------------------------------------|
| Ctrl + O         | Guardar el archivo                 |
| Ctrl + X         | Salir del editor                   |
| Ctrl + K         | Cortar una línea                   |
| Ctrl + U         | Pegar una línea                    |
| Ctrl + W         | Buscar texto                       |
| Ctrl + Y         | Moverse al principio del archivo   |
| Ctrl + V         | Moverse al final del archivo       |
| Ctrl + G         | Abrir el menú de ayuda             |
| Alt + C          | Alternar búsqueda sin distinguir mayúsculas/minúsculas |
| Alt + L          | Habilitar/deshabilitar ajuste de línea |

---

## **Búsqueda de texto**
Para buscar texto dentro de un archivo:
1. Presiona `Ctrl + W` (abreviado como `^W` en Nano).
2. Escribe el texto que deseas buscar y presiona **Enter**.
3. Nano te llevará a la primera coincidencia. Para buscar la siguiente coincidencia, presiona `Ctrl + W` nuevamente y luego **Enter**.

**Consejo**: Si deseas que la búsqueda no distinga entre mayúsculas y minúsculas, presiona `Alt + C` antes de comenzar la búsqueda.

**Ejemplo práctico**:
Si buscas la palabra "configuración":
1. Presiona `Ctrl + W`.
2. Escribe "configuración" y presiona **Enter**.
3. Nano resaltará la primera coincidencia. Usa `Ctrl + W` para buscar la siguiente.

---

## **Consejos adicionales**
- **Ajuste de línea**: Si trabajas con archivos largos, puedes habilitar o deshabilitar el ajuste de línea presionando `Alt + L`. Esto es útil para evitar que las líneas se extiendan horizontalmente.
- **Menú de ayuda**: Si olvidas algún comando, presiona `Ctrl + G` para abrir el menú de ayuda. Este menú muestra una lista completa de atajos de teclado y sus funciones.
- **Salir del menú de ayuda**: Presiona `Ctrl + X` dos veces para salir del menú de ayuda.

---

## **Resumen**
Nano es un editor de texto poderoso y fácil de usar, ideal para principiantes y usuarios avanzados que necesitan una herramienta rápida y confiable. Con este tutorial, ahora sabes cómo:
- Abrir, editar y guardar archivos.
- Usar comandos básicos como cortar, pegar y buscar texto.
- Aplicar consejos avanzados como ajuste de línea y búsqueda sin distinguir mayúsculas/minúsculas.

---

### **Referencias adicionales**
- Si deseas explorar más sobre Nano, puedes consultar su página de manual ejecutando:
  ```bash
  man nano
  ```
- También puedes personalizar Nano editando su archivo de configuración, generalmente ubicado en `~/.nanorc`.

---

Dios te bendiga
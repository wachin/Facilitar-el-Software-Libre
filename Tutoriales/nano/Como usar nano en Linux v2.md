### Cómo usar nano en la terminal de Linux para editar archivos de texto

Publicadas por [Washington Indacochea Delgado](https://www.blogger.com/profile/17773143494819856315 "author profile")  [agosto 07, 2024](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html "permanent link")

Nano es un editor de texto sencillo, ideal para principiantes en sistemas Unix/Linux. A diferencia de otros editores como Vim o Emacs, Nano tiene una interfaz intuitiva y comandos claros, lo que lo hace perfecto para editar archivos de texto desde la línea de comandos, solo que debemos de aprender a usarlo desde cero, es como si necesitáramos borrar de nuestra mente el modo normal de edición de texto en cualquier programa con interfaz gráfica, para poder entender cómo hacerlo desde la terminal con nano (y necesitamos memorizar sus comandos).

**Nota**: Si estás familiarizado con otros editores como [Vim](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html), notarás que Nano no requiere aprender modos de edición complejos, lo que lo convierte en una excelente opción para principiantes.

### Abrir un archivo

Para abrir un archivo con `nano`, usa el siguiente comando en la terminal:

    nano nombre_del_archivo


Si el archivo no existe, `nano` creará uno nuevo.

**Nota**: Puedes usar ls para ver los archivos disponibles en el directorio.

### Ejemplo práctico

Imaginemos que quieres crear y editar un archivo llamado `miarchivo.txt`:

Abre la terminal.

Escribe:

    nano miarchivo.txt


    y presiona Enter



### **Editar el archivo**

Una vez dentro de Nano:

1.  Usa las **flechas del teclado** para moverte arriba, abajo, izquierda y derecha.
2.  Escribe directamente para insertar texto en la posición del cursor.
3.  Usa **Backspace (Retroceso)** para borrar caracteres antes del cursor y **Delete (Supr)** para borrar caracteres después del cursor.
4.  Si estás en una terminal gráfica, puedes seleccionar texto con el mouse para copiar y pegar.

**Guardar el archivo en nano**:
\- Presiona Ctrl + O ("Control" y 'O") para guardar los cambios.

\- nano te pedirá confirmación para el nombre del archivo (te muestra el nombre del archivo, con su extensión si la tuviera), presiona Enter para confirmar la escritura en el archivo miarchivo.txt

**Nota**: Nano abrevia CTRL con ^, así CTRL + O es igual a:

^O

y en nano aparece así:

^O Guardar

por eso para guardar aplaste:

CTRL + O

y aparecerá un mensaje que dice algo así:

Nombre del fichero a escribir: miarchivo.txt

y de ENTER

**Cerrar nano**:
─ Presiona Ctrl + X (Control y X al mismo tiempo) para salir del editor nano.

**Nota**: Nano abrevia CTRL con ^, así CTRL + X es igual a:

^X

y en nano apare así:

^X Salir

que es para Salir

### Comandos básicos

Varios comandos en `nano` se ejecutan usando la tecla `Ctrl` (Control) en combinación con otra tecla. Aquí tienes algunos comandos útiles:

-   **Flechas del teclado**: Usa las teclas de flecha para moverte arriba, abajo, izquierda y derecha.
-   **Escribir texto**: Simplemente empieza a escribir para insertar texto en la posición del cursor.
-   **Borrar texto**: Usa la tecla `Backspace` para borrar caracteres antes del cursor y `Delete` para borrar caracteres después del cursor.
-   **Guardar el archivo**: `Ctrl + O` (luego presiona `Enter` para confirmar).
-   **Salir de `nano`**: `Ctrl + X`.
-   **Cortar una línea**: `Ctrl + K`.
-   **Pegar una línea**: `Ctrl + U`.
-   **Buscar texto**: `Ctrl + W` (luego escribe el texto que quieres buscar y presiona `Enter`).
-   Subir una **pantalla completa** (Retroceder una página): `Ctrl + Y`.
-   Bajar una **pantalla completa** (Avanzar una página): `Ctrl + V`.
-   **Moverse entre varias palabras**: Sostener `Ctrl` y usar las Flechas izquierda o derecha.
-   **Borrar palabras enteras hacia la izquierda**: Ubicándose a la derecha de la palabra que de sea borrar usar `Ctrl + Shift + Supr`, esto se puede hacer varias veces si hay más palabras a la izquierda.

## **Moverse al principio y al final del archivo:**

En Nano, los atajos para ir al **inicio** y al **final** del archivo son:

-   **Ctrl + \_** (luego `1` y da Enter) → ir a la línea 1 (inicio del archivo).

-   **Ctrl + \_** (luego una línea muy alta, por ejemplo escribe en el teclado los números `9999` y da Enter) → ir al final.


## **Moverse a una línea específica del archivo:**

Si deseas ir a una línea específica, ejemplo a la línea 3 pon:

-   **Ctrl + \_** luego escribe `3` → ir a la línea 3. (Es útil, por ejemplo, cuando un mensaje de error dice que hay un problema en la línea 42.)


## ¿Cómo seleccionar mucho texto y borrarlo en Nano?

Nano **no tiene selección con el mouse** para cortar texto en modo consola pura (solo funciona en terminales gráficas con soporte de ratón), pero puedes **usar atajos de teclado para marcar bloques de texto y eliminarlos**:

### 📝 **Pasos para seleccionar y borrar mucho texto en Nano**

1.  **Ubica el cursor al inicio del texto** que quieres borrar.

2.  **Presiona `Esc + A`** Esto activa el **modo de selección** (si lo presionas otra vez lo desactivas)

3.  **Mueve el cursor** con las teclas de flecha para seleccionar el bloque deseado (verás que el cursor empieza a marcar texto a medida que te mueves).

4.  **Presiona `Ctrl + K`** para **cortar** el texto seleccionado (esto lo elimina del archivo y lo copia al portapapeles interno de Nano).


> 💡 Puedes luego pegarlo en otro lugar con `Ctrl + U`, si lo necesitas.

### 🧪 Ejemplo práctico:

Supón que quieres borrar cinco líneas completas:

-   Coloca el cursor en el inicio de la primera línea.

-   Presiona `Esc + A`.

-   Baja con la flecha ↓ hasta seleccionar las cinco líneas.

-   Presiona `Ctrl + K`.


¡Listo! Todo el bloque será eliminado.

### 🔍 ¿Qué significa “M-U” en Nano?

Si necesitamos deshacer lo que hemos borrado (u otra cosa que hagamos hecho) debemos entender lo siguiente:

-   **`M` = Meta**, que en la mayoría de los teclados y terminales modernos se interpreta como la tecla **`Alt`**. No se refiere a la letra "M" como tal, ni tampoco a la tecla de Windows.

-   Por lo tanto, **`M-U` significa `Alt + U`**.


### ✅ Cómo deshacer una acción en Nano

-   Presiona **`Alt + U`** para **deshacer** la última acción.

-   Presiona **`Alt + E`** para **rehacer** (esto es útil si te arrepientes de un deshacer).


### 💡 Importante:

-   Es necesario repetirlo otra vez para evitar una confusión, no uses la tecla `"M"` como tal.

-   En algunos teclados o entornos (como ciertos emuladores de terminal en Windows o terminales personalizadas), puede que tengas que usar **`Esc` seguido de la tecla** en vez de mantener `Alt`. Es decir:

-   Presiona **`Esc + U`** para **deshacer** la última acción.

-   Presiona **`Esc + E`** para **rehacer** (esto es útil si te arrepientes de un deshacer).


    Esto así mismo simula `Alt + U` y `Alt + E`. Y si encuentras alguna otra vez que nano muestre una "**M**" ya sabemos que hacer.


## Cómo buscar palabras en un texto usando nano

Para buscar texto dentro de un archivo en `nano`, el editor de texto en línea de comandos, puedes usar el siguiente proceso:

## **Búsqueda de texto**

Para buscar texto dentro de un archivo:

1.  Presiona `Ctrl + W` (abreviado como `^W` en Nano).
2.  Escribe el texto que deseas buscar y presiona **Enter**.
3.  Nano te llevará a la primera coincidencia. Para buscar la siguiente coincidencia, presiona `Ctrl + W` nuevamente y luego **Enter**.

**Consejo**: Si deseas que la búsqueda no distinga entre mayúsculas y minúsculas, presiona `Alt + C` antes de comenzar la búsqueda.

**Ejemplo práctico**: Si buscas la palabra "configuración":

1.  Presiona `Ctrl + W`.
2.  Escribe "configuración" y presiona **Enter**.
3.  Nano resaltará la primera coincidencia. Usa `Ctrl + W` para buscar la siguiente.

* * *

## **Consejos adicionales**

-   **Ajuste de línea**: Si trabajas con archivos largos, puedes habilitar o deshabilitar el ajuste de línea presionando `Alt + L`. Esto es útil para evitar que las líneas se extiendan horizontalmente.
-   **Menú de ayuda**: Si olvidas algún comando, presiona `Ctrl + G` para abrir el menú de ayuda. Este menú muestra una lista completa de atajos de teclado y sus funciones.
-   **Salir del menú de ayuda**: Presiona `Ctrl + X` (tal vez tengas que presionarlo dos veces para salir del menú de ayuda).

### **Referencias adicionales**

-   Si deseas explorar más sobre Nano, puedes consultar su página de manual ejecutando:

        man nano



Dios les bendiga


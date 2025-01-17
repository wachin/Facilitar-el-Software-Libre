`nano` es un editor de texto muy popular en sistemas Unix y Linux. Es sencillo y fácil de usar, ideal para editar archivos de texto desde la línea de comandos

### Abrir un archivo

Para abrir un archivo con `nano`, usa el siguiente comando en la terminal:

```
nano /ruta/del/archivo/nombre_del_archivo.extension
```

Si el archivo no existe, `nano` creará uno nuevo.

### Ejemplo práctico

Imaginemos que quieres crear y editar un archivo llamado `miarchivo.txt` que está en:

Documentos

Abre la terminal.

Escribe:

```
nano /Documentos/miarchivo.txt
```

y presiona Enter

Editar el archivo en nano**: Para editar texto en nano que ya tiene texto es muy sencillo, después que ya tiene abierto el archivo de texto en nano solo tiene que ubicarse en la posicion adecuada del documento donde usted quiere editar algo, ubicarse con las flechas del teclado y comenzar a escribir (o pegar "Ctrl + V") texto

**Guardar el archivo en nano**:
─ Presiona Ctrl + O (Control y O al mismo tiempo) para guardar los cambios. ─ nano te pedirá confirmación para el nombre del archivo, presiona Enter para confirmar la escritura en el archivo miarchivo.txt

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

Los comandos en `nano` se ejecutan usando la tecla `Ctrl` (Control) en combinación con otra tecla. Aquí tienes algunos comandos útiles:

- **Flechas del teclado**: Usa las teclas de flecha para moverte arriba, abajo, izquierda y derecha.
- **Escribir texto**: Simplemente empieza a escribir para insertar texto en la posición del cursor.
- **Borrar texto**: Usa la tecla `Backspace` para borrar caracteres antes del cursor y `Delete` para borrar caracteres después del cursor.
- **Guardar el archivo**: `Ctrl + O` (luego presiona `Enter` para confirmar).
- **Salir de nano**: `Ctrl + X`.
- **Cortar una línea**: `Ctrl + K`.
- **Pegar una línea**: `Ctrl + U`.
- **Buscar texto**: `Ctrl + W` (luego escribe el texto que quieres buscar y presiona `Enter`).
- **Moverse al principio del archivo**: `Ctrl + Y`.
- **Moverse al final del archivo**: `Ctrl + V`.
- **Moverse entre varias palabras**: Sostener `Ctrl` y usar las Flechas izquierda o derecha.
- **Borrar palabras enteras hacia la izquierda**: Ubicándose a la derecha de la palabra que de sea borrar usar `Ctrl + Shift + Supr`, esto se puede hacer varias veces si hay más palabras a la izquierda.

Si necesita ayuda adicional mientras usas `nano`, puedes presionar `Ctrl + G` para abrir el menú de ayuda, y usa Ctrl + X dos veces para salir.

Dios les bendiga
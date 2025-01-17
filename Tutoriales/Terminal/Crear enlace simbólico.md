Para crear un enlace simbólico en Linux desde la terminal, puedes usar el comando `ln` con la opción `-s`. La sintaxis general es:

```bash
ln -s [archivo_o_directorio_origen] [enlace_simbólico_destino]
```

Aquí tienes un ejemplo concreto:

1. Supongamos que tienes un archivo llamado `archivo_original.txt` en el directorio `/home/usuario/documentos`.
2. Quieres crear un enlace simbólico a este archivo en el directorio `/home/usuario/escritorio` y llamarlo `enlace_a_archivo.txt`.

El comando sería:

```bash
ln -s /home/usuario/documentos/archivo_original.txt /home/usuario/escritorio/enlace_a_archivo.txt
```

Este comando creará un enlace simbólico llamado `enlace_a_archivo.txt` en el escritorio, que apunta al archivo `archivo_original.txt` en el directorio de documentos.

### Enlaces simbólicos a directorios

También puedes crear enlaces simbólicos a directorios de la misma manera. Por ejemplo:

```bash
ln -s /home/usuario/documentos /home/usuario/escritorio/enlace_a_documentos
```

Esto creará un enlace simbólico llamado `enlace_a_documentos` en el escritorio, que apunta al directorio `documentos`.

### Verificación

Para verificar que el enlace simbólico se ha creado correctamente, puedes usar el comando `ls -l`:

```bash
ls -l /home/usuario/escritorio/enlace_a_archivo.txt
```

Esto debería mostrar algo como:

```bash
lrwxrwxrwx 1 usuario usuario 35 jul 18 12:00 /home/usuario/escritorio/enlace_a_archivo.txt -> /home/usuario/documentos/archivo_original.txt
```

Donde `->` indica que es un enlace simbólico que apunta al archivo original.

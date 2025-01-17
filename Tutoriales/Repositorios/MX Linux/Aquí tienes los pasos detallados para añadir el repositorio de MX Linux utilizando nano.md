Aquí tienes los pasos detallados para añadir el repositorio utilizando `nano`:

1.)  **Abrir la terminal**: Puedes abrir la terminal presionando `Ctrl + Alt + T` o buscándola en el menú de aplicaciones.

2.)  **Abrir el archivo `/etc/apt/sources.list` con `nano`**:

```bash
sudo nano /etc/apt/sources.list
```

3.) **Editar el archivo en `nano`**:
    ─ Navega hasta el final del archivo usando las teclas de flecha.
    ─ Añade la siguiente línea al final del archivo:

```bash
deb http://mxrepo.com/mx/repo/ bookworm main non-free
```

4.) **Guardar el archivo en `nano`**:
    ─ Presiona `Ctrl + O` (Control y O al mismo tiempo) para guardar los cambios.
    ─ `nano` te pedirá confirmación para el nombre del archivo, presiona `Enter` para confirmar.

5.) **Cerrar `nano`**:
    ─ Presiona `Ctrl + X` (Control y X al mismo tiempo) para salir del editor `nano`.


6.) **Actualizar la lista de repositorios**:
    ─ Una vez que hayas cerrado `nano`, ejecuta el siguiente comando para actualizar la lista de paquetes disponibles:

```bash
sudo apt update
```

Siguiendo estos pasos, habrás añadido el repositorio y actualizado la lista de paquetes en tu sistema.
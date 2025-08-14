estoy usando debian 12 con openbox, y aquí no está ninguna herramienta para configurar la velocidad del touchpad de mi laptop dell inspiron 1750, y veo que está instalado el paquete

xserver-xorg-input-libinput


que en synaptic veo que contiene

```plaintext
/.
/usr
/usr/lib
/usr/lib/xorg
/usr/lib/xorg/modules
/usr/lib/xorg/modules/input
/usr/lib/xorg/modules/input/libinput_drv.so
/usr/share
/usr/share/X11
/usr/share/X11/xorg.conf.d
/usr/share/X11/xorg.conf.d/40-libinput.conf
/usr/share/bug
/usr/share/bug/xserver-xorg-input-libinput
/usr/share/bug/xserver-xorg-input-libinput/script
/usr/share/doc
/usr/share/doc/xserver-xorg-input-libinput
/usr/share/doc/xserver-xorg-input-libinput/changelog.Debian.gz
/usr/share/doc/xserver-xorg-input-libinput/changelog.Debian.i386.gz
/usr/share/doc/xserver-xorg-input-libinput/changelog.gz
/usr/share/doc/xserver-xorg-input-libinput/copyright
/usr/share/man
/usr/share/man/man4
/usr/share/man/man4/libinput.4.gz
```


Para configurar la velocidad del touchpad en Debian 12 con Openbox y `libinput`, puedes seguir estos pasos:

### 1. **Verificar el dispositivo identificado por libinput**
Ejecuta el siguiente comando para listar los dispositivos de entrada:
```bash
libinput list-devices
```
Busca la sección correspondiente a tu touchpad (generalmente identificado como "DLL075B:01 06CB:76AF Touchpad" o similar).

---

### 2. **Crear o modificar un archivo de configuración para libinput**
Crea un archivo de configuración personalizado en `/etc/X11/xorg.conf.d/` (si el directorio no existe, créalo):
```bash
sudo mkdir -p /etc/X11/xorg.conf.d
sudo nano /etc/X11/xorg.conf.d/30-touchpad.conf
```

Agrega el siguiente contenido (ajusta las opciones según necesites):
```plaintext
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
    Option "AccelSpeed" "0.5"           # Velocidad (-1 a 1, 0=predeterminado)
    Option "Tapping" "on"               # Habilitar toques (tap)
    Option "NaturalScrolling" "false"   # Desactivar scroll natural
    Option "DisableWhileTyping" "on"    # Desactivar al escribir
EndSection
```

- **`AccelSpeed`**: Controla la velocidad del touchpad. Valores típicos:
  - `0` (predeterminado).
  - `0.5` para más rápido.
  - `-0.5` para más lento.
- **`Tapping`**: Habilita/deshabilita el "tap" para hacer clic.
- **`NaturalScrolling`**: Invierte la dirección del scroll.

---

### 3. **Reiniciar la sesión X11**
Guarda el archivo y reinicia tu sesión de Openbox (cierra sesión y vuelve a entrar, o reinicia el servidor X con `Ctrl+Alt+Backspace` si está habilitado).

---

### 4. **Alternativa: Configuración temporal con `xinput`**
Si prefieres probar ajustes sin reiniciar, usa `xinput`:
```bash
xinput list  # Identifica el ID del touchpad
xinput list-props <ID>  # Muestra propiedades actuales
xinput set-prop <ID> "libinput Accel Speed" 0.5  # Cambia velocidad
```

---

### 5. **Documentación de libinput**
Para ver todas las opciones disponibles:
```bash
man libinput
```
O consulta la [documentación oficial de libinput](https://wayland.freedesktop.org/libinput/doc/latest/).

---

### Notas adicionales:
- Si el touchpad no es detectado correctamente, verifica que el kernel lo reconoce con:
  ```bash
  ls /proc/bus/input/devices
  ```
- Si usas Wayland (poco común en Openbox), la configuración se maneja vía `libinput` en el compositor (ej: Sway, GNOME).

Con esto deberías poder ajustar la velocidad y otras opciones del touchpad. ¡Espero que te sirva!
# Mi laptop Dell inspiron 1750 en Debian 12 no le funciona el doble clic del touchpad, pero esto si me funcionaba en Debian 11, SOLUCIÓN



El doble clic del touchpad que funcionaba en Debian 11 ahora no funciona en Debian 12 en mi laptop Dell Inspiron 1750, para resolverlo:

1. Actualiza los controladores:
   Asegúrate de tener los controladores más recientes instalados. Puedes intentar:
   ```
   sudo apt update
   sudo apt upgrade
   ```

2. Verifica la configuración del touchpad:
   Abre la configuración del sistema y busca las opciones del touchpad. Asegúrate de que el doble clic esté habilitado.

3. Usa xinput para verificar la configuración:
   Ejecuta `xinput list` para identificar tu touchpad, luego usa `xinput list-props [id]` (reemplaza [id] con el número de tu dispositivo) para ver sus propiedades.

4. Instala y configura synclient:
   ```
   sudo apt install xserver-xorg-input-synaptics
   synclient TapButton1=1
   synclient ClickFinger1=1
   synclient TapButton2=3
   synclient ClickFinger2=3
   synclient TapButton3=2
   synclient ClickFinger3=2
   ```

5. Modifica el archivo de configuración:
   Crea o edita el archivo `/etc/X11/xorg.conf.d/40-libinput.conf` y agrega:
   ```
   Section "InputClass"
           Identifier "libinput touchpad catchall"
           MatchIsTouchpad "on"
           MatchDevicePath "/dev/input/event*"
           Driver "libinput"
           Option "Tapping" "on"
           Option "TappingButtonMap" "lrm"
   EndSection
   ```

6. Reinicia el sistema:
   Después de hacer cambios, reinicia tu computadora para que se apliquen.


# Doble clic en Touchpad Dell inspiron 1750 no funciona en Debian 12

En mi laptop antes siempre ha funcionado el doble clic del touchpad, desde Ubuntu 7.04, Debian 9, MX Linux 19, pero en Debian 12 ya no funciona. Hay dos soluciones para el problema del doble clic en el touchpad de la laptop Dell Inspiron 1750 en Debian 12:

## Solución 1: Configurar mediante synclient al inicio

1.) Instalar el paquete `xserver-xorg-input-synaptics` (omita si ya está instalado, puede ver el paquete en synaptic)

```
sudo apt install xserver-xorg-input-synaptics
```

2.) Agregar las siguientes líneas al inicio (arranque):

```
synclient TapButton1=1
synclient ClickFinger1=1
synclient TapButton2=3
synclient ClickFinger2=3
synclient TapButton3=2
synclient ClickFinger3=2
```

**Explicación de las líneas con `synclient`:**

1.) `synclient TapButton1=1`: Configura el botón 1 (clic izquierdo) para que se active al tocar con un dedo en el touchpad.  
2.) `synclient ClickFinger1=1`: Configura el botón 1 (clic izquierdo) para que se active al hacer clic con un dedo en el touchpad.  
3.) `synclient TapButton2=3`: Configura el botón 2 (clic central) para que se active al tocar con dos dedos en el touchpad.  
4.) `synclient ClickFinger2=3`: Configura el botón 2 (clic central) para que se active al hacer clic con dos dedos en el touchpad.  
5.) `synclient TapButton3=2`: Configura el botón 3 (clic derecho) para que se active al tocar con tres dedos en el touchpad.  
6.) `synclient ClickFinger3=2`: Configura el botón 3 (clic derecho) para que se active al hacer clic con tres dedos en el touchpad.  

Estas líneas permiten configurar el comportamiento de los gestos de toque y clic en el touchpad utilizando el comando `synclient`, que es parte del paquete `xserver-xorg-input-synaptics`.

Para añadir al inicio esto debe usted de consultar cómo se hace eso en su sistema operativo Linux, pero si le parece le mostraré dos métodos comunes:

**Método A: Usando el archivo ~/.profile**

1.) Abre una terminal.

2.) Edita el archivo 

```
.profile
```

 en tu directorio home usando un editor de texto. Por ejemplo, con nano: 

```
nano ~/.profile
```

3.) Ve al final del archivo y añade las siguientes líneas: 

```
# Configuración del touchpad
synclient TapButton1=1
synclient ClickFinger1=1
synclient TapButton2=3
synclient ClickFinger2=3
synclient TapButton3=2
synclient ClickFinger3=2
```

4.) Guarda el archivo y cierra el editor. En nano, presiona Ctrl+X, luego Y, y finalmente Enter.

5.) Los cambios se aplicarán la próxima vez que inicies sesión.

**Método B: Crear un script de inicio**

1.) Abre una terminal.

2.) Crea un nuevo archivo de script en el directorio 

```
~/.config/autostart/
```

. Por ejemplo: 

```
nano ~/.config/autostart/touchpad_config.sh
```

3.) Añade las siguientes líneas al archivo: 

```
#!/bin/bash
synclient TapButton1=1
synclient ClickFinger1=1
synclient TapButton2=3
synclient ClickFinger2=3
synclient TapButton3=2
synclient ClickFinger3=2
```

4.) Guarda el archivo y cierra el editor.

5.) Haz el script ejecutable: 

```
chmod +x ~/.config/autostart/touchpad_config.sh
```

**Nota**: También lo puedes hacer ejecutable con clic derecho y en la pestaña permisos marcarlo como ejecutable.

6.) Crea un archivo .desktop para que el script se ejecute al inicio: 

```
nano ~/.config/autostart/touchpad_config.desktop
```

7.) Añade las siguientes líneas al archivo: 

```
[Desktop Entry]
Type=Application
Exec=/home/tuusuario/.config/autostart/touchpad_config.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Touchpad Configuration
Name=Touchpad Configuration
Comment[en_US]=Configure touchpad settings
Comment=Configure touchpad settings
```

 Asegúrate de reemplazar "tuusuario" con tu nombre de usuario real.

8.) Guarda el archivo y cierra el editor.

9.) Los cambios se aplicarán la próxima vez que inicies sesión.

Ambos métodos deberían funcionar para añadir estas configuraciones al inicio de tu sesión en Ubuntu, Debian. El segundo método es un poco más complejo, pero ofrece más flexibilidad si necesitas añadir más comandos en el futuro.

**Método C: Si es que hay como**

El scritp creado del Método B se lo puede añadir directamente en algún lugar de la configuración del sistema donde se permita añadir programas al inicio.

Todo esto configura los botones del touchpad para que el doble clic funcione correctamente.

## Solución 2: Configurar mediante libinput en el archivo de configuración

1.) Desinstalar el paquete `xserver-xorg-input-synaptics`:

```
sudo apt remove xserver-xorg-input-synaptics
```

2.) Instalar el paquete `xserver-xorg-input-libinput`:

```
sudo apt install xserver-xorg-input-libinput
```

3.) Crear o editar el archivo `/etc/X11/xorg.conf.d/40-libinput.conf` y agregar las siguientes líneas:

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButton1" "1"
        Option "TappingButton2" "3"
        Option "TappingButton3" "2"
EndSection
```

**Explicación de las líneas con `libinput`:**

1.) `Section "InputClass"`: Define una clase de entrada (en este caso, para el touchpad).  
2.) `Identifier "libinput touchpad catchall"`: Identifica la clase de entrada como "libinput touchpad catchall".  
3.) `MatchIsTouchpad "on"`: Indica que esta configuración se aplica solo a dispositivos de tipo touchpad.  
4.) `MatchDevicePath "/dev/input/event*"`: Aplica la configuración a todos los dispositivos de entrada que coincidan con la ruta de dispositivo especificada.  
5.) `Driver "libinput"`: Especifica que se debe usar el controlador `libinput` para gestionar el touchpad.
6.) `Option "Tapping" "on"`: Habilita la función de toque (tocar) en el touchpad.  
7.) `Option "TappingButton1" "1"`: Configura el botón 1 (clic izquierdo) para que se active al tocar con un dedo en el touchpad.  
8.) `Option "TappingButton2" "3"`: Configura el botón 2 (clic central) para que se active al tocar con dos dedos en el touchpad.  
9.) `Option "TappingButton3" "2"`: Configura el botón 3 (clic derecho) para que se active al tocar con tres dedos en el touchpad.  
10.) `EndSection`: Cierra la definición de la clase de entrada.  

Estas líneas permiten configurar el comportamiento del touchpad utilizando el controlador `libinput`, que es el recomendado en las últimas versiones de Debian y Ubuntu. La configuración es similar a la que se hace con `synclient`, pero adaptada al uso de `libinput`.

Para hacerlo ponga en la terminal:

```
   sudo nano /etc/X11/xorg.conf.d/40-libinput.conf
```

Si hubiera algún texto allí ubíquese abajo y allí añadalo

Si no sabe cómo usar nano vea:

**Cómo usar nano en la terminal de Linux para editar archivos de texto**
[https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html)

Guarde y salga.

Esto configura el touchpad para que el doble clic funcione correctamente utilizando el controlador `libinput`.

Ambas soluciones deberían resolver el problema del doble clic en el touchpad de la laptop Dell Inspiron 1750 en Debian 12. La primera solución utiliza el paquete `synaptics`, mientras que la segunda usa `libinput`, que es el controlador recomendado en las últimas versiones de Debian.

Puedes probar ambas soluciones y ver cuál se ajusta mejor a tu sistema.

# Velocidad del cursor diferente al usar libinput con xinput

Para configurar la velocidad del touchpad si uno usa xinput como en el siguiente tutorial: [https://facilitarelsoftwarelibre.blogspot.com/2017/11/ubuntu-1704-no-funciona-la-velocidad.html](https://facilitarelsoftwarelibre.blogspot.com/2017/11/ubuntu-1704-no-funciona-la-velocidad.html), en la terminal al poner xinput list aparece mi touchpad así:

   ```
   wachin@netinst:~$ xinput list
   ⎡ Virtual core pointer                          id=2    [master pointer  (3)]
   ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
   ⎜   ↳ Logitech K400                             id=10   [slave  pointer  (2)]
   ⎜   ↳ SynPS/2 Synaptics TouchPad                id=13   [slave  pointer  (2)]
   ⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
      ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
      ↳ Video Bus                                 id=6    [slave  keyboard (3)]
      ↳ Power Button                              id=7    [slave  keyboard (3)]
      ↳ Sleep Button                              id=8    [slave  keyboard (3)]
      ↳ Integrated_Webcam_1.3M: Integra           id=9    [slave  keyboard (3)]
      ↳ Dell WMI hotkeys                          id=11   [slave  keyboard (3)]
      ↳ AT Translated Set 2 keyboard              id=12   [slave  keyboard (3)]
      ↳ Logitech K400                             id=14   [slave  keyboard (3)]
   ```

el valor id 13 es del touchpad de la laptop, y ese valor lo añado a:

```
xinput list-props
```

y me queda así:

```
xinput list-props 13
```

al ejecutarlo observo el siguiente valor importante para mi:

```
Coordinate Transformation Matrix (162): 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
```

es el número de Coordinate Transformation Matrix que para mi teclado me dió:

162

y que con ese número junto con el otro el cual es 13, creo el siguiente comando:

```
xinput set-prop 13 162 1.200000, 0.000000, 0.000000, 0.000000, 1.200000, 0.000000, 0.000000, 0.000000, 1.000000
```

donde he aumentado la velocidad a 1.200000

pero al eliminar xserver-xorg-input-synaptics la velocidad del cursor del touchpad va muy lenta, así que ahora tengo que usar el siguiente valor:

```
xinput set-prop 13 162 2.400000, 0.000000, 0.000000, 0.000000, 2.400000, 0.000000, 0.000000, 0.000000, 1.000000
```

con esto le he aumentado la velocidad de 1.200000 a 2.400000 para que me de el mismo resultado


# Explicación sobre la velocidad del touchpad:

Con el paquete `xserver-xorg-input-synaptics`, este controlador tenía una configuración predeterminada que ajustaba la velocidad del touchpad de manera adecuada. Sin embargo, al eliminar este paquete y pasar a utilizar el controlador `libinput`, la configuración predeterminada de `libinput` para la velocidad del touchpad es diferente.

Esto explica por qué tuve que aumentar manualmente el valor de la "Coordinate Transformation Matrix" de 1.200000 a 2.400000 para lograr la misma velocad de cursor que tenía anteriormente. Cada controlador (synaptics vs libinput) tiene sus propias configuraciones predeterminadas y métodos de ajuste de la velocidad del touchpad.

El cambio de controlador de `synaptics` a `libinput` provocó que la velocidad del cursor se volviera más lenta, y tuve que ajustar manualmente la "Coordinate Transformation Matrix" para recuperar la velocidad deseada.

Esta situación es común cuando se cambia de un controlador a otro en entornos Linux. La clave es estar atento a estos cambios y realizar los ajustes necesarios para mantener el comportamiento del touchpad como lo deseas.

Dios les bendiga



## Referencias

Ubuntu Documentation Team. (2022). "Ubuntu Desktop Guide". Canonical Ltd. Disponible en: [https://help.ubuntu.com/stable/ubuntu-help/](https://help.ubuntu.com/stable/ubuntu-help/)  

Debian Wiki Contributors. (2023). "SynapticsTouchpad". Debian Wiki. Disponible en: [https://wiki.debian.org/SynapticsTouchpad  ](https://wiki.debian.org/SynapticsTouchpad)

Arch Linux Wiki Contributors. (2023). "Touchpad Synaptics". Arch Linux Wiki. Disponible en: [https://wiki.archlinux.org/title/Touchpad_Synaptics](https://wiki.archlinux.org/title/Touchpad_Synaptics)  

Freedesktop.org. (2023). "libinput". Freedesktop.org. Disponible en: [https://wayland.freedesktop.org/libinput/doc/latest/](https://wayland.freedesktop.org/libinput/doc/latest/)  

xinput para configurar la velocidad del cursor cuando no funciona en Ubuntu 16.04, 18.04, OpenSUSE, Linux Mint, Debian, antiX, MX Linux, etc  
[https://facilitarelsoftwarelibre.blogspot.com/2017/11/ubuntu-1704-no-funciona-la-velocidad.html](https://facilitarelsoftwarelibre.blogspot.com/2017/11/ubuntu-1704-no-funciona-la-velocidad.html)  


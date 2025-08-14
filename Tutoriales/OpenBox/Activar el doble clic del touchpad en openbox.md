

para que funcione el Clic o doble clic en el Touchpad de la laptop en Debian 12 la solución es modificar el archivo 40-libinput.conf en /usr/share/X11/xorg.conf.d/40-libinput.conf para que habilite el tap-to-click de forma permanente y para todos los usuarios, entonces funcionará también para gestores de ventana minimalistas como fluxbox, openbox, jwm y otros que no tiene o es dificil configurarlos.

El archivo ya tiene la sección responsable del touchpad:

```
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
EndSection
```

Solo necesitas añadir la línea:

Option "Tapping" "on"

Para hacerlo de una manera fácil usaremos gedit:

sudo gedit /usr/share/X11/xorg.conf.d/40-libinput.conf

Busca esta sección:

```
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
EndSection
```

Añade justo antes de EndSection:

    Option "Tapping" "on"

Guarda y cierra (Ctrl + O, Enter, luego Ctrl + X).

Cierra sesión y vuelve a entrar. 

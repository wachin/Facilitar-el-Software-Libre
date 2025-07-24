### Clic o doble clic en Touchpad de laptop no funciona en Debian 11, 12 (LXQT, XFCE,KDE)(Q4OS 4 Gemini, Trinity)

Publicadas por [Washington Indacochea Delgado](https://www.blogger.com/profile/17773143494819856315 "author profile")  [agosto 20, 2024](https://facilitarelsoftwarelibre.blogspot.com/2024/08/no-funciona-doble-clic-en-touchpad-dell-inspiron-1750-en-debian-12.html "permanent link")

Si instalas o pruebas un Sistema Operativo [Debian](https://facilitarelsoftwarelibre.blogspot.com/search/label/Descargar%20Debian) como:

-   Debian 12 LXQT
-   Debian 12 XFCE
-   Debian 12 LXDE
-   Debian 12  GNOME
-   Debian 12 KDE
-   Debian 12 Mate 
-   Debian 12 Cinnamon

o un Sistema Operativo basado en este como:  

-   Q4OS 4 Gemini
-   Q4OS Trinity)

No funciona por defecto el el dar clic con el dedo en el touchpad en las laptop que he probado:

-   Dell Inspiron 14 3481
-   Dell Inspiron 1750  
    
-   HP G62-144DX

sucede que en Debian 12 viene el servidor xserver-xorg-input-libinput y de alguna manera por esta razón ya no viene configurado por defecto  


## Solución 1: Configurar el administrador del touchpad  

### LXQT

En **LXQT** en el menú abrir:

**"Configuración del Monitor"**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiHZw4oKnXI-pKbqgYMiJkp9hVv0L5JRnxtJzdbCzgktCJ-MmlOF487Dx2EHlYgCWEp3kV9gacZ1o3G3l4jr-5YR2hqnsvxRLqfCSR5DGM8-omIS7SwLcwMM6wnDMbwwEEvkNrYx4xpvc5RRy35fC-hndIPsuMiPwwoH9NRHWIB8mYeHY0IyHlXOjyJb0U/s16000-rw/20250724-113605%20en%20men%C3%BA%20de%20LXQT%20Configuraci%C3%B3n%20del%20monitor.png)

 y allí dar clic en

**"Ratón y panel táctil"**  

 e Disipositivo seleccionar el Touchpad de su laptop

y marcar:

**"Toque para hacer clic"**

como se ve en la siguiente imagen:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiuSxvQSKyCn5SyQQTMIND7dmwACHH5l8sueIiicGeHR4SHjob58r5O-tMW77E0xpq2aYqqAllSV9RcV592xZAWm3UTGMki5rqHv_V7TNF-8MJARxZ9okIilEoFD6LcMC0S47cxGI8DbaYRR_JePWxg3EiPlDxUzUBUvfahS9LjTNQ6WkR3ZD2H7Z0jAhU/s16000-rw/20250724-113347%20configuraci%C3%B3n%20de%20teclado%20y%20rat%C3%B3n%20y%20seleccionado%20el%20touchpad%20en%20LXQT.png)

con esto ya funcionará

de manera similar para:

LXDE

GNOME

XFCE

KDE



## Solución 2: modificar el archivo 40-libinput.conf

Lo que vas a hacer es **modificar el archivo `/usr/share/X11/xorg.conf.d/40-libinput.conf`** para que habilite el _tap-to-click_ de forma permanente y para todos los usuarios, entonces funcionará también para gestores de ventana minimalistas como fluxbox, openbox, jwm y otros que no tiene o es dificil configurarlos.

El archivo ya tiene la sección responsable del touchpad:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiPuh_cGzAMN627aokjHpoKf74OFr20TEc2adgIshut_itEm1vWLaK4lQTEldNrNIfpS3OqejqYt8WYw1kRwcBzfby5z8xqbbJzqC6xE_l77XamEqc3qF3b7X9TTq4EAbZSgPyF7te1Sf2vWNiNf-caRonhyphenhyphen7FEGIXRLOaS-r2JhJq-n2A7bTm_5qILg-k/s16000-rw/20250724-115138%2040-libinput.conf%20touchpad%20catchall.png)

  

```
Section "InputClass"    Identifier "libinput touchpad catchall"    MatchIsTouchpad "on"    MatchDevicePath "/dev/input/event*"    Driver "libinput"EndSection
```

Solo necesitas añadir la línea:

```
Option "Tapping" "on"
```

para que quede así:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP9lrWpZyODR9-a13Zy2wf49iIMFU-iHOm_Q22B3xgjLeYAK8tEnKU4-9xhiWrEoW7nrSxPM3CH_khSEOxxRwJ7Tj0n_3e0TAJchAdQ-_JYpzY3lQfvHLUaQEkWvIXuzHl-rCm_Oh2iChtocYGAPKEuSNXSAH7ZpOVrCoBOelrnrLm6YITyhvKogflAr4/s16000-rw/20250724-115404%20a%C3%B1adiendo%20tapping%20on%20a%2040-libinput.conf.png)

```
Section "InputClass"    Identifier "libinput touchpad catchall"    MatchIsTouchpad "on"    MatchDevicePath "/dev/input/event*"    Driver "libinput"    Option "Tapping" "on"EndSection
```
 
 Para hacerlo de una manera fácil usaremos gedit (se lo instala con sudo apt install gedit):

```
sudo gedit /usr/share/X11/xorg.conf.d/40-libinput.conf
```

 Busca esta sección:

```
Section "InputClass"    Identifier "libinput touchpad catchall"    MatchIsTouchpad "on"    MatchDevicePath "/dev/input/event*"    Driver "libinput"EndSection
```

 Añade justo antes de EndSection:

```
    Option "Tapping" "on"
```

Guarda y cierra (Ctrl + O, Enter, luego Ctrl + X).

**Nota importante sobre el formato del archivo**

Cuando edites el archivo `40-libinput.conf`, **respeta el formato y la estructura de cada línea**.

-   Cada bloque comienza con `Section "InputClass"` y termina con `EndSection`.
-   Las líneas dentro de la sección deben comenzar con una **tabulación o algunos espacios** (generalmente cuatro).  
-   No elimines ni muevas palabras clave como `Identifier`, `Driver`, `Option`, etc.
    

Un espacio o una tabulación de más o de menos **no suele romper la configuración** (Xorg es flexible con espacios al inicio), pero si escribes mal la palabra clave, las comillas o la sintaxis, el archivo no funcionará. Si no respetas la sintaxis, el servidor gráfico puede **ignorar tu configuración** o, en el peor de los casos, impedir que el entorno gráfico arranque.  

### **Luego, reinicia tu sesión gráfica**

Puedes reiniciar la computadora o simplemente salir y volver a entrar en tu sesión de LXQt para que se apliquen los cambios.  

### Verifica que funcione

Después del reinicio, prueba tocar el touchpad con un dedo: si hace clic izquierdo, entonces funcionó correctamente.

Dios les bendiga

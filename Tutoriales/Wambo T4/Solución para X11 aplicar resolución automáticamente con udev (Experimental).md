## 🔧 Solución para X11: aplicar resolución automáticamente con udev (Opcional con script)

Esto podría ser necesario para gestores de ventana minimalistas x11, para esto vamos a crear un script que aplica una resolución que sí puede manejar bien en la pantalla extendida 1366x768 a 60 Hz (también funciona 1280x720 a 60 Hz) al proyector cada vez que se conecta

**Nota**: Usaremos en editor de texto gedit que va bien para hacer cosas como super usuario y es fácil de usar, debes instalarlo (sudo apt install gedit). Pero en caso que quieras usar [nano](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html) o [Vim](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html) solo cambia el nombre en el comando.

### Paso 1: Crear el script que configura la pantalla

Abre una terminal y ejecuta:

    sudo gedit /usr/local/bin/fijar-pantalla.sh

Copia y pega lo siguiente:

#!/bin/bash  
export DISPLAY=:0  
export XAUTHORITY=/home/tuusuario/.Xauthority  
xrandr --output HDMI-1 --mode 1366x768 --rate 60

🔁 Reemplaza tuusuario por el nombre real de tu usuario (por ejemplo: alianza o iglesia o carlos o juan como esté el nombre de usuario).

Guarda y cierra.

Dale permisos de ejecución:

    sudo chmod +x /usr/local/bin/fijar-pantalla.sh

* * *

### Paso 2: Crear una regla udev para activar el script

Ejecuta (esto creará el archivo):

    sudo gedit /etc/udev/rules.d/99-monitor.rules

Pega este contenido:

ACTION=="change", SUBSYSTEM=="drm", RUN+="/usr/local/bin/fijar-pantalla.sh"

Guarda el archivo y cierra.

* * *

### Paso 3: Recargar reglas y reiniciar

Recarga las reglas:

    sudo udevadm control --reload

Y **reinicia** el equipo.

* * *

## ✅ ¿Qué hace esta solución?

Cada vez que:

Conectas el HDMI al Wambo T4 después de haber iniciado el sistema al usar “Pantalla extendida” se aplica automáticamente la resolución 1366x768 a 60 Hz, que es la que funciona bien con el proyector Wambo T4 en X11 en la laptop HP G62.

## **Posibles falla del script en Debian 12 Netinstall XFCE**

Ejemplo, en MX Linux, el archivo `.Xauthority` y las variables `DISPLAY` suelen estar configuradas automáticamente y siempre funciona bien el script, pero si usas Debian 12 Netinstall XFCE puede no funcionar el script, así que hay que hacer lo siguiente

**Acceso al entorno gráfico desde scripts root**: Debian Netinstall puede no permitir que un script de `udev` ejecute comandos que necesitan un DISPLAY activo.

-   En Debian Netinstall CD puede no haber `xhost` habilitado, por eso el script puede fallar.
-   Cuando `udev` ejecuta el script, lo hace como **root**, y sin el permiso explícito, `xrandr` no puede conectarse al `DISPLAY`.

1.  **Solución**: Agrega permiso en tu sesión gráfica:  
    
        xhost +SI:localuser:root
    
2.  **Solución permanente**
    

Para no tener que ejecutar `xhost +SI:localuser:root` en cada inicio:

1.  Agrega la línea a tu archivo `~/.profile` o `~/.xsessionrc`:
    
        xhost +SI:localuser:root
        
        
        
    
2.  Cierra sesión y vuelve a entrar.

* * *

### ⚠️ ¿Qué pasa si se configura como “Sólo proyector”?

En pruebas que realicé, si eliges “Mostrar solo en el proyector”, el sistema vuelve a parpadear, y la solución automática con udev no siempre lo corrige de inmediato.

👉 En ese caso puedes solucionarlo manualmente:

1.  Abre la herramienta de pantallas. En MX Linux 23 XFCE en la laptop HP G62 al dar clic en la tecla F4 (otras laptop pueden usar otra tecla) se abre una ventana de configuración del monitor la cual usa **xfce4-display-settings** (en otros administradores de Ventana como LXQT usa usa **“lxqt-config-monitor”**), allí:
    
2.  Ve a “Opciones avanzadas”.
    
3.  Haz clic en la pantalla del proyector (por ejemplo: HSI 27”).
    
4.  Cambia la resolución a 1366x768 y haz clic en Aplicar, y se soluciona.
    

**Nota**: LXQT usa **“lxqt-config-monitor”** programa que está dentro del paquete **“lxqt-config”**.

* * *

## Qué pasa si uso otro proyector

Si ejemplo usara otro proyector como ejemplo uno EPSON **No afectará de manera crítica**, pero hay algunos puntos a considerar:

**Qué hace el script actual** Cada vez que detecta un cambio en la salida de video (cualquier proyector o monitor HDMI), aplica:

    xrandr --output HDMI-1 --mode 1366x768 --rate 60

Esto **forzará al dispositivo conectado** (en el caso de otro proyector como un proyector EPSON) a usar **1366x768 a 60 Hz**, sin importar su resolución nativa.

* * *

### **Posibles escenarios con el EPSON u otro proyector**

1.  **Si el proyector EPSON soporta 1366x768 a 60 Hz** (la mayoría sí lo hace):
    
    -   No habrá ningún problema.
    -   Solo proyectará a 1366x768 aunque el proyector pueda dar más resolución ejemplo 1080p (1920 x 1080 px).
2.  **Si el proyector EPSON no soporta exactamente 1366x768 a 60 Hz** (poco probable):
    
    -   Puede mostrar una advertencia o no mostrar imagen.
    -   En ese caso, deberías temporalmente desactivar la regla de **udev**.

* * *

### **Cómo desactivar temporalmente el script**

Si notas problemas con el EPSON, puedes desactivar la regla sin borrarla:

    sudo mv /etc/udev/rules.d/99-monitor.rules /etc/udev/rules.d/99-monitor.rules.bak
    sudo udevadm control --reload

Y reiniciar la laptop. Para volver a activarla:

    sudo mv /etc/udev/rules.d/99-monitor.rules.bak /etc/udev/rules.d/99-monitor.rules
    sudo udevadm control --reload

* * *

### **Otras resoluciones**

Además he probado la resolución 1280x720 (720p) y también funciona, se la podría usar (hay que reemplazar en el archivo)

### **Conclusión**

-   **Lo más probable:** El EPSON funcionará sin problemas porque casi todos aceptan esa frecuencia.
-   **Si hubiera algún problema:** Solo desactiva temporalmente la regla como te indiqué.
-   Gracias a esta solución automática con udev, puedes usar Linux con X11 y proyectores económicos como el Wambo T4 sin parpadeo. Esta es una excelente alternativa si tu laptop no soporta bien Wayland o si prefieres usar sistemas más ligeros.
















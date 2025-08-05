# **Tutorial Completo de Sway para Principiantes**  

Un **administrador de ventanas Tiling** (o de mosaico) como lo es Sway es un tipo de gestor de ventanas en Linux que organiza automáticamente las ventanas en la pantalla sin que se superpongan. A diferencia de los administradores de ventanas "flotantes" tradicionales (como los que se encuentran en Windows o macOS), donde puedes arrastrar y soltar las ventanas libremente, los administradores de ventanas Tiling llenan el espacio disponible en la pantalla con las ventanas que abres, así Sway tiene:

* **Organización automática en mosaico:** La característica principal. Cuando abres una ventana, el gestor la coloca automáticamente en una parte de la pantalla. Si abres una segunda ventana, la primera se redimensiona para compartir el espacio y la segunda ocupa el resto, creando un "mosaico" de ventanas.
* **Sin superposiciones:** Las ventanas nunca se superponen. Siempre se muestran una al lado de la otra, dividiendo la pantalla en secciones lógicas.
* **Enfoque en el teclado:** Los administradores de ventanas Tiling están diseñados para ser controlados casi por completo con el teclado. En lugar de usar el ratón para mover, redimensionar y cerrar ventanas, utilizas atajos de teclado para todas estas acciones. Esto permite un flujo de trabajo más rápido y eficiente.
* **Configuración y personalización:** Suelen ser muy configurables. Los usuarios pueden modificar la disposición de las ventanas, los atajos de teclado, los colores y otros aspectos a través de un archivo de configuración de texto plano. Esto permite una personalización muy profunda para adaptarse a las necesidades de cada usuario.
* **Trabajo con múltiples monitores:** Funcionan muy bien con múltiples pantallas. Los gestores de ventanas de mosaico pueden organizar las ventanas en cada monitor de forma independiente, o incluso mover ventanas y espacios de trabajo entre ellos fácilmente con atajos de teclado.
* **Sway y Wayland:** Sway es un administrador de ventanas de mosaico diseñado para el servidor de visualización **Wayland**. Es un sucesor directo de `i3`, otro popular administrador de ventanas de mosaico, pero está diseñado para el ecosistema moderno de Wayland en lugar del antiguo servidor X11. Esto significa que Sway aprovecha las características y mejoras de rendimiento de Wayland.

En resumen, un administrador de ventanas Tiling como lo es Sway es una herramienta de productividad para usuarios avanzados de Linux que buscan un control total y un flujo de trabajo más eficiente, eliminando la necesidad de usar el ratón y organizando las ventanas de forma lógica para maximizar el espacio en la pantalla.

## **📦 Instalación de Paquetes Necesarios**  
Primero, instala todos los paquetes necesarios en Debian 12:  

```bash
sudo apt update
sudo apt install sway waybar sway-notification-center swaykbdd wofi python3-i3ipc wlr-randr swaybg swayidle swaylock foot wl-clipboard wf-recorder wvkbd
```

Si prefieres **Alacritty** en lugar de **Foot** (otro terminal rápido para Wayland):  

```bash
sudo apt install alacritty
```

## **🚀 Iniciar y Salir de Sway**  

### **Iniciar Sway desde la terminal (sin gestor de inicio de sesión)**  
Si usas un gestor de inicio como GDM o LightDM, selecciona Sway en la lista de sesiones.  

Si inicias sesión desde la terminal (TUI), ejecuta:  

```bash
sway
```

### **Salir de Sway**  

- **Cerrar sesión**: `Mod + Shift + E` (te pedirá confirmación).  
- **Forzar cierre** (si Sway se congela): `Ctrl + Alt + F2` (cambia a TTY) y luego ejecuta:  

```bash
killall sway
```

---

## **⌨️ Atajos de Teclado Básicos**  

Sway usa la tecla `Mod` (normalmente la tecla **Windows/Super** o **Alt**) para los atajos.  

### **Movimiento entre ventanas**  

- `Mod + ← / → / ↑ / ↓` → Cambiar el foco entre ventanas.  
- `Mod + Shift + ← / → / ↑ / ↓` → Mover ventana a otra dirección.  
- `Mod + h / j / k / l` (alternativa Vim-style).  

### **Gestión de ventanas**  

- `Mod + Enter` → Abrir terminal (Foot/Alacritty).  
- `Mod + q` → Cerrar ventana.  
- `Mod + f` → Pantalla completa.  
- `Mod + d` → Abrir lanzador de aplicaciones (**Wofi**).  
- `Mod + Shift + Espacio` → Cambiar a modo flotante (para mover ventanas libremente).  
- `Mod + Espacio` → Cambiar entre mosaico/flotante.  

### **Gestión de espacios de trabajo (workspaces)**  

- `Mod + 1-9` → Cambiar a workspace 1-9.  
- `Mod + Shift + 1-9` → Mover ventana a workspace 1-9.  

### **Gestión de monitores**  

- `Mod + Shift + m` → Mover ventana a otro monitor.  
- `wlr-randr --output HDMI-1 --mode 1368x768@75.00` → Cambiar resolución y Hz.  

### **Bloqueo de pantalla**  

- `Mod + Escape` → Bloquear pantalla con **swaylock**.  

## **📂 Manejo de Archivos y Documentos**  

Sway no incluye un gestor de archivos, pero puedes instalar uno:  

```bash
sudo apt install thunar pcmanfm nautilus  # (elige uno)
```

### **Abrir archivos desde terminal**  

- Usa `xdg-open` para abrir archivos con la aplicación predeterminada:  

```bash
xdg-open documento.pdf
xdg-open imagen.png
```

### **Gestión del portapapeles**  

- `wl-copy "texto"` → Copiar texto al portapapeles.  
- `wl-paste` → Pegar texto.  

## **🔧 Personalización Básica**  

### **1. Configuración de Sway (`~/.config/sway/config`)**  
Crea o edita el archivo de configuración:  

```bash
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/  # Copia la configuración por defecto
nano ~/.config/sway/config
```

### **2. Barra de estado (Waybar)**  
Waybar se ejecuta automáticamente si está instalado. Para personalizarlo:  

```bash
mkdir -p ~/.config/waybar
cp /etc/xdg/waybar/config ~/.config/waybar/
nano ~/.config/waybar/config
```

### **3. Fondo de pantalla**  

```bash
swaybg -i ~/Imágenes/fondo.jpg -m fill
```
Para que se ejecute al inicio, añádelo al archivo `~/.config/sway/config`:  

```bash
exec swaybg -i ~/Imágenes/fondo.jpg -m fill
```

## **🎥 Grabación de Pantalla**  
Con `wf-recorder`:  

```bash
wf-recorder -f grabacion.mp4  # Iniciar grabación
wf-recorder --stop            # Detener grabación
```

---

## **🔍 Consejos Finales**  
- Si algo no funciona, revisa los logs con:  

```bash
journalctl -u sway --no-pager -f
```
- Para aprender más comandos, ejecuta `man sway`.  


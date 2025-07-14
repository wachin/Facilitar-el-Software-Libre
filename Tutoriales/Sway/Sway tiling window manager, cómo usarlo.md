# **Tutorial Completo de Sway para Principiantes**  

Sway es un **gestor de ventanas en mosaico (tiling window manager)** para Wayland, inspirado en i3wm. A diferencia de los entornos de escritorio tradicionales (como GNOME o KDE), Sway organiza automáticamente las ventanas en mosaicos, sin superposiciones, lo que lo hace muy eficiente para el uso con el teclado.  

---

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

---

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

---

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

---

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
```
exec swaybg -i ~/Imágenes/fondo.jpg -m fill
```

---

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


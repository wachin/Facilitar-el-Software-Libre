# **Tutorial Completo de Sway para Principiantes**  

Un **administrador de ventanas Tiling** (o de mosaico) como lo es Sway es un tipo de gestor de ventanas en Linux que organiza automáticamente las ventanas en la pantalla sin que se superpongan. A diferencia de los administradores de ventanas "flotantes" tradicionales (como los que se encuentran en Windows o macOS), donde puedes arrastrar y soltar las ventanas libremente, los administradores de ventanas Tiling llenan el espacio disponible en la pantalla con las ventanas que abres, así Sway tiene:

* **Organización automática en mosaico:** La característica principal. Cuando abres una ventana, el gestor la coloca automáticamente en una parte de la pantalla. Si abres una segunda ventana, la primera se redimensiona para compartir el espacio y la segunda ocupa el resto, creando un "mosaico" de ventanas.
* **Sin superposiciones:** Las ventanas nunca se superponen. Siempre se muestran una al lado de la otra, dividiendo la pantalla en secciones lógicas.
* **Enfoque en el teclado:** Los administradores de ventanas Tiling están diseñados para ser controlados casi por completo con el teclado. En lugar de usar el ratón para mover, redimensionar y cerrar ventanas, utilizas atajos de teclado para todas estas acciones. Esto permite un flujo de trabajo más rápido y eficiente.
* **Configuración y personalización:** Suelen ser muy configurables. Los usuarios pueden modificar la disposición de las ventanas, los atajos de teclado, los colores y otros aspectos a través de un archivo de configuración de texto plano. Esto permite una personalización muy profunda para adaptarse a las necesidades de cada usuario.
* **Trabajo con múltiples monitores:** Funcionan muy bien con múltiples pantallas. Los gestores de ventanas de mosaico pueden organizar las ventanas en cada monitor de forma independiente, o incluso mover ventanas y espacios de trabajo entre ellos fácilmente con atajos de teclado.
* **Sway y Wayland:** Sway es un administrador de ventanas de mosaico diseñado para el servidor de visualización **Wayland**. Es un sucesor directo de `i3`, otro popular administrador de ventanas de mosaico, pero está diseñado para el ecosistema moderno de Wayland en lugar del antiguo servidor X11. Esto significa que Sway aprovecha las características y mejoras de rendimiento de Wayland.

En resumen, un administrador de ventanas Tiling como lo es Sway es una herramienta de productividad para usuarios avanzados de Linux que buscan un control total y un flujo de trabajo más eficiente, eliminando la necesidad de usar el ratón y organizando las ventanas de forma lógica para maximizar el espacio en la pantalla

![Sway](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj_pAj-I-zA1OjBMacBDj1I_u7or2UcdpJwUl5nUWHRR0mi_zuGO0ek-Zl2G7NkpWIzfE0X-VfQLGlIdbGU0fekFNz0kBMPzz4I2tgwzguOwURh8rCy7vfwRhSiy2MoTk1-fo2yOSW9Bo0VfKFJmfHOVf7eeHAUIFs0jBpfmfKiWAgaFdcVnDF7n4V-GS4/s1366/captura.png)


## **📦 Instalación de Paquetes Necesarios**  
Primero, instala todos los paquetes necesarios en Debian 12:   

Actualizar los repositorios:

```bash
sudo apt update
```

e instalar los paquetes:

```bash
sudo apt install sway waybar sway-notification-center swaykbdd wofi \
    python3-i3ipc wlr-randr swaybg swayidle swaylock foot wl-clipboard \
    wf-recorder wvkbd grimshot grim slurp
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

con esto debería solucionarse

---

# Atajos de teclado (Combinaciones de teclas)
Las siguientes son las equivalencias para el teclado

### **Mod** (Tecla modificadora)
En Sway, `Mod` se refiere por defecto a la **tecla Super** (también llamada tecla Windows):

- **Tecla Windows/Super**: La tecla con el logo de Windows en teclados estándar
- **Ubicación**: Generalmente entre Ctrl y Alt, a la izquierda de la barra espaciadora
- **Símbolo**: ⊞ o ❖

### **Shift** 

- **Tecla Shift**: La tecla de mayúsculas
- **Ubicación**: Hay dos, una a cada lado del teclado
- **Puedes usar cualquiera de las dos**

### **minus**
Se refiere al **guión medio** o **signo menos**:

  - **Símbolo**: `-`
  - **Ubicación**: En el teclado en español/latinoamericano está generalmente:
  - Entre el `0` y el `=` en la fila de números
  - O junto a la `ñ` dependiendo del layout

## Ejemplo visual de la combinación

```
[Super] + [Shift] + [-]   
   ❖    +    ⇧    +  -
```

## En la práctica

Para ejecutar `Mod + Shift + minus`:

1. **Mantén presionada** la tecla Super/Windows (❖)
2. **Mantén presionada** Shift (⇧) 
3. **Presiona** el guión/menos (-)
4. **Suelta todas** las teclas


## **⌨️ Atajos de Teclado Básicos**  

### **Movimiento entre ventanas**  

- `Mod + ←`   Enfocar ventana a la izquierda
- `Mod + →`   Enfocar ventana a la derecha  
- `Mod + ↑`   Enfocar ventana arriba
- `Mod + ↓`    Enfocar ventana abajo
- `Mod + Shift + flechas` → Mover ventana a otra dirección.  

**Alternativa con teclas vim:**

- `Mod + h`  Izquierda
- `Mod + l`  Derecha
- `Mod + k`  Arriba
- `Mod + j`  Abajo


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

Sway no incluye un gestor de archivos, puedes usar el que venga instalado o pero puedes instalar uno:  

```bash
sudo apt install thunar pcmanfm nautilus  # (elige uno)
```

lo puedes abrir desde la terminal, según sea el nombre del administrador de archivos

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

# Capturas de Pantalla en Sway: Guía Completa con Grimshot y Grim

Sway es un compositor de ventanas para Wayland que reemplaza las herramientas tradicionales de captura de pantalla de X11. En esta guía aprenderás a configurar y usar las herramientas más efectivas para capturar pantalla en Sway.

## ¿Por qué las herramientas tradicionales no funcionan?

En entornos Wayland como Sway, las herramientas clásicas como `scrot` o `gnome-screenshot` no funcionan debido a las diferencias de seguridad y arquitectura. Necesitamos herramientas específicas para Wayland.

## Instalación de las Herramientas

### Grim: La base fundamental

Grim es la herramienta principal para capturas de pantalla en Wayland:

```bash
sudo apt update
sudo apt install grim slurp
```

- **grim**: Captura la pantalla
- **slurp**: Permite seleccionar regiones específicas

### Grimshot: El script mejorado

Aunque `sway-backgrounds` está instalado, grimshot no siempre viene incluido automáticamente. Necesitas instalarlo por separado:

```bash
sudo apt install grimshot
```


## Uso Básico de Grim

### Capturas simples

```bash
# Capturar toda la pantalla
grim captura.png

# Capturar con timestamp
grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png

# Capturar región específica
grim -g "$(slurp)" captura-region.png

# Capturar ventana específica
grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" ventana.png
```

### Opciones avanzadas

```bash
# Capturar con calidad específica
grim -q 100 captura-hq.png

# Capturar en formato específico
grim -t jpeg captura.jpg

# Capturar monitor específico
grim -o DP-1 monitor1.png
```

## Uso de Grimshot

Grimshot es un wrapper que simplifica el uso de grim y añade funcionalidades adicionales.

### Comandos principales

```bash
# Capturar toda la pantalla al portapapeles
grimshot copy output

# Capturar región seleccionada al portapapeles
grimshot copy area

# Capturar ventana activa al portapapeles
grimshot copy active

# Capturar ventana específica al portapapeles
grimshot copy window
```

### Guardar como archivos

```bash
# Guardar captura completa
grimshot save output ~/captura.png

# Guardar región seleccionada
grimshot save area ~/captura.png

# Guardar ventana activa
grimshot save active ~/captura.png

# Guardar con nombre automático
grimshot save output ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
```

## Configuración de Atajos de Teclado

Edita tu archivo de configuración de Sway (`~/.config/sway/config`):

```bash
# Capturas básicas con grim
bindsym Print exec grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
bindsym Shift+Print exec grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png

# Capturas con grimshot (recomendado)
bindsym Print exec grimshot copy output
bindsym Shift+Print exec grimshot copy area
bindsym Ctrl+Print exec grimshot copy active
bindsym Alt+Print exec grimshot save output ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png

# Captura con notificación
bindsym Print exec grimshot copy output && notify-send "Captura copiada al portapapeles"
```

Después de modificar la configuración:

```bash
# Recargar configuración de Sway
swaymsg reload
# O usar el atajo: Super+Shift+C
```

## Trabajando con el Portapapeles

### Verificar contenido del portapapeles

```bash
# Instalar herramientas de portapapeles
sudo apt install wl-clipboard

# Ver tipos de contenido disponibles
wl-paste --list-types

# Guardar imagen del portapapeles a archivo
wl-paste > imagen-desde-portapapeles.png

# Copiar archivo al portapapeles
wl-copy < imagen.png
```

### Scripts útiles

Crear un script personalizado para capturas automáticas:

```bash
#!/bin/bash
# Guardar como ~/bin/captura
mkdir -p ~/Pictures/screenshots
FILENAME="screenshot-$(date +%Y%m%d-%H%M%S).png"
grimshot save output ~/Pictures/screenshots/$FILENAME
notify-send "Captura guardada" "$FILENAME"
```

Hacer el script ejecutable:

```bash
chmod +x ~/bin/captura
```

## Solución de Problemas Comunes

### Grimshot no encontrado

Si `grimshot` no está disponible después de instalar `sway-backgrounds`:

1. Verificar instalación: `which grimshot`
2. Instalar manualmente desde el repositorio de Sway
3. Usar grim directamente como alternativa

### Permisos de captura

En algunos casos, necesitas permisos específicos:

```bash
# Agregar usuario al grupo video
sudo usermod -a -G video $USER
```

### Capturas en negro

Si las capturas salen en negro, puede ser un problema de drivers gráficos:

```bash
# Usar software rendering temporalmente
LIBGL_ALWAYS_SOFTWARE=1 grimshot copy output
```

## Comparación: Grim vs Grimshot

| Característica | Grim | Grimshot |
|----------------|------|----------|
| Velocidad | Muy rápida | Rápida |
| Simplicidad | Comando directo | Wrapper simplificado |
| Portapapeles | Requiere wl-copy | Integrado |
| Flexibilidad | Máxima | Buena |
| Dependencias | Mínimas | Más herramientas |

## Conclusión

Para la mayoría de usuarios, **grimshot** es la opción más conveniente por su simplicidad y integración con el portapapeles. **Grim** ofrece más control granular para casos específicos.

La combinación de ambas herramientas te permitirá manejar cualquier escenario de captura de pantalla en tu entorno Sway de manera eficiente.

---

# Solución a problemas de ventanas perdidas en Sway

## El Problema

Si usas Sway (el compositor de ventanas para Wayland) y te encuentras en esta situación:

- Tienes varias ventanas abiertas en modo flotante
- Una ventana se maximiza o va a pantalla completa (como gwenview al abrir una imagen)
- Cambias esa ventana a modo flotante con `Mod + Shift + Espacio`
- Las otras ventanas "desaparecen" detrás y no puedes acceder a ellas
- `Alt + Tab` no funciona para cambiar entre ventanas

**¡No te preocupes!** Tus ventanas siguen ahí, solo están ocultas. Este tutorial te enseñará cómo recuperarlas y evitar que vuelva a pasar.

## Soluciones Inmediatas

### Método 1: Navegación con teclado
Usa las teclas de dirección para moverte entre ventanas:

- `Mod + ←`   Enfocar ventana a la izquierda
- `Mod + →`   Enfocar ventana a la derecha  
- `Mod + ↑`  #Enfocar ventana arriba
- `Mod + ↓`    Enfocar ventana abajo
- `Mod + Shift + flechas` → Mover ventana a otra dirección.  

**Alternativa con teclas vim:**

- `Mod + h`  Izquierda
- `Mod + l`  Derecha
- `Mod + k`  Arriba
- `Mod + j`  Abajo

### Alternar entre ventanas flotantes y en mosaico

`Mod + Ctrl + Espacio`  Cambiar foco entre ventanas flotantes y tiling

## Consejos Adicionales

### Gestión Preventiva

- **Usa workspaces:** `Mod + [1-9]` para cambiar entre espacios de trabajo
- **Organiza por tipo:** Terminales en workspace 1, navegador en 2, etc.
- **Modo picture-in-picture:** `Mod + Shift + Espacio` seguido de redimensionar con `Mod + r`

### Si nada funciona
Como último recurso, puedes reiniciar Sway sin perder tu trabajo:

`Mod + Shift + e` Menú de salida

Selecciona "Reload" en lugar de "Exit".

## Flujo de Trabajo Recomendado

1. **Abre aplicaciones en orden:** Primero las que usarás como base (terminales, editor)
2. **Usa workspaces:** Separa aplicaciones por función
3. **Modo flotante solo cuando sea necesario:** La mayoría del tiempo, el modo tiling es más eficiente
4. **Aprende los atajos:** Memoriza `Mod + w`, `Mod + e`, `Mod + s` para cambios rápidos de layout

## Troubleshooting

**Si las ventanas siguen sin aparecer:**

- Verifica que no estén minimizadas: `Mod + Shift + minus` para minimizar/restaurar
- Revisa si están en otro workspace: `Mod + [número]`
- Usa `swaymsg -t get_workspaces` para ver todos los espacios de trabajo activos

**Si Alt + Tab definitivamente no funciona:**

- Instala un switcher alternativo como `wofi` o `rofi`
- O usa los atajos nativos de Sway mencionados arriba

---

## **🔍 Consejos Finales**  
- Si algo no funciona, revisa los logs con:  

```bash
journalctl -u sway --no-pager -f
```
- Para aprender más comandos, ejecuta `man sway`.  

## Conclusión

Los gestores de ventanas como Sway requieren un poco de curva de aprendizaje, pero una vez que dominas estos comandos básicos, la productividad aumenta significativamente. La clave está en entender que las ventanas no desaparecen, solo cambian de contexto, y siempre hay una forma de navegar de vuelta a ellas.
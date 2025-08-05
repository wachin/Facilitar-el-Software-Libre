


# **Tutorial: Cómo saber el nombre de una aplicación para su icono en tint2 usando `xprop` y entender `WM_CLASS`**

En escritorios ligeros como **Openbox** con el panel **tint2**, es común que algunas aplicaciones (especialmente las hechas en **Python o GTK**) no muestren un icono correcto en la barra de tareas.
Para solucionarlo, primero necesitamos saber cómo el sistema identifica la ventana.

---

## **1. ¿Qué es `WM_CLASS`?**

* Cada ventana en X11 (el sistema de ventanas usado por la mayoría de escritorios Linux) tiene propiedades que describen su tipo y su origen.
* Una de las propiedades más importantes es **`WM_CLASS`**, que se usa para:

  * Asociar iconos en los paneles (tint2, LXPanel, XFCE Panel, etc.).
  * Aplicar reglas de ventana en Openbox, XFWM, KWin, etc.
* `WM_CLASS` normalmente tiene dos valores:

  1. **Nombre de la instancia** → suele ser el ejecutable (ejemplo: `"firefox"`).
  2. **Nombre de la clase** → nombre general de la aplicación (ejemplo: `"Firefox"`).

Ejemplo típico:

```
WM_CLASS(STRING) = "firefox", "Firefox"
```

---

## **2. Cómo ver el `WM_CLASS` de un programa**

1. Abre el programa que quieras analizar (ejemplo: `xinput-gui`).
2. Abre una terminal y escribe:

   ```bash
   xprop | grep WM_CLASS
   ```
3. El cursor se convierte en una cruz. Haz clic sobre la ventana de la aplicación.
4. Verás algo como:

   ```
   WM_CLASS(STRING) = "xinput-gui", "Xinput-gui"
   ```

---

## **3. ¿Para qué sirve esto?**

* Tint2 usa el `WM_CLASS` para buscar un icono asociado.
* Si no encuentra un icono que coincida con el nombre de la aplicación (`StartupWMClass` o ejecutable), muestra un icono genérico o ninguno.
* Conocer el `WM_CLASS` permite:

  * **Crear o asignar iconos personalizados.**
  * **Configurar reglas de ventana en Openbox** (por ejemplo, forzar que siempre abra en cierto escritorio).

---

## **4. Crear un icono para la aplicación (ejemplo: `xinput-gui`)**

### **Paso 1: Crear el archivo `.desktop` (si no existe)**

Si la aplicación no tiene su lanzador:

```bash
nano ~/.local/share/applications/xinput-gui.desktop
```

Contenido:

```ini
[Desktop Entry]
Name=XInput GUI
Exec=xinput-gui
Icon=xinput-gui
Type=Application
Categories=Settings;
StartupWMClass=xinput-gui
```

### **Paso 2: Crear o copiar un icono**

Coloca un icono PNG o SVG con el mismo nombre:

```bash
mkdir -p ~/.local/share/icons/hicolor/48x48/apps
cp tu_icono.png ~/.local/share/icons/hicolor/48x48/apps/xinput-gui.png
```

### **Paso 3: Actualizar caché de iconos**

```bash
gtk-update-icon-cache ~/.local/share/icons/hicolor
```

### **Paso 4: Reiniciar tint2**

```bash
pkill tint2 && tint2 &
```

---

## **Resultado esperado**

* Ahora `xinput-gui` tendrá un icono personalizado en tint2.
* Este procedimiento también sirve para cualquier otro programa escrito en Python (como `arandr`).

---



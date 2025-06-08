¡Perfecto! Me alegra saber que funcionó con la línea directa en `Exec`.

Aquí tienes un **tutorial listo para publicar en tu blog de Blogger**, claro, bien estructurado y pensado para personas que quieran **ejecutar automáticamente un script Python con interfaz gráfica (GUI) al iniciar su ordenador** con un entorno XFCE (como en MX Linux).

---

## 🐧 Cómo ejecutar un script Python con GUI al iniciar el sistema en Linux (XFCE)

¿Tienes un script en Python con una interfaz gráfica (GUI) y te gustaría que se abra automáticamente cada vez que inicias tu ordenador? Si usas una distribución con entorno de escritorio XFCE (como **MX Linux**, **Xubuntu**, etc.), este tutorial es para ti.

---

### ✅ Requisitos previos

Antes de comenzar, asegúrate de tener:

* Un script Python que funcione con GUI (Tkinter, PyQt, etc.).
* Python 3 instalado (lo normal en la mayoría de distribuciones).
* Un entorno de escritorio XFCE.

---

### 📝 Paso 1: Verifica que el script funcione

Primero, asegúrate de que tu script se abre correctamente desde la terminal. Abre una terminal y escribe:

```bash
python3 /ruta/completa/a/tu/script.py
```

Ejemplo:

```bash
python3 /home/juan/Dev/xsct_gui/xsct_gui.py
```

Si se abre la ventana correctamente, ya tienes lo más importante listo.

---

### 📁 Paso 2: Crear el archivo `.desktop` de inicio automático

En XFCE, puedes agregar aplicaciones al inicio colocando archivos `.desktop` en el directorio:

```
~/.config/autostart/
```

Vamos a crear uno para tu script.

#### 1. Abre una terminal y ejecuta:

```bash
nano ~/.config/autostart/mi-script-python.desktop
```

#### 2. Pega el siguiente contenido (ajusta las rutas a las tuyas):

```ini
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=Mi Script Python
Comment=Ejecuta un script Python con GUI al iniciar el sistema
Exec=python3 /home/juan/Dev/xsct_gui/xsct_gui.py
OnlyShowIn=XFCE;
StartupNotify=false
Terminal=false
Hidden=false
```

Guarda y cierra (en `nano` presiona `Ctrl + O`, luego `Enter`, y después `Ctrl + X`).

---

### 🔐 Paso 3: Asegúrate de que el script es ejecutable

Aunque no siempre es necesario, es buena práctica:

```bash
chmod +x /home/juan/Dev/xsct_gui/xsct_gui.py
```

---

### 🧪 Paso 4: Reinicia para probar

Reinicia tu ordenador y deberías ver que el script se abre automáticamente al iniciar sesión.

---

### 🛠 Consejos adicionales

* Si el script no se ejecuta al inicio, puedes revisar si se han generado errores en los archivos de log del sistema, o redirigir la salida de errores a un archivo con esta línea en el `.desktop`:

```ini
Exec=python3 /home/juan/Dev/xsct_gui/xsct_gui.py > /home/juan/script_log.txt 2>&1
```

* Asegúrate de no usar rutas relativas ni scripts que dependan de un `cd`, ya que el sistema podría ejecutar el script desde un directorio diferente al esperado.

---

### 🎉 ¡Listo!

Ahora tu script Python con GUI se ejecutará automáticamente al encender tu PC. Ideal para herramientas personalizadas, utilidades, interfaces de monitoreo, etc.

---

Si tienes dudas o deseas automatizar más tareas en Linux, ¡déjalo en los comentarios!

---

¿Quieres que te genere también una **imagen para la entrada del blog** con un título llamativo o una miniatura?

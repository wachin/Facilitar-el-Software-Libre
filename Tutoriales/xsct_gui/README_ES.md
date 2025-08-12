# 🖥️ xsct_gui

[![Topic](https://img.shields.io/badge/topic-linux%20x11%20gui-blueviolet)](https://github.com/topics/linux)


## 🖥️ xsct_gui – Fácil control de la luz de tu pantalla (para X11 Window Manager)

Este programa te ayuda a **cambiar el color y el brillo de tu pantalla** en Linux, para que sea más cómoda de ver, especialmente por la noche. 

Es como agregar un “filtro de luz cálida” (similar al modo nocturno de tu teléfono que reduce la lúz azúl) para reducir la fatiga visual y hacer que el uso de pantallas a altas horas de la noche sea más llevadero para tus ojos.

`xsct_gui` es una interfáz gráfica para [xsct](https://github.com/faf0/sct), una pequeña herramienta de línea de comandos que cambia la temperatura de color de la pantalla usando `xrandr`.

---

## 🎯 ¿Qué hace este programa?

- 🔆 **Ajusta el color de la pantalla**: Puedes hacerla más naranja (cálida) o más blanca (fría).
- 💡 **Cambia el brillo**: Puedes hacerla más oscura o más clara.
- 🖱️ Todo con una **interfaz sencilla y fácil de usar**, con barras deslizantes.

> ✅ Ideal para usar de noche, estudiando o trabajando en la computadora. Trata de que el color de la pantalla se asemeje al de tu cuarto, que por cierto en la noche es mejor que uses un tipo de foco o iluminación que no tenga mucha luz azúl

---

## 🧰 Lo que necesitas tener instalado

Necesitará un sistema Linux con el **Gestor de Ventanas X11** (no Wayland).

A partir de 2025, estos entornos de escritorio aún admiten sesiones X11:

- GNOME
- KDE
- Linux Mint
- XFCE
- LXQt
- LXDE
- Openbox, Fluxbox, JWM y otros gestores de ventanas X11

> ❗ Esta herramienta **no funciona en Wayland**. Asegúrese de iniciar sesión con una sesión X11.

### ✅ Cómo instalar todo (en una sola línea)

Abre una terminal (Ctrl + Alt + T) y escribe:

```bash
sudo apt install python3 python3-tk xsct python3-pil.imagetk python3-cairosvg
```

|              Programa              |                       ¿Para qué sirve?                       |
| ---------------------------------- | ------------------------------------------------------------ |
| **Python 3**                       | Es el lenguaje en el que está hecho el programa.             |
| **Tkinter** (`python3-tk`)         | Sirve para mostrar la ventana y botones.                     |
| **Pillow** (`python3-pil.imagetk`) | Permite mostrar colores bonitos en las barras.               |
| **CairoSVG** (`python3-cairosvg`)  | Necesario para ver el ícono del programa.                    |
| **xsct**                           | Es el programa que realmente cambia el color de tu pantalla. |
| **Papirus Icon Theme**             | Da el ícono bonito a la ventana.                             |


## 🐧 Soporte de distribución de Linux

### Ubuntu
Si usas Ubuntu y sus sabores, en los que se pueda iniciar sesión con X11, esos paquetes están en los repositorios desde:

- [https://packages.ubuntu.com/xsct](https://packages.ubuntu.com/xsct) **Desde noble (24.04LTS)**
- [https://packages.ubuntu.com/papirus-icon-theme](https://packages.ubuntu.com/papirus-icon-theme) Desde jammy (22.04LTS)
- [https://packages.ubuntu.com/python3](https://packages.ubuntu.com/python3) Desde jammy (22.04LTS)
- [https://packages.ubuntu.com/python3-tk](https://packages.ubuntu.com/python3-tk) Desde jammy (22.04LTS)  
- [https://packages.ubuntu.com/python3-pil.imagetk](https://packages.ubuntu.com/python3-pil.imagetk) Desde jammy (22.04LTS) 
- [https://packages.ubuntu.com/python3-cairosvg](https://packages.ubuntu.com/python3-cairosvg) Desde jammy (22.04LTS)

**Nota:** Linux Mint está basado en Ubuntu, puede que allí también tengan estos paquetes esos nombres.


### Debian
Si usas Debian y sus derivados como MX Linux, antiX, etc, en los que se pueda iniciar sesión con X11, esos paquetes están en los repositorios desde:
 
* [https://packages.debian.org/xsct](https://packages.debian.org/xsct) **desde Debian 12** 
* [https://packages.debian.org/papirus-icon-theme](https://packages.debian.org/papirus-icon-theme) Desde Debian 10 
* [https://packages.debian.org/python3](https://packages.debian.org/python3) Desde Debian 10 
* [https://packages.debian.org/python3-tk](https://packages.debian.org/python3-tk) Desde Debian 10  
* [https://packages.debian.org/python3-pil.imagetk](https://packages.debian.org/python3-pil.imagetk) Desde Debian 10 
* [https://packages.debian.org/python3-cairosvg](https://packages.debian.org/python3-cairosvg) Desde Debian 10 

**Nota:** MX Linux 23, antiX 23 y otros están basados en Debian 12

---

## ▶️ Cómo usar el programa

### OPCIÓN 1.- Abre el script Launcher.sh

1. Asegúrate que el script `Launcher.sh`está como ejecutable, en el administrador de archivos dele clic derecho y en la pestaña "**Permisos**" asegúrese de que "**es ejecutable**"
2. Dele doble clic al script `Launcher.sh`

👉 Se abrirá una ventana con dos controles:

![](src/vx_images/01-xsct_guit-main-window.webp)

### OPCIÓN 2.- Desde una terminal ejecuta `python3 xsct_gui.py`

1. **Abre una terminal** (tecla: `Ctrl + Alt + T`)
2. **Ve a la carpeta** donde guardaste el archivo `xsct_gui.py`.  
   Por ejemplo:
   ```bash
   cd Descargas
   ```
3. **Ejecuta el programa** con este comando:
   ```bash
   python3 xsct_gui.py
   ```

👉 Se abrirá una ventana con dos controles:

---

## 🎛️ Controles de la interfaz

### 1. 🌡️ Temperatura de color (de 2000K a 6500K)

- **Izquierda (2000K)**: color naranja cálido → ideal para la noche.
- **Derecha (6500K)**: blanco brillante → ideal para el día.

> 📌 Mueve el deslizador para elegir el color que más te guste.

---

### 2. 💡 Brillo (de 0.200 a 1.000)

- **Izquierda (0.200)**: muy oscuro → buenísimo para la oscuridad.
- **Derecha (1.000)**: brillo máximo → para ambientes claros.

> 📌 Mueve el deslizador para ajustar el brillo.

---

## 🔄 ¿Los cambios se aplican solos?

¡Sí! Cada vez que mueves una barra, el cambio se aplica **automáticamente**.

También puedes hacer clic en el botón **"Acerca de..."** para ver información del programa.

---

## 💡 Consejos para usarlo bien

| Situación | Recomendación |
|---------|----------------|
| 🌙 **De noche o en una habitación oscura** | Usa **3000K – 4000K** de temperatura y **0.700 – 0.800** de brillo. |
| ☀️ **Durante el día o con luz natural** | Usa **5500K – 6500K** y brillo al máximo (**1.000**). |
| 👀 **Si te duelen los ojos** | Prueba con más naranja y menos brillo. |

> 🔎 **Experimenta** hasta encontrar la combinación que más cómoda te parezca, además según el cuarto y el tipo de foco donde estés.

---

## 🛠️ ¿Puedo modificar el programa?

¡Claro! Este programa está hecho en **Python** y puedes abrir el archivo `xsct_gui.py` con cualquier editor de texto (como **Geany**, **Thonny** o **Mousepad**) para ver cómo funciona o cambiar colores, mensajes, etc.

> 📚 Es un buen ejemplo para aprender sobre interfaces gráficas con **Tkinter**.

---

## 📚 Más información

- 🐍 Código del programa GUI: [https://github.com/wachin/xsct_gui](https://github.com/wachin/xsct_gui)
- ⚙️ El programa CLI "xsct": [https://github.com/faf0/sct](https://github.com/faf0/sct)

---

## 🙌 Sobre este programa

Este programa fue creado por **Washington Indacochea** (wachin.id@gmail.com), con licencia libre **GNU GPL3**

> ✨ ¡Gracias por usarlo!  
> Que tu pantalla sea siempre cómoda para tus ojos. 👀💙

---

> 📝 Nota: Si usas una versión antigua de Debian (como Buster), puede que debas cambiar `xsct` por `sct` en el código. Pero en Debian 12 y MX Linux 23, todo funciona sin problemas.

---

✅ Listo. Ahora ya sabes cómo usar `xsct_gui`.  
¡Abre la terminal y prueba cambiar el color de tu pantalla especialmente en la noche! 🌈🖥️

# Para Instalar en Debian 11 bullseye, Debian 10 buster, compilar sct
Necesitamos las siguientes dependencias para poder compilar el código fuente y que se pueda instalar xsct en Debian 11, 10:

```bash
sudo apt install libx11-dev libxrandr-dev
```
Luego, clone el repositorio de xsct:

```
git clone https://github.com/faf0/sct
```
y entre allí
```
cd sct
```
y compilelo:

```
make
```

no se demora mucho en compilar, es rapidísimo, e instálelo:

```
sudo make install
```
aquí pongo una captura de pantalla:

![](src/vx_images/02-sct-compilado-en-debian-11-10.png)

## Dependencias para xsct_gui en Debian 11, 10
1. Para usar la interfáz gráfica para xsct necesitamos instalar:
```bash
sudo apt install python3 python3-tk python3-pil.imagetk python3-cairosvg
```
y ahora si:

2. Navega hasta el directorio donde guardaste el archivo `xsct_gui.py`.
3. Ejecuta el siguiente comando:  

```python
python3 xsct_gui.py
```

> 🙏 Dios les bendiga


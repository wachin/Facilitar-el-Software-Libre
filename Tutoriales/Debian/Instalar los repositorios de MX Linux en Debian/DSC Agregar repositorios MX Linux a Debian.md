# Instalar los repositorios de MX Linux 23 en Debian 12

Este tutorial es para instalar los repositorios de MX Linux a Sistemas Operativos Debian y basados en Debian que no lo tienen añadido, y para instalar el Instalador de paquetes de MX Linux el cual es un Centro de Software con una colección de los mejores programas para Linux

## ¿Qué programas se pueden instalar desde MX Instalador de paquetes?

Este programa trae una Colección de Software que está organizado en **pestañas o colecciones**, cada una enfocada en un tipo de software o necesidad específica:

### 🖥️ Programas disponibles en el instalador de MX Linux

|        **Categoría**         |    **Nombre del Programa**     |                                           **Descripción**                                           |
| ---------------------------- | ------------------------------ | --------------------------------------------------------------------------------------------------- |
| **Acceso remoto**            | ssh Conduit                    | Una forma sencilla de usar recursos remotos a través de una conexión cifrada SSH                    |
|                              | TeamViewer                     | Acceso remoto TeamViewer                                                                            |
|                              | x11vnc                         | Servidor VNC para el entorno de ventanas X                                                          |
|                              | GNOME Base                     | Instalación mínima de GNOME Shell                                                                   |
|                              | KDE5 Standard                  | Instala `kde-standard`, `kde-plasma-desktop`                                                        |
|                              | LXDE                           | Instalación mínima de LXDE                                                                          |
|                              | MATE                           | Instalación mínima del escritorio MATE                                                              |
|                              | Xfce                           | Xfce (MX Linux)                                                                                     |
|                              | Asunder                        | Destripador y codificador gráfico de CD de audio                                                    |
|                              | Audacious                      | Reproductor de audio ligero, estilo Winamp/XMMS                                                     |
|                              | Audacity                       | Editor de audio multi-pistas                                                                        |
|                              | Clementine                     | Reproductor de música moderno y organizador de biblioteca                                           |
|                              | DeaDBeeF                       | Reproductor de audio sencillo                                                                       |
|                              | MOC                            | Reproductor de audio para consola de comandos, potente y fácil de usar                              |
|                              | Pithos                         | Cliente de radio Pandora nativo                                                                     |
|                              | PulseEffects                   | Ecualizador de PulseAudio                                                                           |
|                              | Qmmp                           | Reproductor de audio tipo Winamp/XMMS muy completo, escrito en Qt                                   |
|                              | XMMS                           | Reproductor multimedia estilo Winamp                                                                |
| **Centro multimedia**        | Convertidor de media           | Convierte entre formatos de audio y video                                                           |
|                              | Plex                           | Servidor multimedia Plex (incluye cliente web; requiere reinicio)                                   |
|                              | HandBrake                      | Versátil herramienta para rippear DVD y transcodificar video (CLI y GUI)                            |
|                              | WinFF                          | Conversor gráfico de formatos de audio y video                                                      |
| **Desarrollo**               | deb packaging tools            | Herramientas para la creación de paquetes `.deb`                                                    |
|                              | Geany                          | Editor de textos rápido y ligero (IDE)                                                              |
|                              | GIT Tools                      | Herramientas de repositorio GIT                                                                     |
|                              | kdiff3                         | Herramienta gráfica de comparación de archivos (3 archivos)                                         |
|                              | kompare                        | Herramienta gráfica de comparación de archivos                                                      |
|                              | Meld                           | Herramienta gráfica de comparación de archivos                                                      |
|                              | QT5 Documentation              | Documentación de Qt5 y del IDE QtCreator                                                            |
|                              | QT5 Dev Environment            | Entorno de desarrollo QT5                                                                           |
| **Docks**                    | Cairo Dock                     | Muelle compatible con plugins 3D                                                                    |
|                              | Plank                          | Dock simple y atractivo                                                                             |
| **Email**                    | Claws-Mail                     | Cliente de correo electrónico ligero                                                                |
|                              | Evolution                      | Suite groupware con cliente de correo y organizador                                                 |
|                              | KMail                          | Cliente de correo del entorno KDE                                                                   |
|                              | Thunderbird                    | Cliente de correo electrónico Thunderbird                                                           |
| **FTP**                      | FileZilla                      | Cliente FTP con interfaz completa y fácil de usar                                                   |
|                              | gFTP                           | Cliente FTP multiproceso                                                                            |
| **Gestores de archivos**     | Dolphin                        | Gestor de archivos predeterminado de KDE Plasma                                                     |
|                              | Nemo                           | Gestor de archivos predeterminado de Cinnamon                                                       |
|                              | PCManFM                        | Gestor de archivos rápido y ligero                                                                  |
|                              | ROX Filer                      | Gestor gráfico de archivos rápido y potente                                                         |
|                              | SpaceFM                        | Gestor de archivos multi-panel con pestañas y soporte de escritorio                                 |
|                              | Sunflower                      | Pequeño y altamente personalizable gestor de archivos de doble panel                                |
| **Gestores de ventanas**     | IceWM                          | Entorno de escritorio ligero                                                                        |
|                              | Fluxbox (con MX-flux settings) | Entorno ligero y minimalista                                                                        |
| **Gráficos**                 | Blender                        | Suite de animación 3D libre y de código abierto                                                     |
|                              | digiKam                        | Gestión de fotos digitales (proyecto KDE)                                                           |
|                              | font-manager                   | Aplicación de gestión de fuentes del escritorio GNOME                                               |
|                              | photocx                        | Gestiona y edita grandes colecciones de fotos                                                       |
|                              | GIMP Basic                     | Editor de imágenes avanzado (solo GIMP)                                                             |
|                              | GIMP Full                      | Editor de imágenes avanzado (GIMP + ayuda y plugins)                                                |
|                              | gscan2pdf                      | GUI para crear archivos PDF o DjVu a partir de documentos escaneados                                |
|                              | gThumb                         | Navegador y visor de imágenes avanzado                                                              |
|                              | ImageMagick                    | Software para crear, editar y componer imágenes de mapa de bits                                     |
|                              | Inkscape                       | Programa de dibujo vectorial                                                                        |
|                              | Krita                          | Aplicación creativa para imágenes ráster                                                            |
|                              | LazPaint                       | Editor de imágenes con capas raster y vectoriales                                                   |
|                              | Mirage                         | Visor de imágenes rápido y simple                                                                   |
| **Oficina**                  | AbiWord                        | Procesador de textos ligero                                                                         |
|                              | Calibre (latest)               | Organizador de biblioteca de e-books (última versión)                                               |
|                              | Calibre                        | Organizador de biblioteca de e-books                                                                |
|                              | Evince                         | Visor de documentos (PostScript, PDF) simple                                                        |
|                              | Foliate                        | Visor de libros electrónicos simple y moderno                                                       |
|                              | GnuCash                        | Software de contabilidad personal y para pequeñas empresas                                          |
|                              | Gnumeric                       | Hoja de cálculo ligera                                                                              |
|                              | Kapow                          | Reloj de tiempo de perforación (punch clock)                                                        |
|                              | LibreOffice                    | Meta-paquete para LibreOffice                                                                       |
|                              | LibreOffice (backports)        | Versión actualizada desde backports, pero a veces algún paquete da conflicto y no se puede instalar |
|                              | Microsoft Fonts                | Fuentes clásicas de Microsoft (Arial, Times, etc.)                                                  |
|                              | Okular                         | Visor universal de documentos (ADVERTENCIA: instala componentes de KDE)                             |
|                              | PDF Arranger                   | Combinar, dividir y reorganizar páginas de PDF                                                      |
| **Papel tapiz (Wallpapers)** | MX 14 Wallpapers               | Fondos de escritorio de MX 14                                                                       |
|                              | MX 15 Wallpapers               | Fondos de escritorio de MX 15                                                                       |
|                              | MX 16 Wallpapers               | Fondos de escritorio de MX 16                                                                       |
|                              | MX 17 Wallpapers               | Fondos de escritorio de MX 17                                                                       |
|                              | MX 18 Wallpapers               | Fondos de escritorio de MX 18                                                                       |
|                              | MX 19 Wallpapers               | Fondos de escritorio de MX 19                                                                       |
|                              | MX 21 Wallpapers               | Fondos de escritorio de MX 21                                                                       |
|                              | MX Fluxbox Wallpapers          | Fondos con tema Fluxbox (basados en MX 19)                                                          |
| **Temas**                    | Bluebird                       | Tema GTK+ azul del proyecto Shimmer                                                                 |
|                              | Breeze (GTK)                   | Tema GTK que coincide con KDE Breeze                                                                |
|                              | darkblood                      | Tema GTK oscuro con acento rojo profundo                                                            |
|                              | darkcold                       | Tema GTK oscuro con acento azul                                                                     |
|                              | darkfire                       | Tema GTK oscuro con acento rojo                                                                     |
|                              | darkiiniiL                     | Tema GTK oscuro con acento verde                                                                    |
|                              | grub-themes-mx                 | Temas para el menú de arranque GRUB                                                                 |
|                              | Materia (KDC)                  | Tema KDC que combina con Materia                                                                    |
|                              | Materia                        | Tema de diseño Material                                                                             |
|                              | Numix                          | Tema plano moderno del proyecto Numix                                                               |
|                              | Obsidian-2 Gtk Theme           | Tema GTK oscuro                                                                                     |
|                              | Orchis                         | Tema de diseño Material                                                                             |
|                              | Yaru                           | Familia de temas de Ubuntu                                                                          |
| **Torrent**                  | Deluge                         | Cliente BitTorrent escrito en Python/PyGTK                                                          |
|                              | qBittorrent                    | Cliente BitTorrent completo y ligero, similar a uTorrent                                            |
|                              | rTorrent                       | Cliente BitTorrent basado en ncurses                                                                |
| **Utilidades**               | Advert-Block-antiX             | Bloquea servidores de anuncios mediante archivo hosts modificado                                    |
|                              | Clonezilla                     | Clona y restaura discos y particiones                                                               |
|                              | Grub Customizer                | Personaliza el menú de arranque GRUB                                                                |
|                              | KeePassXC                      | Administrador de contraseñas de código abierto                                                      |
|                              | Redshift                       | Ajusta la temperatura del color de la pantalla según la hora del día                                |
|                              | Synapse                        | Lanzador semántico de archivos                                                                      |
|                              | Synaptic Package Manager       | Administrador de paquetes gráfico                                                                   |
|                              | Variety                        | Cambiador de fondos de escritorio                                                                   |
|                              | VeraCrypt                      | Herramienta de cifrado de disco (fork de TrueCrypt)                                                 |
|                              | Xfce4 Appfinder                | Buscador de aplicaciones del proyecto Xfce                                                          |
| **Capturas de pantalla**     | ksnip                          | Herramienta de captura inspirada en Snipping Tool (basada en Qt)                                    |
|                              | shutter                        | Programa de captura de pantalla con muchas funciones                                                |
|                              | xfce4-screenshot               | Herramienta de captura integrada en Xfce                                                            |
| **Video**                    | Celluloid                      | Reproductor multimedia gráfico que usa mpv                                                          |
|                              | Kdenlive                       | Editor de video no lineal de KDE                                                                    |
|                              | libdvdcss                      | Biblioteca para reproducir DVDs comerciales                                                         |
|                              | MPlayer                        | Potente reproductor multimedia                                                                      |
|                              | OpenShot                       | Editor de video no lineal                                                                           |
|                              | SMPlayer                       | Interfaz gráfica temática para MPlayer con funciones adicionales                                    |
|                              | SMtube                         | Busca y descarga videos de YouTube                                                                  |
|                              | VLC                            | Reproductor multimedia y streamer                                                                   |
| **Juegos**                   | Lutris                         | Suite de instalación de juegos (wrapper)                                                            |
|                              | PlayOnLinux                    | Herramienta para instalar juegos de Windows en Linux                                                |
|                              | Steam                          | Plataforma de juegos Steam                                                                          |
|                              | Steam Device Support           | Soporte para dispositivos de entrada y realidad virtual de Steam                                    |
|                              | SuperTux                       | Juego de plataformas estilo Mario con Tux                                                           |
|                              | SuperTuxKart                   | Juego de carreras estilo Mario Kart                                                                 |
| **Kernels**                  | antiX 4.19 pae 32 bit          | Kernel antiX 4.19.276 (parches Meltdown/Spectre), PAE, 32 bits                                      |
|                              | antiX 4.9 32 bit no-pae        | Kernel antiX 4.9.326, 32 bits, sin PAE                                                              |
|                              | antiX 4.9 32 bit pae           | Kernel antiX 4.9.326, 32 bits, con PAE                                                              |
|                              | antiX 5.10 32 bit pae          | Kernel antiX 5.10.234, 32 bits, con PAE                                                             |
|                              | Debian 32 bit no-pae           | Kernel predeterminado de Debian con paquete de actualizaciones automáticas                          |
|                              | Debian 32 bit w/PAE            | Kernel predeterminado de Debian con PAE y actualizaciones automáticas                               |
| **Navegadores**              | Chromium                       | Navegador Chromium con paquete de idioma                                                            |
|                              | Falkon                         | Navegador ligero (antiguo QupZilla)                                                                 |
|                              | Firefox-ESR                    | Versión soportada a largo plazo de Firefox                                                          |
|                              | Firefox                        | Última versión de Firefox                                                                           |
|                              | Opera                          | Navegador Opera                                                                                     |
|                              | Palemoon                       | Navegador desde el repositorio de MX Linux                                                          |
| **Niños / Educación**        | Preschool                      | Incluye: Gamine, GCompris, TuxPaint                                                                 |
|                              | Primary                        | Incluye: GCompris, Laby, Ri-li, Stellarium, TuxMath, TuxPaint, TuxType, Marble                      |
|                              | Secondary                      | Incluye: Alibre, Dia, Laby, Melting, Ri-li, Stellarium                                              |
|                              | Scratch                        | Entorno de programación gráfica del MIT (https://scratch.mit.edu/)                                  |
| **Mensajería**               | Finch                          | Cliente de mensajería instantánea modular para terminal                                             |
|                              | Pidgin                         | Cliente de chat fácil de usar y gratuito                                                            |
| **Misceláneos**              | AppArmor                       | Componentes del espacio de usuario de AppArmor (seguridad)                                          |
|                              | Google Earth                   | Globo terráqueo de Google Earth                                                                     |
|                              | Java                           | Java 17 (instala openjdk-17)                                                                        |
|                              | Wine                           |                                                                                                     |
| **Lectores de noticias**     | Newsboat                       | Lector de fuentes RSS en modo texto con soporte para podcasts                                       |
|                              | Pan                            | Lector de noticias Usenet (GNOME)                                                                   |
| **Impresión**                | HP Printing                    | HPLIP y complementos para impresoras HP                                                             |


y además poder instalar las últimas versiones de algunos programas, desde la pestaña de los repositorios de prueba o los backpots de Debian


## Sobre usar este tutorial en Administradores de ventana minimalista como fluxbox, jwm, iceWM, Opebox, etc
Este tutorial es para usarlo en un Sistema Operativo Linux que trae por defecto su Gestor de Ventanas, pero si deseas allí instalar otro, por ejemplo Openbox, Fluxbox, JWM, etc, debes revisar el siguiente tutorial para activar PolicyKit:

**Activar el agente de PolicyKit en Openbox y gestores de ventanas ligeros x11**  
[https://facilitarelsoftwarelibre.blogspot.com/2025/05/activar-el-agente-de-policykit-en-openbox-y-gestores-de-ventanas-ligerosx11.html](https://facilitarelsoftwarelibre.blogspot.com/2025/05/activar-el-agente-de-policykit-en-openbox-y-gestores-de-ventanas-ligerosx11.html)


## Qué se puede instalar desde este repositorio en Synaptic?

En los repositorios de MX Linux hay software muy importante como ejemplo que se puede encontrar en Synaptic:

**Extensiones para Dolphin Administrador de archivos:**

- **kde-servicemenu-extract-and-compress**: Pone un menú Extraer y Comprimir.
- **kde-servicemenu-checkhash-installdebs**: Permite instalar deb.
- **kde-servicemenu-rootactions**: Permite realizar acciones con elevación de permisos.
- **kde-servicemenu-kim5**: Permite realizar operaciones con imágenes.

**Herramientas**

- **deb-installer**: Instalador de paquetes deb
- **ksnip**: Capturado de pantalla (versión actualizada)
- **avidemux**: editor de video (En el 2025-05-016 no lo pude instalar porque dice que depende de libfaac0, libfdk-aac2 y no se pueden instalar)
- **yt-dlp**: [Descargador de videos](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-yt-dlp-en-termux-para-descargar-vieos-audios-de-youtube-y-otros-sitios.html) (versión actualizada)
- **telegram-desktop** = Telegram (32 y 64 bit)
- **formatusb**: Para formatear un Pendrive
- **virtualBox**: La máquina virtual
- **mx-snapshot**: MX Snapshot es una herramienta utilizada para crear un CD en vivo desde el sistema en ejecución (Respins)
- **Firmware**: [Controladores](https://facilitarelsoftwarelibre.blogspot.com/2021/11/firmware-instalado-en-mx-linux-21-de-32.html), ejemplo de Wi-Fi, otros
- otros

**Nota**: Se pueden instalar las últimas versiones, pero no es necesario si ya las movieron al repo estable, más abajo explico con más detalle.

### Advertencia con MX repo de prueba o Backports de Debian

Algunos programas podrían dar fallos, ejemplo en el 2025-07-17 instalé a Gimp 3.0.0 RC2 desde el "MX Repo de prueba" y se colgaba a veces, por lo que no me servía. En la siguiente imagen se ve dónde ya lo había desinstalado y está disponible en el MX Repo de prueba la versión 3.0.0 RC2:

![Gimp 3.0.0 RC2 desde el MX Repo de prueba](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgaAuJBonw0vjV4bTRTvZAhNumjlD7ramUiPZ2E6WBk4sI_Knl9O85KMQo5Fth7UEc7vTB3qSri0TjQf3RHmi8MHTdOMHnbjlaXfbIsbw47xDCAxH2Afu2mwX6adm4G1I43xJNah97vEezwFeWS0mURz7LhUo_PAsTiphwtQuC3S7aj8c_zub7oEBjams4/s16000/20250718-114358%20desde%20el%20MX%20Repo%20de%20prueba%20no%20instalen%20a%20Gimp%203.0.0%20RC2.png)

Para desinstalarlo tuve que deshabilitar los repositorios de MX Linux desde Synaptic (como indico más abajo) y desinstalar Gimp 3 y todos los paquetes referidos a él e instalar la versión de los repositorios de Debian.

## Añadiendo los repositorios de MX Linux a Debian 12

La siguiente es una explicación genérica que hago para Debian 12, y estas explicaciones deberán servir para hacer esto en Debian 11, y Debian 10 (más abajo dejo las líneas para ellos)

Para añadir el repositorio de MX Linux debemos añadirlo en el:

`/etc/apt/sources.list.d/`

podemos hacerlo fácilmente con gedit que permite elevar los permisos

Además si desean se puede usar un **editor de texto de terminal** como [nano](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html) o [vim](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html)

## Usando Gedit para añadir MX repo a sources.list.d

Poniendo en la terminal:

```bash
sudo gedit /etc/apt/sources.list.d/mx.list
```

se abrirá gedit y copiar el siguiente texto para Debian 12:

```
#MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ bookworm main non-free

#deb http://mxrepo.com/mx/repo/ bookworm test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bookworm ahs
```

y pegarlo allí, y guardar y cerrar

### Instalando la llave

Ahora descargue la llave MX23 desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/mx23-archive-keyring_2023.6.6_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/mx23-archive-keyring_2023.6.6_all.deb)

![mx23-archive-keyring_2023.6.6_all.deb](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhueQdbSd8OHyGbUnbS4cXkpp08vfq8YxpzLEjJfeAvRsOkGQD4-c2emanbOU_raOzAPloBJyC_r5fdAVQM-Iz5hFhNr27VrIIjD8ABWMorC_Gmj_960QIfQIYMfXUt5_e2XLUp7fa-ogoP_VcnmdY5MTMoHaK60UVM3fmpTIbo0JdbWN8w2vltq_SKgAQ/s790/20240719-082459%20mx23-archive-keyring_2023.6.6_all.deb.png)

**Nota:** Es posible que con el paso del tiempo lo cambien con otro más actual y cambie el nombre de la versión.

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx23-archive-keyring_*.*.deb
```

Este comando se descompone en varias partes:

1. **`sudo`**: Ejecuta el comando con privilegios de superusuario (root). Esto es necesario porque instalar paquetes en el sistema requiere permisos de administrador.

2. **`dpkg -i`**: `dpkg` es el gestor de paquetes de bajo nivel en Debian y sus derivados, como Ubuntu. La opción `-i` (o `--install`) indica que quieres instalar un paquete.

3. **`mx23-archive-keyring_*.*.deb`**: Especifica el paquete que deseas instalar. En este caso, es un archivo `.deb` que contiene el keyring (anillo de claves) para los repositorios de MX Linux 23. El uso del comodín `*.*` permite coincidir con cualquier versión del paquete, es decir, no importa cuál sea el número de versión, siempre que comience con `mx23-archive-keyring`.

En conjunto, el comando instala el paquete `mx23-archive-keyring` que contiene las claves públicas necesarias para verificar la autenticidad de los paquetes del repositorio de MX Linux 23. Estas claves son importantes para asegurar que los paquetes instalados desde los repositorios no han sido manipulados y provienen de una fuente confiable.

**Actualizar la lista de repositorios**: después de guardar el archivo, ejecuta:

```bash
sudo apt update
```

Siguiendo estos pasos, habrás añadido el repositorio y actualizado la lista de paquetes en tu sistema.

o también se pueden actualizar desde synaptic

**Recargue** los repositorios le recomiendo desde Synaptic:

![Recarga repos en Synaptic](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-laJM3nUXcOzImy90UkmyZU1PMtg3xZCMq-XCk9h7_NiAUuVXFHioCfb-G-64htcQVXuSb74YIFrrgaaBNpnklgHj6qRVHaejuN8vpm-64omih6XcFMZxaGQwEaOu1oSTvmto3dDb-oVHVbfmBPEkarEt9YM4pkQVxzHvaoMtedv-4YP7Ecx4edTFG98/s860/20240719-083406%20synaptic%20Recarga%20repos.png)

e instale el programa que necesite

En la siguiente imagen les indico cómo ver sólo los del repositorio de MX Linux en Synaptic:

![Repositorios de MX Linux activados en Debian 12](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgxQI40yxl3gelqmUdDSRmTa5h6jJglCx-E-YtpcHsQRyc3B4941PukhXHsYziBYYtYPSEP_LQQNRLn0IeoTR3jI1XRc46ObfWTfyALpiop5j_4bRqhjLGsgqGjd1jD6iN2Zg2tUiUXTsK4gn71_ER-5YcQUSchjt4MOH13CthEikvqGDB1RoQC4FZbIzA/s964/20240719-083602%20repositorios%20de%20MX%20Linux%20activados%20en%20Debian%2012.png)

## MX Instalar paquetes

Los siguientes paquetes los podemos buscar en Synaptic e instalarlos uno por uno, pero también lo podemos cerrar Synaptic e instalarlos de un solo poniendo en la terminal:

```bash
sudo apt install mx-repo-list mx-repo-manager mx-packageinstaller deb-installer
```

y luego buscarlo y abrirlo:

![MX Instalar paquetes](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0dPdD7n0wFZEQCf5ttuyRGwhGKTvwtPwK_c0KcMKOdnSBcPpOkYD1LWdCXc1K2Rj9wSiqJhRM7_D1Al7RUJl28AutV4OVyKAoFsIb5M4_Y-ia6PCfuJgl-_vypXKTwH8IICMl6LoTzx6jjgAW5x25EwZ9C1kFFM-BEw_zs8FebSGOMSil_b4Ma0x8k8k/s562/20240205-054409%20MX%20Instalar%20paquetes.png)

**Nota**: La imagen de arriba es en xfe4-appfinder en MX Linux 21 usando el administrador de ventanas Fluxbox.

y cuando de clic derecho en un paquete deb desde el administrador de archivos podría instalarlo con **deb-installer**

## Cómo instalar actualizado a yt-dlp desde los paquetes de Prueba (test)

El siguiente programa es un ejemplo de los programas que ahora están disponibles para instalar. El programa yt-dlp que sirve para descargar videos, audios, de Youtube, Facebook, Instagram, Tiktok, Twitter, otros desde la terminal

En la fecha 18 de Mayo de 2025 una versión muy actual de este mismo año está en los repositorios estables de MX Linux, así lo puedes instalar desde Synaptic o desde la terminal:

```bash
sudo apt install yt-dlp
```

Si no usas MX Linux y usas algún Debian basado en este, una vez que instales los repositorios, lo podrás instalar así.

### El motivo de ser de los repositorios de prueba

Los programas que hay en los repositorios de prueba son programas cuya finalidad es que después que estén corregidos por haber pasado en tantas pruebas puedan pasar a los repositorios estables de MX Linux, por tal motivo es posible que después que hayan dejado bien estable algún programa, lo pasen desde los repositorios de prueba a los repositorios estables (o sea, llegará un momento en que es posible que no veamos tal o cual versión en los repositorios de prueba sino en los estables)

sigamos, clic en la pestaña:

**MX Repo de prueba**

![repo de prueba](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_RSXPCNku2HSLfoOHrEsu0n0qCQie2SdPMycQKfC_DWbvRGsf-rWd9wnuuv4HIms1LbaZfR3Vb6vkNpeKt-6JrzDveBnhUDyqCc1nEapPlMRNiN8yP-9XD7oY10zf5fanSblrwLjue4iXhUmkKUlryfQyb31TzVoFr-IkUsPdhi-cN2rG6Z1BdSgZlFU/s803/20240205-054512%20repo%20de%20prueba.png)

Antes de seguir recargue la lista:

![Recargar lista](https://blogger.googleusercontent.com/img/a/AVvXsEhHx5ku7i8Qz4_oW_2a75TTZAFYq3EyQSnR3DV0Zb1awwDnDK9k4mmWLyXB2kD7621tp8J165FKNAmGKP-NrsN6b5bXn5Tlmr5ejiyM4FzMOdvc_t_yS0EKQbfGZ4VN9T5N8XzUoX0Dh6Td-QpT1Cv0OjDSrpAlBFCvfrpfxwiBQgDxtSPJHOKJ3DKjUjQ=s16000-rw)

ahora si, sigamos, en la imagen anterior dice:

> “Advertencia  
> Está a punto de utilizar el repositorio MX de  
> prueba, cuyos paquetes se proporcionan solo con  
> fines de prueba. Podrían llegar a dañar su sistema,  
> por lo que se sugiere que haga un respaldo de su  
> sistema e instale y/o actualice solo un paquete a la  
> vez. Por favor, envíe sus comentarios al Foro para  
> que los paquetes puedan ser evaluados antes de pasar  
> al repositorio principal (Main)”

allí buscar a:

**yt-dlp**

La siguiente imagen es en Debian 11 donde había instalado los repositorios de MX, allí la última versión solo estaba en los paquetes de prueba de MX Linux (**MX Repo de prueba**):

![buscando a yt-dlp en mx test repo](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1Y2jcLWu1fC3rYR-sxvz03vzuIMX4DNl4sif2_ejHb_fUFjMO1mTkwY_f6-OapSrQzo1mXdHsHEDJUHQT9jTIDs6I6Na0SFwk98G7b6jtIkpTLgSP9iCdqjUkDfYLujFi86XQDU30FgfnjZ9TW_XiJLCvpV5okkNAShKt5o0yetGcBVoBClh9C-395t8/s803/20240121-163620%20buscando%20a%20yt-dlp%20en%20mx%20test%20repo.png)

**Nota:** Pueden dar clic en “**Mostrar detalles…**” para que vean si el programa va a instalar alguna dependencia, como dice el mensaje de arriba, el repositorio de prueba contiene software que podría llegar a dañar su sistema, pero en este caso solo se instala un paquete desde esos repositorios, y los demás son paquetes del mismo sistema

![instalar yt-dlp](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUuyqbNvHJjRbDj0lhHxr40Nra6U2cuF1vn-27wA6LOfFWcEV9kgU1biWC0zzZvfqhyphenhyphenvQvMF87eIPa3V2TAwxNmUQCBK0rD8gwftlHiIF1eeDrs03pGd7gBWoAVK7VlFuMReHToKYDpPGSAxuBURSXlCRusOCf0Vh1JigZ3zL6vOL8Dtj4O18Sgq5ZuNs/s800/20240121-163920%20instalar%20yt-dlp.png)

También si ya lo tenías instalado desde los repositorios de Debian lo puedes actualizar. La siguiente imagen es en Debian 12 donde instalé los repositorios de MX Linux 23 y fue tomada en enero de 2025 aprox:

![actualizando yt-dlp](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0RmB7wGC832eGhlH3OjPTJiOh-lGGBbeGX_2XpRhv2lmbFW73IwheOLJzVlbg1yCg3YsPMY-1ilkjGLNwSq0Kl4E6ZwE0yvBdSLAhCkx1cY7GeZjXe75njTsjlvFagdsvqWeRGX3zm0S8vo-twCqrqyZ3Jm87nKd2xdO_f6s_Iy5i3iizYbO88cUNvE0/s745/20250424-%200014%20actualizando%20yt-dlp.png)

**yt-dlp desde Backports de Debian**

También está una versión actual en los Backports de Debian, esa versión me sirvió para instalar la versión más actual en Debian 12 de 32 bit, pues es el único lugar donde estaba:

![pestaña Backports de Debian](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjOUVIXO1xMiy3vLsB-dp6szetoAmoYljjhm0-sj43QZNOYZSYl8f_1V0MF8Ge6aX6SRG5yTcvoQiUZ1dyvltt0-eVFc7M2UgbgOjfSb4ajkJld92iS-sWUDG6vtWZX3G244BttDjOIZSy9OoCVgNBgVhwcwJWwGCqbvVxYORzD6r7h0bTlRVt97Lr29bw/s16000-rw/20250518-0001%20pesta%C3%B1a%20Backports%20de%20Debian.png)

a continuación pongo el mensaje:

> “Advertencia Va a usar Debian Backports, que contiene paquetes tomados de la próxima versión de Debian (llamada ‘prueba”), ajustados y recompilados para el uso en Debian Estable. Los mismos no pueden ser probados extensivamente como en las versiones estables de Debian y MX Linux, y se proporcionan ’como están’, con el riesgo de incompatibilidades con otros componentes en Debian Estable. ¡Utilícelos con cuidado!”

e instalandolo, pues solo se instala este paquete (en caso de que luego no sirva lo desinstalo y no pasa nada pues se cual fue que se instaló):

![yt-dlp en Backports de Debian](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIr6cxEQPBsOW-z-X7kWwuYWgvBHJwPBeVXw_zYT4oul4IABoa2DqOildRye4RjN3-wKm1ycG4YUWGbA6JXpqElGdjy7lzupvZzfIzTtIIoLBNSXS2AlA1HZvTMIHp4ttYze5TJX5l0PI_iwlI4eJj-T9B8DHE5NuH8PyepP3FkcNXlg84x34ylLLX_zE/s16000-rw/20250518-0002%20yt-dlp%20en%20Backports%20de%20Debian.png)

## Los paquetes vistos online desde un navegador Web (Opcional)

Por motivos educativos pongo esta información, aclaro que no deseo confundir a nadie.

La siguiente imagen es el paquete **yt-dlp** el 25 de Abril 2025 visto online desde un navegador web en los repositorios estables de MX Linux, está la versión 2025.03.27

[http://mxrepo.com/mx/repo/pool/main/y/yt-dlp/](http://mxrepo.com/mx/repo/pool/main/y/yt-dlp/)

![yt-dlp en repositorio estable](https://blogger.googleusercontent.com/img/a/AVvXsEgtE2csEWlHX1uAcg09-7cPynurKKErK8NTG62LIcPPU_gWPV6usFuPIEvo2-YSKHv39tbkaE0WOaGMNxp857FgnKMCARguCUaMyZVeKakmqRdWlzVLjhFM3hSky1utPlblYxklvdlVlp2Rzvmw7AjEs7SE58k5Ykn67t3Mofs_SIaYcH4QYouQAaLSpbM=s16000-rw)

por eso se lo puede encontrar en Synaptic en MX Linux y si uno instala los repositorios de MX Linux

La siguiente imagen es de yt-dlp el 25 de Abril visto online desde un navegador web en los repositorios de prueba de MX Linux, está la versión 2024.12.23, pero allí antes estaba la versión 2025.03.27

![yt-dlp en repositorio de prueba](https://blogger.googleusercontent.com/img/a/AVvXsEhlXuAWe9OD2a5QDb4PIe7H0iAr8zFGVH5y_7fdC7FENd7K8e5373aICkUhs2n2Q-I9YqZ6YEs7vlT3WhHj4QvHYvnZS8gpt3NI-yUlEbdKX4iChMx2adhE63eEMgycDo74u7oysPH408MHiq6YuwiGa1J7G95QFUzPegRLFEy3_RlbOaMMU7j4hdW85XA=s16000-rw)

## Instalando a ksnip desde los Repositorios de prueba de MX, o Backports de Debian

Ksnip sirve para hacer capturas de pantalla

La siguiente imagen es de ksnip visto en Debian 12 de 64 bit en los repositorios en Synaptic, el 25 de abril 2025:

![ksnip en repositorio estable](https://blogger.googleusercontent.com/img/a/AVvXsEg1spM90xMJ_saLeuQpRQ1uLVyUanIbfg6sodi9bleP6efjl1x9iN0IpulGrWZPM3VVZye7mBXf7ztEeF3mdcpZtjNoZUtMHgfxwMwDAFvAcbsfPk7nfHnJb5FkMcXMKp9BDl6U7ihiErw37uPpyEoUqYiBixzpiu9YUxlrvHV39eyHjyN34GGmT0s0vZQ=s16000-rw)

La última versión ksnip 1.10.1 está todavía en el repositorio de prueba y no la han pasado al repositorio estable, por lo que la única manera de tener la última versión es desde el **repositorio de prueba de MX Linux** o **Backports de Debian**, la siguiente imagen es en MX Linux 23 KDE de 64 bit:

![ksnip en repositorio de prueba MX](https://blogger.googleusercontent.com/img/a/AVvXsEjB9PTkCZwv1eDVwvZ3TuuX7Df7kBZCPKJaJDDOhORvpXTmzWX_RnOspWmyMamkMRYi_vzY0sdmd-flnU76Vq7FUHsjgMQIV1SYJWYxxZV-TyPk43yxDLRF9l-ifMKS-SV1gieSsm8TszKsUiz4Mr5w-UfBAICeG7QYgBY-hybju_VeEzOBc7In2cHkdQ4=s16000-rw)

La siguiente imagen es de ksnip la última versión en **Backports de Debian** visto en Debian 12 de 32 bit, pues allí no la encuentro en los repositorios de prueba:

![ksnip en Backports de Debian](https://blogger.googleusercontent.com/img/a/AVvXsEjeVWdx5ToshfxmCHcJ7VXzcWXfEC4i2iM9aaRU9tuLOrdBxw4ty81JPevda1vOGWM5XZ3GdfRJJLTAKf_EWdyIz1ustbiI_jlfzQTvpFneEmXklan9Sze5_ez2wghknV1feghyZZkqU2BBjcSKm7On2x6aOFqRqctOUlBn-RmrI02Nie_mDdh5BKwCh20=s16000)

En resumen, deben de buscar dónde esté la última versión disponible.

Bueno, ahora sí dejo las instrucciones para:

Debian 11 Debian 10

repito para la primera, pero solo los pasos de instalación del repositorio:

## Para Debian 11 bullseye: MX Linux 21 Repo

Copie las siguientes líneas:

```
#MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ bullseye main non-free

#deb http://mxrepo.com/mx/repo/ bullseye test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bullseye ahs
```

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/mx21-archive-keyring_2021.2.19_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/mx21-archive-keyring_2021.2.19_all.deb)

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx21-archive-keyring_*.*.deb
```

Recargue los repositorios e instale el programa que necesite

## Para Debian 10 buster: MX Linux 19 Repo

Copie las siguientes líneas:

```
#MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ buster main non-free

#deb http://mxrepo.com/mx/repo/ buster test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ buster ahs
```

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring_2020.4.29_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring_2020.4.29_all.deb)

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx19-archive-keyring_*.*.deb
```

Recargue los repositorios e instale el programa que necesite

**Nota:** En Debian 10 buster a esta hay menos programas.

# Repositorio añadido en algunos Sistemas Operativos

La siguiente imagen es del repositorio de MX Linux 21 que yo añadí en [Q4OS versión 4](https://q4os.org/downloads3.html) visto en Synaptic:

![repositorio de MX Linux 21 añadido](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUZ0BS5HvsuwuvmHxlpJsA13z-DogK5MpV_P0MgnzDS7LiecvKXPXJKHfreGHLcDtGR28MTPS0wYqOd6c_ReDlh1Pf7-Q5WtMIur-_T1kR4onHinXcOjAH2n7ulL92dAB5MkImxIMhkH0HZR5iWM51eV7HvOmfWNG3vKkfEm0os4sc48hFiIb4ROx7raY/s603/20231118-182409%20repositorio%20de%20MX%20Linux%2021%20a%C3%B1adido.png)

## Es posible descargar manualmente programas

Por si necesita manualmente descargar algún programa, puede entrar manualmente a las siguientes direcciones

[https://mxrepo.com/mx/repo/pool/](https://mxrepo.com/mx/repo/pool/)

allí yo he buscado en:

pool  
non-free

[https://mxrepo.com/mx/testrepo/pool/](https://mxrepo.com/mx/testrepo/pool/)

allí yo he buscado en:

test

Dios les bendiga

## CONSULTAS

**https://github.com/MX-Linux/mx-packageinstaller**  
[https://github.com/MX-Linux/mx-packageinstaller](https://github.com/MX-Linux/mx-packageinstaller)  

**Repos — MX-23**  
[https://mxlinux.org/uncategorized/repos-mx-23/](https://mxlinux.org/uncategorized/repos-mx-23/)  

**Lista de repositorios MX Linux**  
[https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt](https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt)  
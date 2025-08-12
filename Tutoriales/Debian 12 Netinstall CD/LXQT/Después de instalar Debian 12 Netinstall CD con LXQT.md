
# **Cómo instalar Debian 12 Netinstall CD con LXQT**

Estos son los pasos para dejar utilizable a LXQT instalado desde Netinstall CD, del cual he hecho un tutorial general:

Cómo instalar Debian NetInstall CD
https://github.com/wachin/Como-instalar-Debian-12-NetInstall-CD 

y allí en la instalación seleccionar sólo LXQT y las herramientas de Debian nada más


# Fix `Username Is Not In The Sudoers File. This Incident Will Be Reported` On Debian 

Los Sistema Operativos Debian no vienen configurados para elevar los permisos con `sudo` esto es así porque es un sistema operativo dirigido a usuarios avanzados, y por otras razones está configurado así.

**SOLUCIÓN**

Ponga en la terminal:

```bash
su -
```

y ponga su contraseña de super usuario, la que usó cuando instaló el Sistema Operativo Debian Netinstall CD (no me refiero a la contraseña de usuario). Y luego, como se ve en el siguiente comando, debe cambiar "usuario" por su usuario:

```bash
usermod -aG sudo usuario
```

Si no sabe cual es el nombre usuario, es el nombre que está a la izquierda de la arroba en la termina. 

En mi caso me debe quedar así:

```bash
usermod -aG sudo wachin
```

ejecutar y luego **REINICIAR EL ORDENADOR** y cuando vuelva a poner sudo en la terminal para ejecutar algún comando ejemplo:

```bash
sudo apt update
```

y ya le funcionará. **Nota:** Si no reinicia no funciona aunque haga lo que haga.

---

# Cómo instalar el repositorio de MX Linux en Debian (y derivados)

Este tutorial explica cómo añadir los repositorios de MX Linux a sistemas basados en Debian que no los incluyen por defecto, así como instalar el **MX Instalador de paquetes** para obtener versiones más recientes de algunos programas.

> **Nota:** Si usas un gestor de ventanas ligero como Openbox, Fluxbox o JWM, antes de seguir revisa cómo activar **PolicyKit** para que las aplicaciones gráficas funcionen con permisos elevados:
> [Activar el agente de PolicyKit en Openbox y gestores de ventanas ligeros X11](https://facilitarelsoftwarelibre.blogspot.com/2025/05/activar-el-agente-de-policykit-en-openbox-y-gestores-de-ventanas-ligerosx11.html)

## 1. Qué se puede instalar desde este repositorio

El repositorio de MX Linux incluye aplicaciones y utilidades como:

**Extensiones para Dolphin:**

* `kde-servicemenu-extract-and-compress` – Añade menú para extraer y comprimir.
* `kde-servicemenu-checkhash-installdebs` – Instala paquetes `.deb` con un clic.
* `kde-servicemenu-rootactions` – Ejecuta acciones como administrador.
* `kde-servicemenu-kim5` – Herramientas para imágenes.

**Herramientas útiles:**

* `ksnip` – Capturador de pantalla.
* `avidemux` – Editor de video.
* `yt-dlp` – Descargador de videos de YouTube, Facebook, etc.
* `telegram-desktop` – Cliente oficial de Telegram (además la versión de 32 bit).
* `formatusb` – Formatea memorias USB.
* `virtualbox` – Virtualización (para 64 bit). 
* `mx-snapshot` – Crea un sistema Live a partir del instalado.
* Paquetes de **firmware** para controladores.

## 2. Advertencia sobre el repositorio de prueba y Backports

MX Linux incluye un “**Repo de prueba**” que contiene software en desarrollo. Estos paquetes pueden fallar o ser inestables.

Ejemplo: el 17 de julio de 2025 probé **Gimp 3.0.0 RC2** desde este repositorio y se colgaba. Para volver a la versión estable, deshabilité el repo de prueba y reinstalé la versión de Debian.

## 3. Añadir el repositorio de MX Linux a Debian 12

> Los pasos son similares para Debian 11 y 10 (cambiar el nombre de la versión en la línea del repositorio).

1. Abre la terminal y ejecuta:

```bash
sudo gedit /etc/apt/sources.list.d/mx.list
```

*(Puedes usar otro editor como `nano` o `vim` si prefieres trabajar en la terminal)*

2. En el archivo que se abre, pega lo siguiente:

```
# MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ bookworm main non-free

# deb http://mxrepo.com/mx/repo/ bookworm test

# ahs hardware stack repo
# deb http://mxrepo.com/mx/repo/ bookworm ahs
```

**Nota:** Para otra Distribución de Debian sólo cambia su nombre, ejemplo bullseye, buster, trixie

3. Guarda y cierra el archivo.

## 4. Instalar la llave del repositorio

1. Descarga la llave que encaja con Debian 12, desde:

   [https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/)

2. Instálala desde la terminal (ejemplo para la versión actual):

```bash
sudo dpkg -i mx23-archive-keyring_*.*.deb
```

Este paquete contiene las claves para verificar la autenticidad de los programas del repositorio.

**Nota:** Para saber cual es la llave para determinado Debian debes descargar MX Linux la versión que desees probar y probarlo como Live, lo puedes poner en [Ventoy](https://facilitarelsoftwarelibre.blogspot.com/2021/12/creando-pendrive-usb-multiboot-con-ventoy-desde-linux.html) para eso, y allí revisar sus repositorios en /etc/apt/sources.list.d/mx.list y allí sabrás qué Debian está usando (y viceversa).

## 5. Actualizar la lista de repositorios

Ejecuta:

```bash
sudo apt update
```

También puedes usar **Synaptic** y pulsar en **Recargar** para actualizar.

## 6. Instalar el Gestor de Software “MX Instalar Paquetes”

1. En la terminal:

```bash
sudo apt install mx-repo-list mx-repo-manager mx-packageinstaller
```

2. Una vez instalado, podrás abrirlo desde el menú de aplicaciones con el nombre:

`MX Instalar Paquetes`

y buscar los programas que desees instalar.

---

## 8. Usar Backports de Debian (alternativa)

Si no encuentras la última versión en los repos de MX Linux, revisa si está disponible en **Backports**.
Para instalar desde allí, habilita la opción en Synaptic o agrega el repositorio Backports en tu configuración de `sources.list`, actualiza y busca el paquete.

---

## 9. Instalar `ksnip` (ejemplo)

En abril de 2025, la versión más reciente (`1.10.1`) está solo en el **Repo de prueba de MX** o en **Backports de Debian**

* Estando los repositorios de prueba activados
* Actualizar la lista de paquetes.
* Instalar `ksnip` desde Synaptic o con:

```bash
sudo apt install ksnip
```

---

## 7. Instalar `yt-dlp` (ejemplo)

En mayo de 2025, `yt-dlp` estaba disponible en la versión estable de MX Linux, así que basta con ejecutar:

```bash
sudo apt install yt-dlp
```

Si no estuviera en la versión estable, puedes habilitar el **Repo de prueba** desde MX Repo Manager, actualizar la lista de paquetes y buscarlo allí.
⚠️ Recuerda: solo instala un paquete a la vez desde el repositorio de prueba para minimizar riesgos.

---

## 10. Resumen de buenas prácticas

* **Usa el repositorio estable siempre que sea posible.**
* **Activa el repo de prueba solo para un paquete específico** y luego vuelve a desactivarlo en Synaptic.
* **Haz copia de seguridad** antes de instalar software experimental.
* **Comprueba las dependencias** antes de confirmar la instalación.

# Instalar network-manager-gnome

Este paquete hay que instalarlo porque 

```bash
sudo apt install network-manager-gnome
```



# el Firmware para el Wi-Fi para Laptop Dell Inspiron
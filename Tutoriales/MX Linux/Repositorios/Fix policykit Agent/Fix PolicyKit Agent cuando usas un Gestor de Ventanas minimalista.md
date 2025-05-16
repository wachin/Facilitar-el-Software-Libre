
# Activar el agente de PolicyKit en Openbox y gestores de ventanas ligeros

## Cómo hacer que aplicaciones gráficas con permisos de administrador funcionen en Openbox u otros gestores de ventanas ligeros

Cuando instalas un sistema Linux basado en Debian o Ubuntu (como Debian, MX Linux, Linux Mint, etc.), normalmente viene con un entorno de escritorio completo (como GNOME, KDE, XFCE o LXQt). Estos entornos ya traen configurado automáticamente un **agente de PolicyKit** que permite abrir aplicaciones gráficas que requieren permisos de administrador, como **Synaptic**, **MX Instalador de paquetes**, **Gparted** entre otros.

Sin embargo, si decides instalar un **gestor de ventanas ligero** como **Openbox** o **Fluxbox**, te puedes encontrar con el siguiente problema:

> **Las aplicaciones que requieren permisos de administrador simplemente no se abren, no muestran ningún mensaje de error, y parece que no pasa nada. Tampoco se puede realizar tareas gráficas que requieran permisos de administrador.**

Este problema tiene solución, y aquí te explico por qué ocurre y cómo solucionarlo.

---

## ¿Por qué ocurre esto?

Muchas aplicaciones gráficas que necesitan permisos elevados usan un sistema llamado **PolicyKit (o Polkit)** para mostrar una ventana donde puedas ingresar tu contraseña. Pero para que esa ventana aparezca, **debe estar ejecutándose un "agente de PolicyKit" en segundo plano**.

- **Entornos de escritorio completos** ya incluyen e inician ese agente automáticamente.
- **Gestores de ventanas ligeros instalados después** (como Openbox) **no lo hacen**, por lo que **debes iniciarlo tú manualmente**.

---

## ¿Qué es un agente de PolicyKit?

Es un pequeño programa que se encarga de mostrar la ventana de autenticación cuando una aplicación necesita privilegios. Algunos ejemplos:

| Entorno de escritorio |                     Agente de PolicyKit                     |
| --------------------- | ----------------------------------------------------------- |
| LXQt                  | `lxqt-policykit-agent`                                      |
| GNOME                 | `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1` |
| KDE Plasma            | `/usr/lib/polkit-kde-agent-1`                               |
| XFCE / LXDE           | `lxpolkit`                                                  |
| Openbox / Fluxbox     | Ninguno por defecto, debes configurarlo tú mismo            |


**Nota** Una vez en la Distro AV Linux los desarrolladores le pusieron Openbox y venía ya configurado con algún Agnete de PolicyKit.

**Nota 2**: La ruta donde está el archivo ejecutable puede variar dependiendo del Sistema Iprativo. Más abajo indico con más detalle.

---

## Cómo activar un agente de PolicyKit en Openbox

### Usa un agente de PolicyKit

Busca en Synaptic la palabra:

policykit

Como ve en la siguiente imagen, le he dado clic en la letra "**E**" para ordenar todos los paquetes instalados, así al poderlos ver puedo encontrar algún paquete que tiene que ver con  policykit:

![](https://blogger.googleusercontent.com/img/a/AVvXsEgLF9qtCJqW_Cc7WSOi2IALvmfqkvrMZOdpCk0qu3kjpKMqN99AkjlaLQ1JdufDvQIdMre7NrSCv2hcCAzl08aIZT3Yj2Lqd5oTRxDSnPrK7EB9FLLLsKOqdZnLs3vKulNiPjpKzitkV67VgD06dfoxeWxxw8bAZOXSgAc4JdqA910ODp4DbIyQPKXEhak)

al darle clic a ese paquete y ver sus **Propiedades**, en la pestaña "**Archivos instalados**" encuentro un archivo .desktop

![](https://blogger.googleusercontent.com/img/a/AVvXsEhHmjGbNzJqWdxxWiFbRBd_t_YOjmydnpwyTQu8CMfSqmepKrI8iROcg2UtsiXs8KzylOovTj0tq2R11woB4M64YClTgX8vwPRQBfKEucWK-zAKAG1fdu-yo_e64jRpeb0Z3jfaDXqdEP5Cz-49WJOu7q9oRg8hO1jX31poK_xwJgkqenw6Bbs-ElGfHgs=s16000)

**en este caso** aquí lo copio:

/etc/xdg/autostart/polkit-kde-authentication-agent-1.desktop

este lo puedo abrir con algún editor de texto desde la terminal:

```bash
gedit /etc/xdg/autostart/polkit-kde-authentication-agent-1.desktop
```

puedes cambiar gedit con el nombre el editor de texto que uses, o con [nano](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html) o [Vim](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html) lo puedes abrir

y búsca la línea que está en **Exec**:

![](https://blogger.googleusercontent.com/img/a/AVvXsEhxxo-w73Y8Wqvjfj1zqB2pJASTktmf2l7rCq1n6HJ6B33q09DlpSXOpBihT57jytE21SgIfE9nYztYtzcDIWSyRnP5E8krD5Nhq9VaY_2meRxU-YySgzE4ciED7JYTf6rOEdevoBwuMPq1hvvoamroxGiEZRsVwpDBD4TUGi1NllvystsZVuLWajJVZuU)


### Añadir PolicyKit al inicio de Openbox 

Para añadirlo hay que abrir el archivo autostart de openbox, para llegar allí activa la capacidad de ver archivos ocultos de tu administrador de archivos (ver con Ctrl + H) y llega hasta:

`~/.config/openbox/autostart`.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRVgjA5Hzzar65NsM09DqpSOueI3PCelKyA59ZYkwS14vhSyNOEo5RsjJvSnHDbjOpeZQ1YUUc0-NSqCZ78_3oN4iFFiSwykbc1m-IVPQUHxECfnYPc3mXesP5v9fttc8oLApVdfRnYj0c6WcVpi8EVX_RHDhrAc5ORkhV1vmyo7-Omipw5_A3oGatBDk/s16000-rw/20250318-111511%20archivo%20autostart.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRVgjA5Hzzar65NsM09DqpSOueI3PCelKyA59ZYkwS14vhSyNOEo5RsjJvSnHDbjOpeZQ1YUUc0-NSqCZ78_3oN4iFFiSwykbc1m-IVPQUHxECfnYPc3mXesP5v9fttc8oLApVdfRnYj0c6WcVpi8EVX_RHDhrAc5ORkhV1vmyo7-Omipw5_A3oGatBDk/s696/20250318-111511%20archivo%20autostart.png)

allí agregar la línea que en este caso es:

/usr/lib/i386-linux-gnu/libexec/polkit-kde-authentication-agent-1

guardar y cerrar.



## **Cómo añadir un agente de PolicyKit al inicio en Fluxbox y otros Window Managers (X11)**

En gestores de ventanas ligeros como **Fluxbox**, **IceWM**, **JWM**, **Blackbox**, etc., el procedimiento es muy similar al de Openbox: necesitas ejecutar el **agente de PolicyKit** al inicio de la sesión gráfica, ya que estos entornos no lo hacen automáticamente.

A continuación te explico cómo hacerlo para los más comunes:

---

### ✅ **1. En Fluxbox**

Fluxbox usa un archivo llamado `~/.fluxbox/startup` para ejecutar aplicaciones al inicio de la sesión.

#### 🔧 **Pasos:**

1. Abre el archivo con tu editor favorito:

   ```bash
   nano ~/.fluxbox/startup
   ```

2. Antes de la línea `exec fluxbox`, añade el comando correspondiente al agente que quieras usar. Ejemplo:

   ```bash
   /usr/lib/i386-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
   ```

3. Asegúrate de que **la última línea sea**:

   ```bash
   exec fluxbox
   ```

4. Guarda y cierra. Luego **cierra sesión y vuelve a entrar en Fluxbox**.

---

### ✅ **2. En IceWM**

IceWM no tiene un archivo de inicio oficial por defecto, pero puedes usar el archivo `~/.icewm/startup`.

#### 🔧 **Pasos:**

1. Crea el archivo si no existe:

   ```bash
   mkdir -p ~/.icewm
   nano ~/.icewm/startup
   ```

2. Añade tu agente de PolicyKit:

   ```bash
   /usr/lib/i386-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
   ```

3. Guarda, dale permisos de ejecución:

   ```bash
   chmod +x ~/.icewm/startup
   ```

4. Reinicia la sesión.

---

### ✅ **3. En JWM (Joe's Window Manager)**

JWM usa un archivo de configuración en XML, normalmente en `~/.jwmrc`.

#### 🔧 **Pasos:**

1. Abre el archivo:

   ```bash
   nano ~/.jwmrc
   ```

2. Busca la sección `<StartupCommand>` y añade el comando del agente dentro:

   ```xml
   <StartupCommand>/usr/lib/i386-linux-gnu/libexec/polkit-kde-authentication-agent-1</StartupCommand>
   ```

3. Guarda, cierra y reinicia JWM.

# PolicyKit Genérico

Si deseas puedes instalar el siguiente y usarlo

```bash
  sudo apt install lxpolkit
```

Si no estás seguro de cuál usar, `lxpolkit` es una opción ligera que funciona en casi todos los casos.


Guarda y cierra el archivo. Luego **cierra la sesión y vuelve a entrar en Openbox o tu x11 WM**.


# Verifica que el agente esté funcionando

Abre una terminal y escribe:

```bash
ps aux | grep polkit
```

Deberías ver que tu agente aparece en la lista de procesos.


# 📌 Palabras de búsqueda para Google

* Cómo solucionar problemas de permisos en Openbox con PolicyKit
* Activar el agente de PolicyKit en Openbox y gestores de ventanas ligeros
* ¿No se abre Synaptic o el MX Instalador? Aquí la solución en Openbox
* PolicyKit en Openbox: Solución a errores al abrir programas con permisos de administrador
* Configurando PolicyKit manualmente en Openbox, Fluxbox e i3
* Agentes de PolicyKit en entornos sin escritorio: Guía para Openbox
* Solución a fallos silenciosos de apps root en gestores de ventanas ligeros
* Cómo integrar PolicyKit en sesiones personalizadas de Linux
* ¿Por qué no se abre Synaptic en Openbox? Aquí tienes la respuesta
* ¿Programas que requieren sudo no funcionan en tu entorno ligero? Esta es la causa
* ¿Openbox no muestra la ventana de autenticación? Aprende a arreglarlo
* Linux ligero, problemas comunes: cómo arreglar el acceso root gráfico
* Instalaste Openbox y no puedes usar herramientas gráficas con permisos root? Solución aquí
* El paso que muchos olvidan al usar Openbox: configurar PolicyKit


# Referencias

**polkit - www.freedesktop.org**  
[https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html)

**polkit(8) - Linux man page**  
[https://linux.die.net/man/8/polkit](https://linux.die.net/man/8/polkit)


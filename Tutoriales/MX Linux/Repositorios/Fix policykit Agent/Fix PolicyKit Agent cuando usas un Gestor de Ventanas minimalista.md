
# Cómo hacer que aplicaciones gráficas con permisos de administrador funcionen en Openbox u otros gestores de ventanas ligeros

Cuando instalas un sistema Linux basado en Debian o Ubuntu (como Debian, MX Linux, Linux Mint, etc.), normalmente viene con un entorno de escritorio completo (como GNOME, KDE, XFCE o LXQt). Estos entornos ya traen configurado automáticamente un **agente de PolicyKit** que permite abrir aplicaciones gráficas que requieren permisos de administrador, como **Synaptic**, **MX Instalador de paquetes**, entre otros.

Sin embargo, si decides instalar un **gestor de ventanas ligero** como **Openbox** o **Fluxbox**, te puedes encontrar con el siguiente problema:

> **Las aplicaciones que requieren permisos de administrador simplemente no se abren, no muestran ningún mensaje de error, y parece que no pasa nada.**

Este problema tiene solución, y aquí te explico por qué ocurre y cómo solucionarlo.

---

## ¿Por qué ocurre esto?

Muchas aplicaciones gráficas que necesitan permisos elevados usan un sistema llamado **PolicyKit (o Polkit)** para mostrar una ventana donde puedas ingresar tu contraseña. Pero para que esa ventana aparezca, **debe estar ejecutándose un "agente de PolicyKit" en segundo plano**.

- **Entornos de escritorio completos** ya incluyen e inician ese agente automáticamente.
- **Gestores de ventanas ligeros instalados después** (como Openbox) **no lo hacen**, por lo que **debes iniciarlo tú manualmente**.

---

## ¿Qué es un agente de PolicyKit?

Es un pequeño programa que se encarga de mostrar la ventana de autenticación cuando una aplicación necesita privilegios. Algunos ejemplos:

| Entorno de escritorio | Agente de PolicyKit                                |
|------------------------|----------------------------------------------------|
| LXQt                   | `lxqt-policykit-agent`                             |
| GNOME                  | `polkit-gnome-authentication-agent-1`             |
| KDE Plasma             | `polkit-kde-agent-1`                               |
| XFCE / LXDE            | `lxpolkit`                                         |
| Openbox / Fluxbox      | Ninguno por defecto, debes configurarlo tú mismo  |

**Nota** Una vez en la Distro AV Linux los desarrolladores le pusieron Openbox y venía ya configurado con algún Agnete de PolicyKit.

---

## Solución: cómo activar un agente de PolicyKit en Openbox

### 1. **Instala un agente de PolicyKit**

Si usas algún Sistema Operativo Linux como Ubuntu o alguno de sus sabores, o Debian o alguna distribución basada en ella que usen LXQT, GNOME, KDE Plasma, XFCE, LXDE puedes buscar en Synaptic la palabra:

policykit

Como ve en la siguiente imagen, le he dado clic en la letra "E" para ordenar todos los paquetes instalados, así al poderlos ver puedo encontrar algún paquete que tiene que ver con  policykit:

![](https://blogger.googleusercontent.com/img/a/AVvXsEgLF9qtCJqW_Cc7WSOi2IALvmfqkvrMZOdpCk0qu3kjpKMqN99AkjlaLQ1JdufDvQIdMre7NrSCv2hcCAzl08aIZT3Yj2Lqd5oTRxDSnPrK7EB9FLLLsKOqdZnLs3vKulNiPjpKzitkV67VgD06dfoxeWxxw8bAZOXSgAc4JdqA910ODp4DbIyQPKXEhak)

al darle clic a ese paquete y ver sus **Propiedades**, en la pestaña "**Archivos instalados**" encuentro un archivo .desktop

![](https://blogger.googleusercontent.com/img/a/AVvXsEhHmjGbNzJqWdxxWiFbRBd_t_YOjmydnpwyTQu8CMfSqmepKrI8iROcg2UtsiXs8KzylOovTj0tq2R11woB4M64YClTgX8vwPRQBfKEucWK-zAKAG1fdu-yo_e64jRpeb0Z3jfaDXqdEP5Cz-49WJOu7q9oRg8hO1jX31poK_xwJgkqenw6Bbs-ElGfHgs=s16000)

en este caso aquí lo copio:

/etc/xdg/autostart/polkit-kde-authentication-agent-1.desktop

este lo puedo abrir con algún editor de texto desde la terminal:

```bash
gedit /etc/xdg/autostart/polkit-kde-authentication-agent-1.desktop
```

puedes cambiar gedit con el nombre el editor de texto que uses, o con [nano](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html) o [Vim](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html) lo puedes abrir

y búsca la línea que está en **Exec**:

![](https://blogger.googleusercontent.com/img/a/AVvXsEhxxo-w73Y8Wqvjfj1zqB2pJASTktmf2l7rCq1n6HJ6B33q09DlpSXOpBihT57jytE21SgIfE9nYztYtzcDIWSyRnP5E8krD5Nhq9VaY_2meRxU-YySgzE4ciED7JYTf6rOEdevoBwuMPq1hvvoamroxGiEZRsVwpDBD4TUGi1NllvystsZVuLWajJVZuU)

esa líena debes colocarla para que al encender el ordenador se ejecute, 

el cual lo puedo buscar en el administrador de archivos y abrir y leer lo que dice en:


Puedes elegir uno de estos:

* **Opción si ya tienes LXQt instalado**:

  ```bash
  sudo apt install lxqt-policykit
  ```

* **Opción GNOME** (si prefieres la interfaz de GNOME):

  ```bash
  sudo apt install policykit-1-gnome
  ```

- **Opción recomendada para Openbox** (ligero y sencillo):
  ```bash
  sudo apt install lxpolkit
````

> Si no estás seguro de cuál instalar, `lxpolkit` es una opción ligera que funciona en casi todos los casos.

---

### 2. **Añade el agente al inicio de tu sesión Openbox**

Edita (o crea) el archivo de inicio automático de Openbox:

```bash
nano ~/.config/openbox/autostart
```

Añade una de las siguientes líneas, según el agente que hayas instalado:

```bash
lxpolkit &
# o
lxqt-policykit-agent &
# o
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# o
/usr/lib/polkit-kde-agent-1 &
```

Guarda y cierra el archivo. Luego **cierra la sesión y vuelve a entrar en Openbox**.

---

### 3. **Verifica que el agente esté funcionando**

Abre una terminal y escribe:

```bash
ps aux | grep polkit
```

Deberías ver que tu agente aparece en la lista de procesos.

---

## ¿Qué pasa si no lo configuro?

Si no se está ejecutando un agente de PolicyKit:

* Aplicaciones como **Synaptic**, **MX Instalador de paquetes**, **GParted**, entre otras, **no abrirán**.
* No verás ningún mensaje de error, simplemente no ocurre nada.
* Tampoco podrás realizar tareas gráficas que requieran permisos de administrador.

---

## Ejemplo práctico

Yo instalé **Debian 12 con LXQt** y luego agregué los repositorios de **MX Linux** para usar herramientas como el **MX Instalador de paquetes**. Cuando usaba LXQt, todo funcionaba bien. Pero cuando cambié a **Openbox**, el instalador no abría.

La solución fue **añadir esta línea** al archivo `~/.config/openbox/autostart`:

```bash
lxqt-policykit-agent &
```

Después de reiniciar la sesión, el problema se resolvió y la ventana de autenticación apareció como debía.

---

## Recomendación final

Si usas un gestor de ventanas como Openbox, Fluxbox, i3 o similares, **asegúrate siempre de que un agente de PolicyKit esté activo**. Así evitarás que aplicaciones importantes fallen al intentar obtener permisos de administrador.

Puedes incluso crear un alias para verificar rápidamente si está activo:

```bash
alias checkpolkit="ps aux | grep -i polkit | grep -v grep"
```

Así, solo escribes `checkpolkit` en la terminal para comprobar si todo está bien.

---

## ¿Te resultó útil este tutorial?

Si tienes preguntas o necesitas ayuda con otro entorno, ¡déjalo en los comentarios o contáctame!

```

---

¿Te gustaría que prepare también una versión en PDF, en HTML o en algún otro formato para compartirlo más fácilmente?
```

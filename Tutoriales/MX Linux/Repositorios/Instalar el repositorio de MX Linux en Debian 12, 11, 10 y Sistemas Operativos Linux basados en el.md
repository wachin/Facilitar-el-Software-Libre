# Instalar el repositorio de MX Linux en Debian 12, 11, 10 y Sistemas Operativos Linux basados en el
Este tutorial es para instalar los repositorios de MX Linux a Sistemas Operativos Debian y basados en Debian que no lo tienen añadido, ejemplo (puede ser cualquier otro, como Debian mismo):

La siguiente imagen es del repositorio de MX Linux 21 añadido en [Q4OS versión 4](https://q4os.org/downloads3.html) visto en Synaptic:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUZ0BS5HvsuwuvmHxlpJsA13z-DogK5MpV_P0MgnzDS7LiecvKXPXJKHfreGHLcDtGR28MTPS0wYqOd6c_ReDlh1Pf7-Q5WtMIur-_T1kR4onHinXcOjAH2n7ulL92dAB5MkImxIMhkH0HZR5iWM51eV7HvOmfWNG3vKkfEm0os4sc48hFiIb4ROx7raY/s16000-rw/20231118-182409%20repositorio%20de%20MX%20Linux%2021%20a%C3%B1adido.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUZ0BS5HvsuwuvmHxlpJsA13z-DogK5MpV_P0MgnzDS7LiecvKXPXJKHfreGHLcDtGR28MTPS0wYqOd6c_ReDlh1Pf7-Q5WtMIur-_T1kR4onHinXcOjAH2n7ulL92dAB5MkImxIMhkH0HZR5iWM51eV7HvOmfWNG3vKkfEm0os4sc48hFiIb4ROx7raY/s603/20231118-182409%20repositorio%20de%20MX%20Linux%2021%20a%C3%B1adido.png)

## Qué se puede instalar desde este repositorio?

En los repositorios de MX Linux hay software muy importante como ejemplo:  
  
**Extensiones para  Dolphin Administrador de archivos:**
kde-servicemenu-extract-and-compress  
kde-servicemenu-checkhash-installdebs  
kde-servicemenu-rootactions  
kde-servicemenu-kim5  

**Herramientas**
ksnip (version actualizada desde el Repositorio de Pruebas "Test")

Avidemux

yt-dlp (version actualizada desde el Repositorio de Pruebas "Test")

telegram-desktop = Telegram (32 y 64 bit)

VirtualBox  
etc  
  

## Añadiendo los repositorios de MX Linux a Debian 12

La siguiente es una explicación genérica que hago para Debian 12, y estas explicaciones deberán servir para hacer esto en Debian 11, y Debian 10

Para añadir el repositorio de MX Linux debemos añadirlo en el:  
  
/etc/apt/sources.list.d/  

podemos hacerlo de dos maneras, usando un **editor de texto** o **nano** o **vim** (no confundir vi con vim, vi viene instalado muchas veces por defecto, pero vim es una versión mejorada más fácil de usar) que son editores de texto de terminal (tamién hay otros editores de terminal como micro, u otros)
  
## Usando Gedit u otro editor de texto para editar sources.list.d
podemos usar Gedit  u otro editor de texto, si es que lo deja hacer el sistema operativo, digo porque ejemplo Kate no deja hacer esto:
 
```bash
sudo gedit /etc/apt/sources.list.d/mx.list
```
 
## Usando nano para editar sources.list.d
Se puede usar nano desde la terminal. Nano es un editor de texto de terminal que siempre sirve para cosas como estas que necesitan elevar los permisos. 

- El siguiente comando creará el archivo mx.list automáticamente **con `nano`**::

```bash
sudo nano /etc/apt/sources.list.d/mx.list
```
- **Editar el archivo en `nano`**: ─ Añade las siguientes líneas, copialas:

MX Community Main and Test Repos
    
deb http://mxrepo.com/mx/repo/ bookworm main non-free

#deb http://mxrepo.com/mx/repo/ bookworm test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bookworm ahs 

y pegalas en nano.

 - **Guardar el archivo en `nano`**: ─ Presiona `Ctrl + O` (Control y O al mismo tiempo) para guardar los cambios. `nano` te pedirá confirmación para el nombre del archivo el cual te lo mostrará, presiona `Enter` para confirmar la escritura en el archivo mx.list. Para cerrar nano presiona Ctrl + X

Si necesitas ayuda para usar nano aquí dejo [un tutorial que he hecho](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html)

- **Actualizar la lista de repositorios**: ─ Una vez que hayas cerrado `nano`, ejecuta el siguiente comando para actualizar la lista de paquetes disponibles:

```bash
sudo apt update
```

## Usando vim para editar `sources.list.d`

Otra opción desde la terminal es usar `vim`, un editor de texto muy poderoso para usuarios más avanzados. A diferencia de `nano`, `vim` tiene modos de edición que pueden parecer confusos al principio, pero una vez que se aprende, es muy rápido y versátil.

- Para abrir o crear el archivo `mx.list` en `vim`, escribe el siguiente comando:

```bash
sudo vim /etc/apt/sources.list.d/mx.list
```

- Cuando se abra el archivo, presiona la tecla `i` para entrar al **modo de inserción** (Insert Mode). Verás que abajo dice `-- INSERT --`. Ahora sí puedes escribir o pegar el contenido.

Copia y pega lo siguiente:

```plaintext
# MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ bookworm main non-free

#deb http://mxrepo.com/mx/repo/ bookworm test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bookworm ahs
```

- Cuando termines, **presiona `Esc`** para salir del modo de inserción.

- Para guardar y salir, escribe lo siguiente (debes estar en el modo normal, es decir, sin estar escribiendo texto):

```vim
:wq
```

Y luego presiona `Enter`.

- Si en cambio quieres salir **sin guardar**, escribe:

```vim
:q!
```

y presiona `Enter`.

> Si no estás familiarizado con vim y quieres aprender lo básico, puedes ver [mi mini guía de Vim aquí](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-y-usar-vim-editor-de-texto-de-terminal.html) 

- **Actualizar la lista de repositorios**: después de guardar el archivo, ejecuta:

```bash
sudo apt update
```

Siguiendo estos pasos, habrás añadido el repositorio y actualizado la lista de paquetes en tu sistema.

Ahora si, para así mismo:

Debian 12

Debian 11

Debian 10 

## Para Debian 12 bookworm: MX 23 Repo

Copie las siguientes líneas:

#MX Community Main and Test Repos

deb http://mxrepo.com/mx/repo/ bookworm main non-free

#deb http://mxrepo.com/mx/repo/ bookworm test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bookworm ahs 

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/mx23-archive-keyring\_2023.6.6\_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx23-archive-keyring/mx23-archive-keyring_2023.6.6_all.deb)

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhueQdbSd8OHyGbUnbS4cXkpp08vfq8YxpzLEjJfeAvRsOkGQD4-c2emanbOU_raOzAPloBJyC_r5fdAVQM-Iz5hFhNr27VrIIjD8ABWMorC_Gmj_960QIfQIYMfXUt5_e2XLUp7fa-ogoP_VcnmdY5MTMoHaK60UVM3fmpTIbo0JdbWN8w2vltq_SKgAQ/s16000-rw/20240719-082459%20mx23-archive-keyring_2023.6.6_all.deb.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhueQdbSd8OHyGbUnbS4cXkpp08vfq8YxpzLEjJfeAvRsOkGQD4-c2emanbOU_raOzAPloBJyC_r5fdAVQM-Iz5hFhNr27VrIIjD8ABWMorC_Gmj_960QIfQIYMfXUt5_e2XLUp7fa-ogoP_VcnmdY5MTMoHaK60UVM3fmpTIbo0JdbWN8w2vltq_SKgAQ/s790/20240719-082459%20mx23-archive-keyring_2023.6.6_all.deb.png)

  

**Nota:** Es posible que con el paso del tiempo lo cambien con otro más actual y cambie el nombre de la versión.

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx23-archive-keyring\_\*.\*.deb
```

Este comando se descompone en varias partes:

1.  **`sudo`**: Ejecuta el comando con privilegios de superusuario (root). Esto es necesario porque instalar paquetes en el sistema requiere permisos de administrador.
    
2.  **`dpkg -i`**: `dpkg` es el gestor de paquetes de bajo nivel en Debian y sus derivados, como Ubuntu. La opción `-i` (o `--install`) indica que quieres instalar un paquete.
    
3.  **`mx23-archive-keyring_*.*.deb`**: Especifica el paquete que deseas instalar. En este caso, es un archivo `.deb` que contiene el keyring (anillo de claves) para los repositorios de MX Linux 23. El uso del comodín `*.*` permite coincidir con cualquier versión del paquete, es decir, no importa cuál sea el número de versión, siempre que comience con `mx23-archive-keyring`.
    
En conjunto, el comando instala el paquete `mx23-archive-keyring` que contiene las claves públicas necesarias para verificar la autenticidad de los paquetes del repositorio de MX Linux 23. Estas claves son importantes para asegurar que los paquetes instalados desde los repositorios no han sido manipulados y provienen de una fuente confiable.

Recargue los repositorios le recomiendo desde Synaptic:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-laJM3nUXcOzImy90UkmyZU1PMtg3xZCMq-XCk9h7_NiAUuVXFHioCfb-G-64htcQVXuSb74YIFrrgaaBNpnklgHj6qRVHaejuN8vpm-64omih6XcFMZxaGQwEaOu1oSTvmto3dDb-oVHVbfmBPEkarEt9YM4pkQVxzHvaoMtedv-4YP7Ecx4edTFG98/s16000-rw/20240719-083406%20synaptic%20Recarga%20repos.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-laJM3nUXcOzImy90UkmyZU1PMtg3xZCMq-XCk9h7_NiAUuVXFHioCfb-G-64htcQVXuSb74YIFrrgaaBNpnklgHj6qRVHaejuN8vpm-64omih6XcFMZxaGQwEaOu1oSTvmto3dDb-oVHVbfmBPEkarEt9YM4pkQVxzHvaoMtedv-4YP7Ecx4edTFG98/s860/20240719-083406%20synaptic%20Recarga%20repos.png)

e instale el programa que necesite:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgxQI40yxl3gelqmUdDSRmTa5h6jJglCx-E-YtpcHsQRyc3B4941PukhXHsYziBYYtYPSEP_LQQNRLn0IeoTR3jI1XRc46ObfWTfyALpiop5j_4bRqhjLGsgqGjd1jD6iN2Zg2tUiUXTsK4gn71_ER-5YcQUSchjt4MOH13CthEikvqGDB1RoQC4FZbIzA/s16000-rw/20240719-083602%20repositorios%20de%20MX%20Linux%20activados%20en%20Debian%2012.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgxQI40yxl3gelqmUdDSRmTa5h6jJglCx-E-YtpcHsQRyc3B4941PukhXHsYziBYYtYPSEP_LQQNRLn0IeoTR3jI1XRc46ObfWTfyALpiop5j_4bRqhjLGsgqGjd1jD6iN2Zg2tUiUXTsK4gn71_ER-5YcQUSchjt4MOH13CthEikvqGDB1RoQC4FZbIzA/s964/20240719-083602%20repositorios%20de%20MX%20Linux%20activados%20en%20Debian%2012.png)

## Para Debian 11 bullseye: MX Linux 21 Repo

Copie las siguientes líneas:

#MX Community Main and Test Repos

deb http://mxrepo.com/mx/repo/ bullseye main non-free

#deb http://mxrepo.com/mx/repo/ bullseye test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bullseye ahs 

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/mx21-archive-keyring\_2021.2.19\_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx21-archive-keyring/mx21-archive-keyring_2021.2.19_all.deb)

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx21-archive-keyring\_\*.\*.deb  
```

Recargue los repositorios e instale el programa que necesite

## Para Debian 10 buster: MX Linux 19 Repo

Copie las siguientes líneas:

#MX Community Main and Test Repos
deb http://mxrepo.com/mx/repo/ buster main non-free

#deb http://mxrepo.com/mx/repo/ buster test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ buster ahs 

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring\_2020.4.29\_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring_2020.4.29_all.deb)

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

```bash
sudo dpkg -i mx19-archive-keyring\_\*.\*.deb  
```
  
Recargue los repositorios e instale el programa que necesite

## Consejos

Yo he activado este repositorio y he instalado:

ksnip.- Para hacer capturas de pantalla (lo actualicé pues allí está una versión mejor)

mx-snapshot.- herramienta que se utiliza para crear un Live-CD desde el sistema en ejecución

## Es posible descargar manualmente programas

Por si necesita manualmente descargar algun programa, puede entrar manualmente a las siguientes direcciones

[https://mxrepo.com/mx/repo/pool/](https://mxrepo.com/mx/repo/pool/)

de allí yo he buscado en:

pool  
non-free

Dios les bendiga

## CONSULTAS

**Lista de repositorios MX Linux**  
[https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt](https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt)

**Repos — MX-23**  
[https://mxlinux.org/uncategorized/repos-mx-23/](https://mxlinux.org/uncategorized/repos-mx-23/)














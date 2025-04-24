Este tutorial es para instalar los repositorios de MX Linux a Sistemas Operativos Debian y basados en Debian que no lo tienen añadido, ejemplo (puede ser cualquier otro, como Debian mismo):

La siguiente imagen es del repositorio de MX Linux 21 añadido en [Q4OS versión 4](https://q4os.org/downloads3.html) visto en Synaptic:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUZ0BS5HvsuwuvmHxlpJsA13z-DogK5MpV_P0MgnzDS7LiecvKXPXJKHfreGHLcDtGR28MTPS0wYqOd6c_ReDlh1Pf7-Q5WtMIur-_T1kR4onHinXcOjAH2n7ulL92dAB5MkImxIMhkH0HZR5iWM51eV7HvOmfWNG3vKkfEm0os4sc48hFiIb4ROx7raY/s16000-rw/20231118-182409%20repositorio%20de%20MX%20Linux%2021%20a%C3%B1adido.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUZ0BS5HvsuwuvmHxlpJsA13z-DogK5MpV_P0MgnzDS7LiecvKXPXJKHfreGHLcDtGR28MTPS0wYqOd6c_ReDlh1Pf7-Q5WtMIur-_T1kR4onHinXcOjAH2n7ulL92dAB5MkImxIMhkH0HZR5iWM51eV7HvOmfWNG3vKkfEm0os4sc48hFiIb4ROx7raY/s603/20231118-182409%20repositorio%20de%20MX%20Linux%2021%20a%C3%B1adido.png)

### Qué se puede instalar desde este repositorio?

En los repositorios de MX Linux hay software muy importante como ejemplo:  
  
**Para Dolphin Administrador de archivos:**
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
  

### Añadiendo los repositorios de MX Linux Linux a Debian 12

Esta es una explicación genérica que ha hago para Debian 12, con estas explicaciones deberán poder hacer esto en Debian 11, y Debian 10

   

Para añadir el repositorio de MX Linux debemos añadirlo en el:  
  
/etc/apt/sources.list.d/  
  
podemos usar Gedit si es que lo deja hacer (o sea si es que lo permite):

 
sudo gedit /etc/apt/sources.list.d/mx.list


digo si es que deja porque ejemplo Kate no deja hacer esto.  
  
o también se puede usar nano desde la terminal (este siempre permite hacerlo). Nano es un editor de texto de terminal que siempre sirve para cosas como estas que necesitan elevar los permisos:

sudo nano /etc/apt/sources.list.d/mx.list

Aquí tienes los pasos detallados para añadir el repositorio utilizando `nano`:

1.) **Abrir la terminal**: Puedes abrir la terminal presionando `Ctrl + Alt + T` o buscándola en el menú de aplicaciones.

2.) El siguiente comando creará el archivo mx.list automáticamente **con `nano`**:

sudo nano /etc/apt/sources.list.d/mx.list

3.) **Editar el archivo en `nano`**: ─ Añade la siguiente línea:

**El repositorio de MX Linux para Debian 12:** 

MX Community Main and Test Repos
    
deb http://mxrepo.com/mx/repo/ bookworm main non-free

#deb http://mxrepo.com/mx/repo/ bookworm test

#ahs hardware stack repo
#deb http://mxrepo.com/mx/repo/ bookworm ahs 

 4.) **Guardar el archivo en `nano`**: ─ Presiona `Ctrl + O` (Control y O al mismo tiempo) para guardar los cambios. ─ `nano` te pedirá confirmación para el nombre del archivo, presiona `Enter` para confirmar la escritura en el archivo mx.list.

**Nota:** Nano abrevia CTRL con ^, así CTRL + O es igual a:  
  
^O  
  
y en nano aparece así:  
  
^O Guardar  
  
por eso para guardar aplaste:  
  
CTRL + O  

5.) **Cerrar `nano`**: ─ Presiona `Ctrl + X` (Control y X al mismo tiempo) para salir del editor `nano`.

Nota: Nano abrevia CTRL con ^, así CTRL + X es igual a: 

^X

y en nano apare así: 

^X Salir

que es para Salir 

**Pero**: Si Ud está escribiendo algo y ha aplastado "CTRL + O" la opción CTRL + X no estará disponible hasta que Ud de ENTER y allí si saldrá de nano 

  

### Comandos básicos

### 

Los comandos en `nano` se ejecutan usando la tecla `Ctrl` (Control) en combinación con otra tecla. Aquí tienes algunos comandos útiles:

-   **Guardar el archivo**: `Ctrl + O` (luego presiona `Enter` para confirmar).
-   **Salir de `nano`**: `Ctrl + X`.
-   **Cortar una línea**: `Ctrl + K`.
-   **Pegar una línea**: `Ctrl + U`.
-   **Buscar texto**: `Ctrl + W` (luego escribe el texto que quieres buscar y presiona `Enter`).
-   **Moverse al principio del archivo**: `Ctrl + Y`.
-   **Moverse al final del archivo**: `Ctrl + V`.
-   **Moverse entre varias palabras**: Sostener `Ctrl` y usar las Flechas izquierda o derecha.
-   **Borrar palabras enteras hacia la izquierda**: Ubicándose a la derecha de la palabra que de sea borrar usar `Ctrl + Shift + Supr`, esto se puede hacer varias veces si hay más palabras a la izquierda.

Si necesita ayuda adicional mientras usas `nano`, puedes presionar `Ctrl + G` para abrir el menú de ayuda, y usa Ctrl + X dos veces para salir.

  
6.) **Actualizar la lista de repositorios**: ─ Una vez que hayas cerrado `nano`, ejecuta el siguiente comando para actualizar la lista de paquetes disponibles:

sudo apt update

Siguiendo estos pasos, habrás añadido el repositorio y actualizado la lista de paquetes en tu sistema.

Ahora si, para así mismo:

Debian 12

Debian 11

Debian 10 

### Para Debian 12 bookworm: MX 23 Repo

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

sudo dpkg -i mx23-archive-keyring\_\*.\*.deb

Este comando se descompone en varias partes:

1.  **`sudo`**: Ejecuta el comando con privilegios de superusuario (root). Esto es necesario porque instalar paquetes en el sistema requiere permisos de administrador.
    
2.  **`dpkg -i`**: `dpkg` es el gestor de paquetes de bajo nivel en Debian y sus derivados, como Ubuntu. La opción `-i` (o `--install`) indica que quieres instalar un paquete.
    
3.  **`mx23-archive-keyring_*.*.deb`**: Especifica el paquete que deseas instalar. En este caso, es un archivo `.deb` que contiene el keyring (anillo de claves) para los repositorios de MX Linux 23. El uso del comodín `*.*` permite coincidir con cualquier versión del paquete, es decir, no importa cuál sea el número de versión, siempre que comience con `mx23-archive-keyring`.
    
En conjunto, el comando instala el paquete `mx23-archive-keyring` que contiene las claves públicas necesarias para verificar la autenticidad de los paquetes del repositorio de MX Linux 23. Estas claves son importantes para asegurar que los paquetes instalados desde los repositorios no han sido manipulados y provienen de una fuente confiable.

Recargue los repositorios le recomiendo desde Synaptic:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-laJM3nUXcOzImy90UkmyZU1PMtg3xZCMq-XCk9h7_NiAUuVXFHioCfb-G-64htcQVXuSb74YIFrrgaaBNpnklgHj6qRVHaejuN8vpm-64omih6XcFMZxaGQwEaOu1oSTvmto3dDb-oVHVbfmBPEkarEt9YM4pkQVxzHvaoMtedv-4YP7Ecx4edTFG98/s16000-rw/20240719-083406%20synaptic%20Recarga%20repos.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-laJM3nUXcOzImy90UkmyZU1PMtg3xZCMq-XCk9h7_NiAUuVXFHioCfb-G-64htcQVXuSb74YIFrrgaaBNpnklgHj6qRVHaejuN8vpm-64omih6XcFMZxaGQwEaOu1oSTvmto3dDb-oVHVbfmBPEkarEt9YM4pkQVxzHvaoMtedv-4YP7Ecx4edTFG98/s860/20240719-083406%20synaptic%20Recarga%20repos.png)

e instale el programa que necesite:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgxQI40yxl3gelqmUdDSRmTa5h6jJglCx-E-YtpcHsQRyc3B4941PukhXHsYziBYYtYPSEP_LQQNRLn0IeoTR3jI1XRc46ObfWTfyALpiop5j_4bRqhjLGsgqGjd1jD6iN2Zg2tUiUXTsK4gn71_ER-5YcQUSchjt4MOH13CthEikvqGDB1RoQC4FZbIzA/s16000-rw/20240719-083602%20repositorios%20de%20MX%20Linux%20activados%20en%20Debian%2012.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgxQI40yxl3gelqmUdDSRmTa5h6jJglCx-E-YtpcHsQRyc3B4941PukhXHsYziBYYtYPSEP_LQQNRLn0IeoTR3jI1XRc46ObfWTfyALpiop5j_4bRqhjLGsgqGjd1jD6iN2Zg2tUiUXTsK4gn71_ER-5YcQUSchjt4MOH13CthEikvqGDB1RoQC4FZbIzA/s964/20240719-083602%20repositorios%20de%20MX%20Linux%20activados%20en%20Debian%2012.png)

### Para Debian 11 bullseye: MX Linux 21 Repo

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

sudo dpkg -i mx21-archive-keyring\_\*.\*.deb  

Recargue los repositorios e instale el programa que necesite

### Para Debian 10 buster: MX Linux 19 Repo

Copie las siguientes líneas:

    # MX Community Main and Test Reposdeb http://mxrepo.com/mx/repo/ buster main non-free#deb http://mxrepo.com/mx/repo/ buster test#ahs hardware stack repo#deb http://mxrepo.com/mx/repo/ buster ahs 

en el archivo mx.list con alguno de los métodos que se indicó arriba y guarde

ahora descargue la llave desde:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/)

a la fecha que hago este tutorial está el archivo:

[https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring\_2020.4.29\_all.deb](https://mxrepo.com/mx/repo/pool/main/m/mx19-archive-keyring/mx19-archive-keyring_2020.4.29_all.deb)

e instálelo, puede ser con dpkg desde la terminal, ejemplo para este archivo sería:

sudo dpkg -i mx19-archive-keyring\_\*.\*.deb  

  
Recargue los repositorios e instale el programa que necesite

### Consejos

Yo he activado este repositorio y he instalado:

ksnip.- Para hacer capturas de pantalla (lo actualicé pues allí está una versión mejor)

mx-snapshot.- herramienta que se utiliza para crear un Live-CD desde el sistema en ejecución



### Es posible descargar manualmente programas

Por si necesita manualmente descargar algun programa, puede entrar manualmente a las siguientes direcciones

[https://mxrepo.com/mx/repo/pool/](https://mxrepo.com/mx/repo/pool/)

de allí yo he buscado en:

pool  
non-free

Dios les bendiga

### CONSULTAS

**Lista de repositorios MX Linux**  
[https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt](https://github.com/MX-Linux/mx-repo-list/blob/master/repos.txt)

**Repos — MX-23**  
[https://mxlinux.org/uncategorized/repos-mx-23/](https://mxlinux.org/uncategorized/repos-mx-23/)














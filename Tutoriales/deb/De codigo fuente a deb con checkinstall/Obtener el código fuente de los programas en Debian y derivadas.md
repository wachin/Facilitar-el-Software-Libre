
Obtener el código fuente de los programas en Debian y derivadas
[https://geekland.eu/obtener-el-codigo-fuente-de-los-programas-en-debian-y-derivadas/](https://geekland.eu/obtener-el-codigo-fuente-de-los-programas-en-debian-y-derivadas/)

En Linux se menciona frecuentemente que el código fuente de los programas está disponible para que todo el mundo pueda estudiarlo, auditarlo y compilar sus propios programas. Pero la realidad es que la gran mayoría de usuarios, entre los que me incluyo, se limita a trabajar con los paquetes binarios. Por este motivo a continuación explicaré de forma breve un par de métodos para que los usuarios de Debian y de distribuciones basadas en Debian puedan obtener el código fuente de la mayoría de programas presentes en los repositorios.

## OBTENER EL CÓDIGO FUENTE DE LOS PROGRAMAS A TRAVÉS DE PACKAGES.DEBIAN.ORG

Una solución muy sencilla para obtener el código fuente de un programa es visitar la siguiente web:

[https://www.debian.org/distrib/packages](https://www.debian.org/distrib/packages)

Una vez en ella buscan el programa del cual quieren obtener el código fuente. En mi caso buscare el software neovim.

[![Buscar el programa para descargar el código fuente](https://geekland.eu/wp-content/uploads/2020/08/buscar-el-programa-para-descargar-el-codigo-fuente.png "Buscar el programa para descargar el código fuente")](https://geekland.eu/wp-content/uploads/2020/08/buscar-el-programa-para-descargar-el-codigo-fuente.png)

Una vez estén dentro de la URL para descargar el paquete binario de neovim tienen que mirar en la parte derecha de su pantalla y clicar en el enlace que contiene las palabras **orig.tar.gz**.

[![Obtener el código fuente de Neovim](https://geekland.eu/wp-content/uploads/2020/08/obtener-el-codigo-fuente-de-neovim.png "Obtener el código fuente de Neovim")](https://geekland.eu/wp-content/uploads/2020/08/obtener-el-codigo-fuente-de-neovim.png)

Acto seguido se descargará el código fuente de neovim y lo podremos consultar y compilar sin ningún tipo de restricción.

[![Viendo los ficheros de Neovim](https://geekland.eu/wp-content/uploads/2020/08/ficheros-codigo-fuente-neovim.png "Ver los ficheros del código fuente de Neovim")](https://geekland.eu/wp-content/uploads/2020/08/ficheros-codigo-fuente-neovim.png)

## OBTENER EL CÓDIGO FUENTE DE LOS PROGRAMAS A TRAVÉS DEL GESTOR DE PAQUETES APT

El gestor de paquetes apt también permite obtener el código fuente de nuestros programas de forma extremadamente sencilla. Para ello tendremos que asegurar que las fuentes de nuestros repositorios tengan las entradas pertinentes para poder descargar el código fuente.

### Comprobar que los repositorios de nuestro distro tienen la configuración necesaria

Para consultar las fuentes de nuestros repositorios tan solo tenemos que ejecutar el siguiente comando en la terminal:

> ```
> nano /etc/apt/sources.list
> ```

Acto seguido podrán ver las fuentes de sus repositorios:

```
## Debian Testing
deb http://ftp.de.debian.org/debian/ testing main contrib non-free
deb-src http://ftp.de.debian.org/debian/ testing main contrib non-free

## Actualizaciones de seguridad
deb http://security.debian.org/ testing-security main contrib non-free
deb-src http://security.debian.org/ testing-security main contrib non-free

##Multimedia testing ## aptitude install debian-multimedia-keyring
deb http://www.deb-multimedia.org/ testing main non-free
deb-src http://www.deb-multimedia.org/ testing main non-free
```

Si os fijáis las partes de color azul hacen referencia a las entradas para descargar el código fuente porque contienen el texto `src`. Por lo tanto en mi caso tengo todo lo necesario para descargar el código fuente de cualquiera de los paquetes presente en los repositorios de Debian. En caso que no dispongan de las entradas pertinentes las deberán añadir o descomentar en el caso que estén comentadas. En este caso no les servirá copiar y pegar mis entradas ya que las entradas dependen de la distribución que usen.

### Descargar el código fuente de un programa mediante apt

Una vez estemos seguros que podemos descargar el código fuente tan solo tendremos que ejecutar un comando del siguiente tipo:

> ```
> apt source nombre_del paquete
> ```

Por lo tanto para obtener el código fuente de neovim tan solo tendré que usar el siguiente comando:

> ```
> apt source neovim
> ```

El resultado obtenido en mi caso es el siguiente:

```
joan@debian:~$ apt source neovim
Leyendo lista de paquetes... Hecho
NOTA: el empaquetamiento de «neovim» se mantiene en el sistema de control de versiones «Git» en:
https://salsa.debian.org/vim-team/neovim.git
Utilice:
git clone https://salsa.debian.org/vim-team/neovim.git
para obtener las últimas actualizaciones (posiblemente no publicadas aún) del paquete.
Se necesita descargar 9.576 kB de archivos fuente.
Des:1 http://ftp.de.debian.org/debian testing/main neovim 0.4.4-1 (dsc) [2.850 B]
Des:2 http://ftp.de.debian.org/debian testing/main neovim 0.4.4-1 (tar) [9.558 kB]
Des:3 http://ftp.de.debian.org/debian testing/main neovim 0.4.4-1 (diff) [14,6 kB]
Descargados 9.576 kB en 2s (3.855 kB/s)
dpkg-source: información: extrayendo neovim en neovim-0.4.4
dpkg-source: información: desempaquetando neovim_0.4.4.orig.tar.gz
dpkg-source: información: desempaquetando neovim_0.4.4-1.debian.tar.xz
```

Si consultamos el contenido descargado veremos que efectivamente se trata del código fuente de neovim.

[![ficheros del código fuente mediante apt](https://geekland.eu/wp-content/uploads/2020/08/codigo-fuente-de-neovim-con-apt-source.png "Obtener el código fuente mediante apt")](https://geekland.eu/wp-content/uploads/2020/08/codigo-fuente-de-neovim-con-apt-source.png)

## Navegación de entradas 

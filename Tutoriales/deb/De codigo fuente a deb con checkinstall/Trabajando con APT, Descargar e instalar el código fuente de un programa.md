   
 
# Trabajando con APT: Descargar e instalar el código fuente de un programa
 por J. Carlos

[https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/)

> Todos los comandos utilizados en este artículo se han probado en **[Debian](http://www.debian.org/)** 8

Índice General

1.  [Introducción](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n1)
2.  [Paquetes necesarios para la compilación de un paquete fuente](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n2)
3.  [Descarga del paquete fuente](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n3)
4.  [Compilación el paquete](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n4)
5.  [Descarga y compilación automática del paquete](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n5)
6.  [Instalación del paquete](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n6)

[Enlaces externos](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_ee)  
 

2.  Introducción [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    El mundo del **[software libre](https://es.wikipedia.org/wiki/Software_libre)** nos permite editar el **código fuente** y corregirlo en caso de contener errores o para mejorarlo. Para hacerlo deberemos descargar el **código fuente** del programa.
    
    Para poder descargar el **código fuente** deberemos incluir una entrada deb-src en el archivo etc/apt/sources.list. Esto lo vimos en el artículo [Trabajando con APT: Gestión de repositorios](http://www.zeppelinux.es/trabajando-con-apt-gestion-de-repositorios/).
    
    Los pasos que seguiremos en este artículo serán los siguientes:
    
    1.  Obviamente, tener claro que programa vamos a editar para corregir o mejorar. En este artículo compilaremos el paquete jed que es un editor de texto plano.
    2.  Satisfacer las dependencias del paquete que queremos editar.
    3.  Descargar el código fuente y editarlo si es nuestra intención.
    4.  Compilar el programa.
    5.  Instalar el programa.
3.  Paquetes necesarios para la compilación de un paquete fuente [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    Una vez que sabemos que paquete queremos editar, para una compilación exitosa, serán necesarias, normalmente, **librerías compartidas** y ciertos **encabezados**. Todos los **paquetes fuente** tienen un campo en sus archivos de control llamado Build-Depends en el cual se indica que paquetes adicionales son necesarios para que el paquete pueda ser compilado.
    
    **APT** tiene un método sencillo para descargar estos paquetes (y sus **dependencias**). Sólo es necesario ejecutar apt-get build-dep nombredepaquete. Por ejemplo, para instalar las dependencias correspondientes al paquete jed ejecutaremos el siguiente comando:
    
    ```
    $ sudo apt-get build-dep jed
    Leyendo lista de paquetes... Hecho
    Creando árbol de dependencias       
    Leyendo la información de estado... Hecho
    Se instalarán los siguientes paquetes NUEVOS:
      autotools-dev chrpath dpatch hardening-wrapper hevea libexpat1-dev libfontconfig1-dev
      libfreetype6-dev libgpm-dev libice-dev libkpathsea6 libonig2 libpng12-dev libpotrace0 libptexenc1
      libpthread-stubs0-dev libslang2-dev libslang2-modules libsm-dev libsynctex1 libx11-dev libxau-dev
      libxcb1-dev libxdmcp-dev libxft-dev libxrender-dev libxt-dev libzzip-0-13 ocaml-base-nox slsh
      tex-common texlive-base texlive-binaries x11proto-core-dev x11proto-input-dev x11proto-kb-dev
      x11proto-render-dev xorg-sgml-doctools xtrans-dev zlib1g-dev
    0 actualizados, 40 nuevos se instalarán, 0 para eliminar y 0 no actualizados.
    Se necesita descargar 32,4 MB de archivos.
    Se utilizarán 109 MB de espacio de disco adicional después de esta operación.
    ¿Desea continuar? [S/n]
    ```
    
    Indicamos que **deseamos continuar** seleccionando S y de esta forma se instalarán los paquetes necesarios (**dependencias**) para que jed pueda ser compilado correctamente. _Este comando no busca el paquete fuente del programa que pretendemos compilar, sólo descarga las dependencias del mismo_.
    
    Si lo que nos interesa es solamente conocer, no instalar, que **dependencias** se requieren para compilar un cierto paquete, hay una variante del comando apt-cache show (ver artículo [Trabajando con APT: Obtener Información de los paquetes en Debian](http://www.zeppelinux.es/obtener-informacion-de-los-paquetes-en-debian/)). Esta variante del comando es:.
    
    ```
    $ sudo apt-cache showsrc nombredepaquete
    ```
    
    La cual nos listará todas las dependencias del paquete, pero repito, no las instala, sólo las muestra.
    
4.  Descarga del paquete fuente [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    Para descargar un **paquete fuente** ejecutaremos la siguiente orden:
    
    ```
    $ apt-get source nombredepaquete
    ```
    
    Con esta orden descargaremos en el directorio activo, donde ejecutamos la orden, un fichero.orig.tar.xz, un fichero .dsc y un fichero .debian.xz. Según los manuales, en el caso de paquetes especiales para **Debian**, el último de estos archivos no es descargado y el primero generalmente no tendrá el orig en el nombre. Además se creará, también en el directorio activo, una carpeta con el nombre nombredepaquete-version.  
    Para descargar el **código fuente** del paquete jed ejecutamos el siguiente comando:
    
    Y si hacemos un ls -ld jed\* obtendremos el siguiente resultado:
    
    ```
    $ ls -ld jed*
    drwxr-xr-x 9 karfer karfer    4096 ene 30 21:06 jed-0.99.19
    -rw-r--r-- 1 karfer karfer   30984 jun 11  2014 jed_0.99.19-3.diff.gz
    -rw-r--r-- 1 karfer karfer    2171 jun 11  2014 jed_0.99.19-3.dsc
    -rw-r--r-- 1 karfer karfer 1094494 dic 18  2009 jed_0.99.19.orig.tar.gz
    ```
    
    El archivo .dsc es utilizado por dbpkg-source para descomprimir el paquete en el directorio nombredepaquete-version, que en nuestro caso es jed-0.99.19. Por cada paquete descargado existe un directorio nombredepaquete-version/debian/ que contiene los archivos necesarios para editar el **código fuente** y posteriormente compilar y crear el o los paquetes .deb.
    
5.  Compilación el paquete [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    Tras la descarga del **paquete fuente** en el directorio activo, se habrá creado en dico directorio otro directorio de nombre nombredepaquete-version, nos situaremos en dicho directorio, que en nuestro caso será jed-0.99.19 y ejecutamos el siguiente comando:
    
    Una vez situados en el directorio ejecutamos el siguiente comando que dará comienzo a la compilación:
    
    ```
    $ dpkg-buildpackage -rfakeroot -uc -b
    ```
    
    Al finalizar la compilación, retrocedemos un directorio con el siguiente comando:
    
    Y si hacemos un ls -l \*.deb obtendremos la lista de paquetes ya compilados y listos para la instalación del programa jed:
    
    ```
    $ ls -l *.deb
    -rw-r--r-- 1 karfer karfer 130932 ene 30 21:22 jed_0.99.19-3_amd64.deb
    -rw-r--r-- 1 karfer karfer 445412 ene 30 21:22 jed-common_0.99.19-3_all.deb
    -rw-r--r-- 1 karfer karfer 146572 ene 30 21:22 xjed_0.99.19-3_amd64.deb
    ```
    
6.  Descarga y compilación automática del paquete [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    También podemos optar por **descargar y compilar automáticamente** de una sola vez el paquete. Para hacerlos, en el **[paso 3. Descarga del paquete fuente](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_n3)**, sólo tendremos que agregar \-b a la línea de comando:
    
    ```
    $ sudo apt-get -b source packagename
    ```
    
    De esta forma, descargaremos el **paquete fuente** y a continuación, comenzará la compilación del mismo. Tiene un inconveniente y es que no nos permite editar el **código fuente**.
    
7.  Instalación del paquete [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)  
    Tras la compilación, puede que se generen más de un paquete .deb. Para instalar el paquete o paquetes, como en este caso, que han sido creados, utilizaremos el sistema de administración de paquetes dpkg de la siguiente forma:
    
    ```
    $ sudo dpkg -i nombredepaquete.deb
    ```
    
    En nuestro caso ejecutariamos el siguiente comando:
    

   
Enlaces externos [(Volver al índice General)](https://www.zeppelinux.es/trabajando-con-apt-descargar-e-instalar-el-codigo-fuente-de-un-programa/#an_indice)

-   [APT HOWTO Herramienta Avanzada de Empaquetamiento (Advanced Packaging Tool)](https://www.debian.org/doc/manuals/apt-howto/ch-sourcehandling.es.html)  
    Aunque en el enlace indica que es documentación obsoleta, todos los comandos que aparecen en este artículo han sido probados en **Debian** 8

Espero que este artículo os haya sido de utilidad. Si pensáis que podéis colaborar para mejorar este artículo, que hay algo erróneo en él o simplemente deseáis comentarlo, por favor, dejad vuestra opinión más abajo.


# De código fuente a paquete .deb con checkinstall – El array de Jota

[https://www.elarraydejota.com/de-codigo-fuente-a-paquete-deb-con-checkinstall/](https://www.elarraydejota.com/de-codigo-fuente-a-paquete-deb-con-checkinstall/)

por  [Jota][0]   |  julio 23, 2016


Debian todo lo hace sencillo. Vamos a ver cómo crear fácilmente un paquete **.deb** a partir del código fuente de una aplicación. Para ello utilizaremos **checkinstall**. De su página man:

[![](https://www.elarraydejota.com/wp-content/uploads/2016/07/checkinstall_description.png)](https://www.elarraydejota.com/wp-content/uploads/2016/07/checkinstall_description.png "")

Como vemos sirve para crear otro tipo de paquetes como **RPM** o **TGZ**, pero en este caso nos centraremos en los **.deb**

Si no lo tenemos instalado, procedemos a ello con:

    apt-get install checkinstall

Imaginemos que queremos compilar una determinada versión del servidor web **Apache** con unas opciones específicas. Lo primero que haríamos sería descargar el código fuente:

    wget -c http://apache.rediris.es//httpd/httpd-2.4.23.tar.gz

Posteriormente desempaquetaríamos y lanzaríamos un configure con las opciones para la compilación:

    tar -zxvf httpd-2.4.23.tar.gzcd httpd-2.4.23./configure --prefix=/opt/apache-2.4.23
    --enable-mods-shared=all --enable-ssl \
    --enable-proxy --enable-proxy-connect --enable-proxy-ftp --enable-proxy-http \
    --enable-proxy-scgi --enable-proxy-ajp --enable-proxy-balancer --with-mpm=worker


Después un make:

    make

Y finalmente haríamos un make install… Pero no, en esta ocasión vamos a construir el paquete con **checkinstall**. Con la opción -D indicamos que vamos a crear un paquete **.deb**, con --pkgname indicamos el nombre del paquete y con --fstrans=no deshabilitamos el uso de un directorio temporal durante la instalación (he necesitado esta opción para poder compilar el binario sin errores). Procedemos entonces con:

`checkinstall -D --pkgname=apache-with-proxy-balancer --fstrans=no make install`

Posteriormente tendremos que contestar alguna que otra pregunta, como por ejemplo la descripción del paquete.



    checkinstall 1.6.2, Copyright 2009 Felipe Eduardo Sanchez Diaz Duran
    This software is released under the GNU GPL.

    The package documentation directory ./doc-pak does not exist.
    Should I create a default set of package docs? [y]:

    Preparing package documentation...OK

    Please write a description for the package.
    End your description with an empty line or EOF.
    >> Apache .deb package with mod_proxy_balancer compiled
    >>


Después, tendremos la opción de cambiar una serie de campos (mantenedor, descripción, licencia, etc…) referentes a la información asociadada al paquete que vamos a generar:

    ********************************************* 
    Debian package creation selected 
    ********************************************

    This package will be built according to these values:

    0 - Maintainer: [ root@debianbob ]
    1 - Summary: [ Apache .deb package with mod_proxy_balancer compiled ]
    2 - Name: [ apache-with-proxy-balancer ]
    3 - Version: [ 2.4.23 ]
    4 - Release: [ 1 ]
    5 - License: [ GPL ]
    6 - Group: [ checkinstall ]
    7 - Architecture: [ amd64 ]
    8 - Source location: [ httpd-2.4.23 ]
    9 - Alternate source location: [ ]
    10 - Requires: [ ]
    11 - Provides: [ apache-with-proxy-balancer ]
    12 - Conflicts: [ ]13 - Replaces: [ ]

    Enter a number to change any of them or press ENTER to continue:


Modificamos según necesitamos y continuamos. Si todo ha ido bien deberíamos ver lo siguiente al final:

    **********************************************************************

    Done. The new package has been installed and saved to

    /root/apache/httpd-2.4.23/apache-with-proxy-balancer_2.4.23-1_amd64.deb

    You can remove it from your system anytime using:

    dpkg -r apache-with-proxy-balancer

    **********************************************************************

Una vez generado, podemos manejar el paquete con las herramientas de manejo de binarios que le corresponden, que en este caso es **dpkg**. Por ejemplo podemos ver que lo hemos instalado con un dpkg -l | grep apache:

    ii  apache-with-proxy-balancer            2.4.23-1                             amd64        Apache .deb package with mod_proxy_balancer compiled
    ii  apache2                               2.4.10-10+deb8u5                     amd64        Apache HTTP Server
    ii  apache2-bin                           2.4.10-10+deb8u5                     amd64        Apache HTTP Server (modules and other binary files)
    ii  apache2-data                          2.4.10-10+deb8u5                     all          Apache HTTP Server (common files)
    ii  apache2-utils                         2.4.10-10+deb8u5                     amd64        Apache HTTP Server (utility programs for web servers)
    ii  apache2.2-bin                         2.4.10-10+deb8u5                     amd64        Transitional package for apache2-bin
    ii  libapache2-mod-dnssd                  0.6-3.1                              amd64        Zeroconf support for Apache 2 via avahi



Para borrarlo podríamos hacer un dpkg -r apache-with-proxy-balancer. 


De la misma manera, para reinstalarlo haríamos un dpkg -i 

    apache-with-proxy-balancer_2.4.23-1_amd64.deb

Como nota final, cuando lanzamos checkinstall podemos incluir todas las opciones -mantenedor, descripción, etc…- pasándolas como argumentos. Por ejemplo:

    checkinstall-D -y \
    --install=no \
    --fstrans=no \
    --reset-uids=yes \
    --pkgname=apache-with-proxy-balancer \
    --pkgversion=2.4.23 \
    --arch=amd64 \
    --pkglicense=GPL \
    --maintainer="root@debianbob" \


Para echarle un vistazo a todas las opciones y posibilidades como siempre **man** es nuestro amigo 

![😉][2]

 Categoría: [GNU/Linux][3]  Etiquetas: [compilacion][4], [debian][5], [ubuntu][6]

[0]: https://www.elarraydejota.com/author/juliosanz/
[1]: https://www.elarraydejota.com/de-codigo-fuente-a-paquete-deb-con-checkinstall/#respond
[2]: https://s.w.org/images/core/emoji/14.0.0/svg/1f609.svg
[3]: https://www.elarraydejota.com/category/gnulinux/
[4]: https://www.elarraydejota.com/tag/compilacion/
[5]: https://www.elarraydejota.com/tag/debian/
[6]: https://www.elarraydejota.com/tag/ubuntu/
 published from :[De código fuente a paquete .deb con checkinstall – El array de Jota](https://www.elarraydejota.com/de-codigo-fuente-a-paquete-deb-con-checkinstall/)
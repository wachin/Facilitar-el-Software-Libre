# Creación del directorio 'debian' con dh_make para debianizar tu programa 
https://crysol.org/recipe/2009-10-09/creacin-del-directorio-debian-con-dh_make-para-debianizar-tu-programa.html#.YtdePNRBy6m

Esta receta muestra cómo crear el directorio debian necesario para empaquetar tu proyecto. Para ello, se utiliza la herramienta dh_make.

**[editado]** Puedes encontrar una versión actualizada de esta receta en [http://barrabash.org/node/6][0]

## Instalación

Para instalar dh_make, utilizamos la siguiente orden:

    # aptitude install dh-make

## Configuración

dh_make necesita saber la información del mantenedor. Concretamente, necesita el nombre completo ( DEBFULLNAME ) y el email ( DEBEMAIL ). Por ello, es recomendable que añadas lo siguiente a tu ~/.bashrc:

    export DEBFULLNAME="Tu Nombre Completo"
    export DEBEMAIL=tuemail@dondesea.com

## Uso

Normalmente, los paquetes Debian se construyen a partir de un código fuente no desarrollado por el propio mantenedor del paquete. De esta forma, es habitual partir de un código fuente original (en un tar.gz) y, por ello, dh_make trata de comenzar todo el proceso a partir de ese archivo. Sin embargo, no es nuestro caso. Tu situación es que eres el desarrollador del programa y, además, quieres ser el mantenedor del paquete.

Con ello en mente, supongamos que tu proyecto se encuentra en la ruta _/home/pepito/miproyecto_. Vamos a dicho directorio y ejecutamos lo siguiente:

    ~/miproyecto $ dh_make -p miproyecto_1.0 -c gpl3 --createorig

_miproyecto_1.0_ es el nombre del paquete fuente y su versión. La opción ‘c’ especifica la licencia que incluirá el archivo copyright del paquete y ‘—createorig’ es necesaria por el motivo explicado al principio: como no existe un paquete orig.gz con el código fuente original, se le indica a dh_make que lo cree él.

dh_make nos preguntará lo siguiente:

    Type of package: single binary, indep binary, multiple binary, library, kernel module, kernel patch or cdbs?
     [s/i/m/l/k/n/b]

La respuesta a esta pregunta dependerá del proyecto. A continuación, se describen las opciones más comunes:

* **single binary**: se pretende generar un paquete binario. Es el caso más frecuente y el que se debe seleccionar si no lo tienes muy claro.
* **indep binary**: para crear un paquete binario que es independiente de la plataforma destino.
* **multiple binary**: si tu proyecto es muy grande y se compone de librerías, scripts y/o varios ejecutables esta es la opción que debes elegir. Con esta opción se le comunica a dh_make que desde el paquete fuente se crearán varios paquetes binarios. Un ejemplo de este tipo es el paquete zeroc-ice33.
* **library**: si quieres empaquetar una librería esta es la mejor opción. dh_make generará los archivos necesarios para construir la típica pareja de paquetes libloquesea.deb y libloquesea-dev.deb.

Una vez elegido el modo más apropiado, dh_make nos pedirá que confirmemos los datos introducidos y se creará el directorio debian. Dentro de él podemos ver archivos de ejemplo que tienen extensión ‘.ex’/‘.EX’. Por ejemplo, manpage.1.ex es un ejemplo de página de manual. Explóralos y estudia cuál de ellos te puede servir para crear tu paquete.

Excluyendo todos los ejemplos, nos quedan los archivos realmente importantes del paquete. Debes editar los siguientes conforme a tus necesidades:

#### copyright

Rellena los datos que se indican en la plantilla.

#### control

Contiene la descripción de los paquetes Debian. El primero de todos es el paquete fuente, con sus “build-depends”, esto es, las dependencias necesarias para compilar y construir los paquetes binarios. Tras éste, vienen listados todos los paquetes binarios que se generarán (separados por una línea en blanco).

Para más información sobre cada uno de los campos posibles, consulta [Control files and their fields][1].

#### rules

Se trata de un Makefile que será el encargado de construir el paquete. Actualmente, dh_make genera el rules para debhelper 7. Normalmente, el código que genera será el necesario para realizar todas las tareas. Sin embargo, es posible que tengas que añadir/modificar en parte dicho archivo. Todo ello dependerá de la estructura de tu proyecto y del resultado que quieras obtener.

#### changelog

Por defecto, dh_make pone el siguiente texto como cambio inicial:

    * Initial release (Closes: #nnnn)  <nnnn is the bug number of your ITP>

En Debian, la versión inicial del paquete suele cerrar un ITP . Supongo que no pretendes subirlo a Debian, así que puedes dejarlo como (¡ojo!, lintian se lanzará un aviso por esto):

    * Initial release.

Los archivos están “autodocumentados”, por lo que puedes borrar y añadir lo que creas en cada uno de ellos. Los archivos README .Debian y README .source son “deseables” pero no obligatorios. Si no tienes nada que decir en ellos, puedes borrarlos.

## Referencias

    $ man dh_make

* [Debian Policy Manual][2]

[0]: http://barrabash.org/node/6
[1]: http://www.debian.org/doc/debian-policy/ch-controlfields.html
[2]: http://www.debian.org/doc/debian-policy/

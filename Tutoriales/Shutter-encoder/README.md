<img align=left src="https://www.shutterencoder.com/images/icon.png" width="64">
<h1>Shutter Encoder v16.1</h1>

![logo](/SocialBanner.png)

Download required [dependencies](../master/Library/sources.txt) into "Library" folder.

Include [fonts](../master/fonts) with JRE.

I'm using [Java version 13](https://adoptopenjdk.net/releases.html?variant=openjdk13&jvmVariant=hotspot) built using jlink:
<code>--compress 0 --strip-debug --no-header-files --no-man-pages --add-modules java.base,java.datatransfer,java.desktop,java.logging,java.security.sasl,java.xml,jdk.crypto.ec --output JRE</code>

## Official website

https://www.shutterencoder.com

### Builds

https://www.shutterencoder.com/en/#downloads

#### Changelog

https://www.shutterencoder.com/changelog.html



# Cómo hacer funcionar Shutter-Enconder en MX Linux 10 y 11 de 32 bits Basado en Debian 10 y 10

Dependencias

```
sudo apt-get install default-jre libimage-exiftool-perl ffmpeg p7zip-full dcraw mkvtoolnix mediainfo youtube-dl git
```


DESCARGAR EL CÓDIGO FUENTE:

```
git clone https://github.com/wachin/shutter-encoder
```

entrar en el directorio del código fuente:

cd shutter-encoder


Instalar las fuentes
Primero crear la carpeta y luego instalar:

    mkdir ~/.fonts/Shutter-Encoder  
    cp -a fonts/. ~/.fonts/Shutter-Encoder

Lanzar la aplicación
Poner en la terminal:

    java -jar "Shutter Encoder.jar"


También se puede lanzar con clic derecho y abrir con el lanzador de aplicaciones de Java


GRACIAS A:

paulpacifico/shutter-encoder: A professional video compression tool accessible to all
https://github.com/paulpacifico/shutter-encoder



OPCIONAL:

Lo siguiente todavía no lo he hecho, son otras tres dependencias que aunque no son necesarias para lo más importante que es convertir videos, el desarrollador las puso disponibles en su programa, pero es necesario compilar esos programas y no lo he tratado de hacer todavía:


**************************************
tsMuxer
https://github.com/justdan96/tsMuxer

Debian 10

wget -qO - https://download.opensuse.org/repositories/home:/justdan96/Debian_debbuild_10/Release.key | sudo apt-key add -
echo "deb https://download.opensuse.org/repositories/home:/justdan96/Debian_debbuild_10  ./" | sudo tee -a /etc/apt/sources.list > /dev/null


****************************************

Download Xpdf and XpdfReader
http://www.xpdfreader.com/download.html

***************************************

bmxtranswrap: sourceforge.net/p/bmxlib/home/Home
https://sourceforge.net/p/bmxlib/bmx/ci/master/tree/README.md

https://sourceforge.net/projects/bmxlib/files/

***************************************

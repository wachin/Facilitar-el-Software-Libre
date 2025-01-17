<img align=left src="https://www.shutterencoder.com/images/icon.png" width="64">
<h1>Shutter Encoder v16.1</h1>

![logo](/SocialBanner.png)


# Shutter-Enconder para Linux de 32 bits

Para Sistemas Operativos Linux de 32 bits como son:

[MX Linux](https://mxlinux.org/)
[Linux Mint Debian Edition](https://linuxmint.com/download_lmde.php)
[Escuelas Linux](https://escuelaslinux.sourceforge.io/)


## Dependencias

```
sudo apt-get install default-jre libimage-exiftool-perl ffmpeg p7zip-full dcraw mkvtoolnix mediainfo youtube-dl git
```



## Instalación

```
mkdir AppLinux
cd AppLinux
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

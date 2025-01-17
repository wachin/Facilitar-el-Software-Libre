# Instalando sfizz (reproducir de instrumentos virtuales SFZ) en Ubuntu, Debian
Publicadas por Washington Indacochea Delgado septiembre 15, 2024

Sfizz es un motor de sonido de código abierto diseñado para reproducir instrumentos virtuales basados en el formato SFZ, un estándar para la creación y distribución de bancos de sonido. Es especialmente útil para músicos, compositores y productores que desean utilizar librerías de sonidos SFZ en su DAW o software de música. Sfizz es ligero y compatible con diferentes plataformas, como Linux, macOS y Windows, y puede integrarse como un plugin VST o LV2 en programas de producción musical.

SFizz se puede usar como plugin en estaciones de trabajo de audio digital (DAWs) como Ardour en formatos como LV2 o VST3. Además, es compatible con sistemas basados en Linux. Para usarlo en Ardour, deberías seguir estos pasos:

1. **Instalación**.- Para Debian 12 (y Sistemas Operativos Linux basados en este ejemplo MX Linux 23, etc) de 32 bit seguí los siguientes pasos:

Linux Build
https://sfz.tools/sfizz/development/build/linux/

aquí dice que hay que instalar las siguientes dependencias:

```
sudo apt install \
libcairo2-dev \
libfontconfig1-dev \
libfreetype6-dev \
libglib2.0-dev \
libpango1.0-dev \
libx11-dev \
libx11-xcb-dev \
libxcb-cursor-dev \
libxcb-keysyms1-dev \
libxcb-util-dev \
libxcb-xkb-dev \
libxkbcommon-dev \
libxkbcommon-x11-dev \
zenity \
libjack-jackd2-dev
```

luego de instaladas seguí los siguientes pasos:
https://sfz.tools/sfizz/development/build/

puse en la terminal en un lugar donde tengo códigos fuentes de varios programas:

```
git clone --recursive https://github.com/sfztools/sfizz-ui.git
```

con esto se descarga el repositorio y todos los submódulos  necesarios


luego debemos entrar en el repositorio:

```
cd sfizz-ui
```

luego según el tutorial:

pongo:

```
mkdir build && cd build
cmake ..
make
```

espero, y cuando ya está para instalar pongo:

```
sudo make install
```

Para desinstalar veo que hay un archivo de desinstalación:

cuando hay esos archivos para desinstalar el programa se pone así:

sudo make uninstall

eso en caso de que luego lo quieran desinstalar.


2. **Carga en Ardour**: Abre Ardour y crea una pista MIDI. Luego, en la sección de plugins, busca SFizz (LV2 o VST3) e insértalo en la pista. A partir de ahí, podrás cargar archivos SFZ en el plugin para reproducir instrumentos virtuales.

3. **Instrumentos SFZ**: Existen varios instrumentos gratuitos y comerciales en formato SFZ que puedes utilizar. Puedes encontrarlos en sitios como https://sfzinstruments.github.io o http://freepats.zenvoid.org

El siguiente piano suena muy bonito:

https://github.com/sfzinstruments/SalamanderGrandPiano

SFizz es un sintetizador poderoso y versátil que te permite usar instrumentos en formato SFZ dentro de Ardour.

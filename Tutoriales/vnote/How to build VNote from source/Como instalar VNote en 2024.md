
git clone https://github.com/vnotex/vnote.git vnote.git
cd vnote.git
git submodule update --init --recursive


# Cómo instalar VNote 3.17.0 en Linux 

El archivo .pro que es neceario ya no está en la versión más reciente, pero en la anterior si está

Descarga esta versión v3.17.0:

https://github.com/vnotex/vnote/releases/tag/v3.17.0

descarga:

https://github.com/vnotex/vnote/archive/refs/tags/v3.17.0.tar.gz

ejemplo yo en:

/home/wachin/Dev/vnote_releases/

y me queda:

/home/wachin/Dev/vnote_releases/vnote-3.17.0.tar.gz

ese archivo lo descomprimo con clic derecho, y entro en esa carpeta:

/home/wachin/Dev/vnote_releases/vnote-3.17.0/

allí aplasto Ctrl + H para ver los archivos ocultos y está el archvo:

/home/wachin/Dev/vnote_releases/vnote-3.17.0/.gitmodules

lo abro y contiene:

```
[submodule "libs/vtextedit"]
	path = libs/vtextedit
	url = https://github.com/vnotex/vtextedit.git
[submodule "libs/QHotkey"]
	path = libs/QHotkey
	url = https://github.com/vnotex/QHotkey.git
```

copio esa linea:

https://github.com/vnotex/vtextedit.git

y veo el codigo pero no hay el archivo .pro

pero hay personas que han hecho forks, y me ayudo con mi entrada en:

Cómo saber qué Fork en GitHub esta en desarrollo y es el más activo
https://facilitarelsoftwarelibre.blogspot.com/2021/04/como-saber-que-fork-en-github-esta-en-desarrollo.html

para ver si alguien no haya sincronizado muy actualmente el fork y buscando entre ellos encuentro el siguiente que si contiene el archivo .pro:

https://github.com/windwing2016/vtextedit

Nota: He hecho un fork: https://github.com/wachin/vtextedit para retener su contenido.

de este descargar su contendido y pegarlo en:

/home/wachin/Dev/vnote_releases/vnote-3.17.0/libs/vtextedit/

una vez descargado este ver los archivos ocultos Ctrl + H y dentro veras el archivo:

/home/wachin/Dev/vnote_releases/vnote-3.17.0/libs/vtextedit/.gitmodules

que contiene:

```
[submodule "src/libs/syntax-highlighting"]
	path = libs/syntax-highlighting
	url = https://github.com/vnotex/syntax-highlighting.git
[submodule "src/libs/hunspell"]
	path = libs/hunspell
	url = https://github.com/vnotex/hunspell.git
[submodule "src/libs/sonnet"]
	path = libs/sonnet
	url = https://github.com/vnotex/sonnet.git
```

reviso:

https://github.com/vnotex/syntax-highlighting.git

y no hay el archivo .pro hay que buscar un fork que tenga, encuentro uno:

https://github.com/plopop/syntax-highlighting

pongo su contenido en:

/home/wachin/Dev/vnote_releases/vnote-3.17.0/libs/vtextedit/src/libs/syntax-highlighting/


reviso:

https://github.com/vnotex/hunspell.git

y no hay el archivo .pro hay que buscar un fork que tenga pero nadie hizo ningún fork, entonces yo creo uno:

https://github.com/wachin/hunspell

y lo clono:

```
git clone https://github.com/wachin/hunspell
```

ahora, reviso los commit de:

https://github.com/vnotex/hunspell.git

allí dar clic debajo del botón verde **"<>Code"** en **"Commmits"**

https://github.com/vnotex/hunspell/commits/master/

y allí está la lista completa

allí doy clic en:

**remove install**
**tamlok committed 4 months ago**

lo abro en una pestaña aparte:

https://github.com/vnotex/hunspell/commit/9f9e2eca369d3b5bc254d8804c8dac2914ec6e16

allí dice:

**CMakeLists.txt**

```
    target_link_libraries(Hunspell PUBLIC
        Qt::Core
    )
57 -
58 - install (TARGETS Hunspell
59 -    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
60 -    FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
61 -    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
62 - )
```

lo que eso significa es que fueron borradas las siguientes lineas:

```

install(TARGETS Hunspell
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
```

entonces esas seis (contando el Enter) líneas se las añado al archivo:

**CMakeLists.txt**

en el lugar correspondiente lo cual lo sé al buscar la línea: "target_link_libraries(Hunspell PUBLIC" y guardo.


Luego en:

qmake to cmake
https://github.com/vnotex/hunspell/commit/9f886c37b9285baec444913303926e1c9b61c8a1#diff-77b0f1f54c3c1175c559a20d67cb5fefeb0899832afa3d10ba0239a7de70b502

allí está el archivo faltante:

hunspell.pro

copio todo el contenido del commit:

```
TARGET = Hunspell

QT -= gui

TEMPLATE = lib

CONFIG += staticlib
CONFIG += warn_off

win32 {
    DEFINES += BUILDING_LIBHUNSPELL
}

INCLUDEPATH *= $$PWD/src/hunspell
INCLUDEPATH *= $$PWD/src/parsers

HEADERS += \
    $$PWD/src/hunspell/affentry.hxx \
    $$PWD/src/hunspell/affixmgr.hxx \
    $$PWD/src/hunspell/atypes.hxx \
    $$PWD/src/hunspell/baseaffix.hxx \
    $$PWD/src/hunspell/csutil.hxx \
    $$PWD/src/hunspell/filemgr.hxx \
    $$PWD/src/hunspell/hashmgr.hxx \
    $$PWD/src/hunspell/htypes.hxx \
    $$PWD/src/hunspell/hunspell.h \
    $$PWD/src/hunspell/hunspell.hxx \
    $$PWD/src/hunspell/hunvisapi.h \
    $$PWD/src/hunspell/hunvisapi.h.in \
    $$PWD/src/hunspell/hunzip.hxx \
    $$PWD/src/hunspell/langnum.hxx \
    $$PWD/src/hunspell/phonet.hxx \
    $$PWD/src/hunspell/replist.hxx \
    $$PWD/src/hunspell/suggestmgr.hxx \
    $$PWD/src/hunspell/utf_info.hxx \
    $$PWD/src/hunspell/w_char.hxx \
    $$PWD/src/parsers/firstparser.hxx \
    $$PWD/src/parsers/htmlparser.hxx \
    $$PWD/src/parsers/latexparser.hxx \
    $$PWD/src/parsers/manparser.hxx \
    $$PWD/src/parsers/odfparser.hxx \
    $$PWD/src/parsers/textparser.hxx \
    $$PWD/src/parsers/xmlparser.hxx

SOURCES += \
    $$PWD/src/hunspell/affentry.cxx \
    $$PWD/src/hunspell/affixmgr.cxx \
    $$PWD/src/hunspell/csutil.cxx \
    $$PWD/src/hunspell/filemgr.cxx \
    $$PWD/src/hunspell/hashmgr.cxx \
    $$PWD/src/hunspell/hunspell.cxx \
    $$PWD/src/hunspell/hunzip.cxx \
    $$PWD/src/hunspell/phonet.cxx \
    $$PWD/src/hunspell/replist.cxx \
    $$PWD/src/hunspell/suggestmgr.cxx \
    $$PWD/src/parsers/firstparser.cxx \
    $$PWD/src/parsers/htmlparser.cxx \
    $$PWD/src/parsers/latexparser.cxx \
    $$PWD/src/parsers/manparser.cxx \
    $$PWD/src/parsers/odfparser.cxx \
    $$PWD/src/parsers/testparser.cxx \
    $$PWD/src/parsers/textparser.cxx \
    $$PWD/src/parsers/xmlparser.cxx
```

y en el Fork que he hecho que lo guaré en:

/home/wachin/Dev-forks-wachìn/hunspell/

creo el archivo:

hunspell.pro

y le añado ese contenido, lo guardo y cierro

además allí hay otro archivo:

hunspell_export.pri

y

hunspell_export_lib.pri

hago el mismo procedimiento, creo el archivo en mi fork y copio el contenido y se lo pego y guardo.

## Sonnet

https://github.com/vnotex/sonnet



y no hay el archivo .pro hay que buscar un fork que tenga, encuentro uno:

https://github.com/hoenking/QHotkey

Nota: He creado un fork: https://github.com/wachin/QHotkey para retener su contenido


https://facilitarelsoftwarelibre.blogspot.com/2022/07/vnote-for-mx-linux-deb-package.html

mkdir build
cd build
qmake ../vnote.pro
make
sudo make install



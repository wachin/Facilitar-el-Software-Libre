

sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake \
     qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools \
     qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools \
     libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev \
     libqt5location5 qtlocation5-dev
     
- - - - - - 	
	
   ```
   wget -c https://github.com/vnotex/vnote/archive/refs/tags/v3.17.0.tar.gz
   tar -xzvf v3.17.0.tar.gz
   cd vnote-3.17.0
   ``` 

Ahora necesitamos copiar los archivos de los submódulos:

# vnote-fork /libs
https://github.com/wachin/vnote-fork/tree/master/libs

## QHotkey @ 18ac011
https://github.com/vnotex/QHotkey/tree/18ac011008d3ae55abc19233ba94fad1ea9801d8

<>Code > Download ZIP
https://github.com/vnotex/QHotkey/archive/18ac011008d3ae55abc19233ba94fad1ea9801d8.zip

## vtextedit @ b512b51
https://github.com/vnotex/vtextedit/tree/b512b5126fe0898a29280204f2959e2dbeb67660

<>Code > Download ZIP
https://github.com/vnotex/vtextedit/archive/b512b5126fe0898a29280204f2959e2dbeb67660.zip

### vtextedit src/libs
https://github.com/vnotex/vtextedit/tree/b512b5126fe0898a29280204f2959e2dbeb67660/src/libs

#### hunspell @ efb0389
https://github.com/vnotex/hunspell/tree/efb0389dbd3cb4c9634e1df73bacb5a290dd9311

<>Code > Download ZIP
https://github.com/vnotex/hunspell/archive/efb0389dbd3cb4c9634e1df73bacb5a290dd9311.zip

#### sonnet @ 57e5adb
https://github.com/vnotex/sonnet/tree/57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d

<>Code > Download ZIP
https://github.com/vnotex/sonnet/archive/57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d.zip

#### syntax-highlighting @ 0428996
https://github.com/vnotex/syntax-highlighting/tree/04289967286edc44e29f0bde4d1e1cb7b94c3434

<>Code > Download ZIP
https://github.com/vnotex/syntax-highlighting/archive/04289967286edc44e29f0bde4d1e1cb7b94c3434.zip


de la siguiente manera:

```
	cd libs/QHotkey
	wget -c https://github.com/vnotex/QHotkey/archive/18ac011008d3ae55abc19233ba94fad1ea9801d8.zip
	mkdir temp_dir
	unzip 18ac011008d3ae55abc19233ba94fad1ea9801d8.zip -d temp_dir
	mv temp_dir/QHotkey-18ac011008d3ae55abc19233ba94fad1ea9801d8/* .
	rm -fr temp_dir
	rm 18ac011008d3ae55abc19233ba94fad1ea9801d8.zip
	cd ../vtextedit
	wget -c https://github.com/vnotex/vtextedit/archive/b512b5126fe0898a29280204f2959e2dbeb67660.zip
	mkdir temp_dir
	unzip b512b5126fe0898a29280204f2959e2dbeb67660.zip -d temp_dir
	mv temp_dir/vtextedit-b512b5126fe0898a29280204f2959e2dbeb67660/* .
	rm -fr temp_dir
	rm b512b5126fe0898a29280204f2959e2dbeb67660.zip
	cd src/libs/hunspell
	wget -c https://github.com/vnotex/hunspell/archive/efb0389dbd3cb4c9634e1df73bacb5a290dd9311.zip
	mkdir temp_dir
	unzip efb0389dbd3cb4c9634e1df73bacb5a290dd9311.zip -d temp_dir
	mv temp_dir/hunspell-efb0389dbd3cb4c9634e1df73bacb5a290dd9311/* .
	rm -fr temp_dir
	rm efb0389dbd3cb4c9634e1df73bacb5a290dd9311.zip
	cd ../sonnet
	wget -c https://github.com/vnotex/sonnet/archive/57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d.zip
	mkdir temp_dir
	unzip 57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d.zip -d temp_dir
	mv temp_dir/sonnet-57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d/* .
	rm -fr temp_dir
	rm 57e5adb5dd375c7fd1acfabfd1d87b5ba5547b0d.zip
	cd ../syntax-highlighting
	wget -c https://github.com/vnotex/syntax-highlighting/archive/04289967286edc44e29f0bde4d1e1cb7b94c3434.zip
	mkdir temp_dir
	unzip 04289967286edc44e29f0bde4d1e1cb7b94c3434.zip -d temp_dir
	mv temp_dir/syntax-highlighting-04289967286edc44e29f0bde4d1e1cb7b94c3434/* .
	rm -fr temp_dir
	rm 04289967286edc44e29f0bde4d1e1cb7b94c3434.zip
	cd ../../../../../
```

y ahora si compilar:


```
mkdir build && cd build
qmake ../vnote.pro
make

```

Luego si se desea instalar:

```
sudo make install
```


# Creacion del deb

El archivo rules:

file:///home/wachin/Dev/vnote-wachi/vnote-3.15.1/debian/rules

debe contener:

```
#!/usr/bin/make -f

# Habilita verbose para ver los comandos que modifican archivos en el sistema de compilación
export DH_VERBOSE = 1

# Configura QMake
override_dh_auto_configure:
	qmake PREFIX=/usr

# Compila el proyecto
override_dh_auto_build:
	dh_auto_build -- qmake && make

# Realiza las pruebas usando target_wrapper.sh para definir el LD_LIBRARY_PATH
override_dh_auto_test:
	dh_auto_test

# Instala el ejecutable y los archivos necesarios
override_dh_auto_install:
	# Instalamos el binario en /usr/bin
	install -d $(DESTDIR)/usr/bin
	install -m 755 build/vnote $(DESTDIR)/usr/bin/vnote

	# Copiamos los archivos necesarios a /usr/share/vnote/
	install -d $(DESTDIR)/usr/share/vnote
	cp -r pics $(DESTDIR)/usr/share/vnote/
	cp -r package $(DESTDIR)/usr/share/vnote/

%:
	dh $@

```

ruta correcta:
file:///home/wachin/Dev/vnote-wachi/vnote-3.15.1/tests/test_utils/target_wrapper.sh

la siguietne ruta no es correcta:
file:///home/wachin/Dev/vnote-wachi/vnote-3.15.1/build/tests/test_utils/target_wrapper.sh


To adjust the `target_wrapper.sh` script so that it uses your custom paths during testing (without hardcoding system-specific paths), you'll want to modify the `LD_LIBRARY_PATH` to point to the location where `libVTextEdit.so` is located during the build process. Based on the paths you've shared earlier, it seems that the library is located under the build directory.

You can modify the script like this:

```sh
#!/bin/sh

# Add your build directory to LD_LIBRARY_PATH for the tests
LD_LIBRARY_PATH=$(pwd)/../../libs/vtextedit/src/editor${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

# Use the default QT_PLUGIN_PATH unless explicitly set
QT_PLUGIN_PATH=/usr/lib/i386-linux-gnu/qt5/plugins${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
export QT_PLUGIN_PATH

# Execute the test
exec "$@"
```

### Explanation:
1. `LD_LIBRARY_PATH=$(pwd)/../../libs/vtextedit/src/editor` dynamically points to the directory where `libVTextEdit.so` resides. `$(pwd)` ensures the path is relative to the current directory when the tests are executed.
2. The rest of the script remains unchanged. It exports the appropriate paths and executes the command.

This modification allows the script to use the correct path for `libVTextEdit.so` during the test phase, without hardcoding a system-specific path. This will help ensure that the tests can be run successfully in different environments.



Para verificar que esté correctamente apuntando:

pwd /../../libs/vtextedit/src/editor

esto en "/vnote-3.15.1/build/tests/test_utils":

```
wachin@netinst:~/Dev/vnote-wachi/vnote-3.15.1/build/tests/test_utils
$ pwd /../../libs/vtextedit/src/editor
/home/wachin/Dev/vnote-wachi/vnote-3.15.1/build/tests/test_utils
```
eso significa que está correcto


y allí mismo inmediatamente para crear el deb:

```
cd ..
```
y allí si:
```
dpkg-buildpackage -uc -b
```

### make clean
Es necesario para cada prueba y error siempre hacer:

```
make clean
```

para que se limpien los archivos

# Reducir tiempo test rules
Entiendo tu preocupación sobre el tiempo que puede tomar el proceso completo. Efectivamente, hay formas de hacer pruebas preliminares para verificar si la configuración básica para crear el paquete deb es correcta, sin tener que compilar todo el proyecto. Aquí te propongo algunos pasos para hacer un test rápido:

1. Primero, asegúrate de que tienes la estructura básica del paquete Debian:

   ```
   dh_make --createorig -p vnote_3.15.1
   ```

2. Edita el archivo `debian/rules` como te mencioné antes:

   ```makefile
   override_dh_auto_configure:
       qmake

   override_dh_auto_build:
       make

   override_dh_auto_install:
       make INSTALL_ROOT=$(CURDIR)/debian/vnote install
   ```

3. Crea un archivo `debian/vnote.install` si no existe, y agrega las rutas de los archivos que se instalarán. Por ejemplo:

   ```
   usr/bin/vnote
   usr/share/applications/vnote.desktop
   usr/share/icons/hicolor/*/apps/vnote.png
   ```

4. Ejecuta una construcción en seco (dry-run) del paquete:

   ```
   dpkg-buildpackage -us -uc -nc -d
   ```

   Esto simulará la construcción del paquete sin realmente compilar el código. El flag `-nc` evita limpiar los archivos de construcción existentes, y `-d` ignora las dependencias de construcción.

5. Verifica la salida en busca de errores obvios en la configuración.

6. Si quieres probar solo el empaquetado sin la compilación, puedes usar:

   ```
   fakeroot debian/rules binary
   ```

   Esto intentará crear el paquete deb sin compilar el código. Puede fallar en algunos pasos, pero te dará una idea de si la configuración básica es correcta.

7. Para una verificación más completa pero aún rápida, puedes intentar construir solo una parte pequeña del proyecto. Modifica temporalmente el `Makefile` en el directorio raíz para que solo compile un subconjunto pequeño de archivos, y luego ejecuta:

   ```
   dpkg-buildpackage -us -uc -b
   ```

Estos pasos te darán una indicación rápida de si la configuración básica para crear el paquete deb es correcta, sin tener que esperar a que se compile todo el proyecto. Si estos pasos funcionan sin errores graves, es una buena señal de que la configuración completa probablemente funcionará.

Recuerda restaurar cualquier cambio temporal que hayas hecho en los archivos de construcción antes de intentar la construcción completa del paquete.



Creando paquete deb del editor de Markdown "VNote" en MX Linux 21 al estilo Alien (este método podría servir para crear el deb desde cualquier programa Qt si no tiene el archivo rules ni install_manifest.txt )
https://facilitarelsoftwarelibre.blogspot.com/2022/11/creando-paquete-deb-de-vnote-en-mx-linux-21.html

make clean
make
make check



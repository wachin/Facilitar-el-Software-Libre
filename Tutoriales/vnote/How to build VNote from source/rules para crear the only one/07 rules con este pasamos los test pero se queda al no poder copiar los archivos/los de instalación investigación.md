parece que el archivo binario de `vnote` fue instalado correctamente en `/usr/bin/vnote` durante el proceso de instalación manual. La línea clave en el registro es esta:

```bash
/usr/lib/qt5/bin/qmake -install qinstall -exe vnote /usr/bin/vnote
```

Sin embargo, en mi archivo `rules`, está este comando:
```makefile
install -m 755 build/vnote /usr/bin/vnote
```
Este comando busca el binario en `build/vnote`, pero no se encuentra allí. Según el registro, el binario parece estar en el directorio `build/src/` en el lugar de compilación lo cual lo verifico y así es:

file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/src/vnote

### Solución:
Cambiar la ruta del binario en el archivo `rules` para que apunte a la ubicación correcta, `build/src/vnote`, como se generó durante la compilación.

Modificando `rules` así:

```makefile
# Instalamos el binario en /usr/bin
install -d $(DESTDIR)/usr/bin
install -m 755 build/src/vnote $(DESTDIR)/usr/bin/vnote
```

Con esto se cambia `build/vnote` a `build/src/vnote`, que es donde se genera según el log de instalación. Y en la instalación install: `/usr/bin` esto asegura que el binario se copie correctamente al directorio de destino.

## Comparación
A modo de comparación, el paquete deb de la versión 3.15.1 (una versión compilada por mi) lo he descomprimido para ver cuales son los archivos que instala y son estos:

wachin@netinst:~/Dev/vnote-github-release/vnote_3.15.1_i386-tree
$ tree
.
└── usr
    ├── bin
    │   ├── vnote
    │   └── vnote_extra.rcc
    ├── lib
    │   ├── libVSyntaxHighlighting.so -> libVSyntaxHighlighting.so.1.0.0
    │   ├── libVSyntaxHighlighting.so.1 -> libVSyntaxHighlighting.so.1.0.0
    │   ├── libVSyntaxHighlighting.so.1.0 -> libVSyntaxHighlighting.so.1.0.0
    │   ├── libVSyntaxHighlighting.so.1.0.0
    │   ├── libVTextEdit.so -> libVTextEdit.so.1.0.0
    │   ├── libVTextEdit.so.1 -> libVTextEdit.so.1.0.0
    │   ├── libVTextEdit.so.1.0 -> libVTextEdit.so.1.0.0
    │   └── libVTextEdit.so.1.0.0
    └── share
        ├── applications
        │   └── vnote.desktop
        ├── doc
        │   └── vnote
        │       ├── changelog.gz
        │       └── copyright
        └── icons
            └── hicolor
                ├── 128x128
                │   └── apps
                │       └── vnote.png
                ├── 16x16
                │   └── apps
                │       └── vnote.png
                ├── 256x256
                │   └── apps
                │       └── vnote.png
                ├── 32x32
                │   └── apps
                │       └── vnote.png
                ├── 48x48
                │   └── apps
                │       └── vnote.png
                ├── 64x64
                │   └── apps
                │       └── vnote.png
                └── scalable
                    └── apps
                        └── vnote.svg

24 directories, 20 files



debo asegurarme que en rules se instalarán todos así mismo para esta versión 3.17.0, pues veo también los siguientes archivos:

file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/vnote_extra.rcc
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/vnote.desktop
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/16x16/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/32x32/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/48x48/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/64x64/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/128x128/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/256x256/vnote.png
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/src/data/core/logo/vnote.svg

file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1.0
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1.0.0


file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1.0
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1.0.0

file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/editor/libVTextEdit.so
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/editor/libVTextEdit.so.1
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/editor/libVTextEdit.so.1.0
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/libs/vtextedit/src/editor/libVTextEdit.so.1.0.0

file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/editor/libVTextEdit.so
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/editor/libVTextEdit.so.1
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/editor/libVTextEdit.so.1.0
file:///home/wachin/Dev/vnote-build-releases/vnote-3.17.0/build/libs/vtextedit/src/editor/libVTextEdit.so.1.0.0


Para asegurarnos de que el archivo `rules` de la versión 3.17.0 de **VNote** instale los mismos archivos que la versión 3.15.1 (y algunos archivos adicionales en esta nueva versión), ajustar las rutas de instalación en `rules` para incluir:

1. **El binario principal `vnote` y el archivo `vnote_extra.rcc`.**
2. **Las bibliotecas compartidas** (`libVTextEdit.so` y `libVSyntaxHighlighting.so`) y sus enlaces simbólicos.
3. **El archivo `.desktop` y los iconos para los menús del sistema.**

### Ajuste del archivo `rules`

Archivo `rules` modificado para asegurarse de que todos los archivos se instalen correctamente, incluyendo las bibliotecas y los iconos:

```makefile
#!/usr/bin/make -f

# Habilita verbose para ver los comandos que modifican archivos en el sistema de compilación
export DH_VERBOSE = 1

# Configura QMake
override_dh_auto_configure:
	qmake PREFIX=/usr

# Compila el proyecto
override_dh_auto_build:
	dh_auto_build -- qmake && make

# Instala el ejecutable y los archivos necesarios
override_dh_auto_install:
	# Instalamos el binario principal en /usr/bin
	install -d $(DESTDIR)/usr/bin
	install -m 755 build/src/vnote $(DESTDIR)/usr/bin/vnote
	install -m 755 build/src/vnote_extra.rcc $(DESTDIR)/usr/bin/vnote_extra.rcc

	# Instalamos las bibliotecas en /usr/lib
	install -d $(DESTDIR)/usr/lib
	install -m 755 build/libs/vtextedit/src/editor/libVTextEdit.so.1.0.0 $(DESTDIR)/usr/lib/libVTextEdit.so.1.0.0
	ln -sf libVTextEdit.so.1.0.0 $(DESTDIR)/usr/lib/libVTextEdit.so
	ln -sf libVTextEdit.so.1.0.0 $(DESTDIR)/usr/lib/libVTextEdit.so.1
	ln -sf libVTextEdit.so.1.0.0 $(DESTDIR)/usr/lib/libVTextEdit.so.1.0

	install -m 755 build/libs/vtextedit/src/libs/syntax-highlighting/libVSyntaxHighlighting.so.1.0.0 $(DESTDIR)/usr/lib/libVSyntaxHighlighting.so.1.0.0
	ln -sf libVSyntaxHighlighting.so.1.0.0 $(DESTDIR)/usr/lib/libVSyntaxHighlighting.so
	ln -sf libVSyntaxHighlighting.so.1.0.0 $(DESTDIR)/usr/lib/libVSyntaxHighlighting.so.1
	ln -sf libVSyntaxHighlighting.so.1.0.0 $(DESTDIR)/usr/lib/libVSyntaxHighlighting.so.1.0

	# Instalamos los iconos y el archivo .desktop en /usr/share
	install -d $(DESTDIR)/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
	install -m 644 src/data/core/logo/16x16/vnote.png $(DESTDIR)/usr/share/icons/hicolor/16x16/apps/vnote.png
	install -m 644 src/data/core/logo/32x32/vnote.png $(DESTDIR)/usr/share/icons/hicolor/32x32/apps/vnote.png
	install -m 644 src/data/core/logo/48x48/vnote.png $(DESTDIR)/usr/share/icons/hicolor/48x48/apps/vnote.png
	install -m 644 src/data/core/logo/64x64/vnote.png $(DESTDIR)/usr/share/icons/hicolor/64x64/apps/vnote.png
	install -m 644 src/data/core/logo/128x128/vnote.png $(DESTDIR)/usr/share/icons/hicolor/128x128/apps/vnote.png
	install -m 644 src/data/core/logo/256x256/vnote.png $(DESTDIR)/usr/share/icons/hicolor/256x256/apps/vnote.png
	install -d $(DESTDIR)/usr/share/icons/hicolor/scalable/apps
	install -m 644 src/data/core/logo/vnote.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/vnote.svg

	# Instalamos el archivo .desktop
	install -d $(DESTDIR)/usr/share/applications
	install -m 644 src/data/core/vnote.desktop $(DESTDIR)/usr/share/applications/vnote.desktop

%:
	dh $@
```

### Explicación:
1. **Binarios**: Se instalan en `/usr/bin`.
2. **Bibliotecas compartidas**: Las bibliotecas (`libVTextEdit.so` y `libVSyntaxHighlighting.so`) se instalan en `/usr/lib`, incluyendo sus enlaces simbólicos.
3. **Iconos**: Se instalan en los directorios correspondientes de `/usr/share/icons/hicolor/`.
4. **Archivo `.desktop`**: Se instala en `/usr/share/applications/` para que VNote esté disponible en el menú de aplicaciones del sistema.

Con esta configuración del archivo `rules`, todos los archivos necesarios se instalarán en las mismas rutas que en la versión 3.15.1, y además, se añadirán los archivos específicos de la versión 3.17.0. 

## Error pass

Haciendo estos cambios a rules y compilandolo:

```
dpkg-buildpackage -uc -b
```

aparece este error: 

```
"PASS   : tests::TestNotebook::testNotebookDatabase()
PASS   : tests::TestNotebook::cleanupTestCase()
Totals: 3 passed, 0 failed, 0 skipped, 0 blacklisted, 1119ms
********* Finished testing of tests::TestNotebook *********
make[4]: se sale del directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0/tests/test_core/test_notebook'
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0/tests/test_core'
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0/tests'
make[1]: se sale del directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0'
        rm -fr -- /tmp/dh-xdg-rundir-NiTg02Vy
   create-stamp debian/debhelper-build-stamp
   dh_prep
        rm -f -- debian/vnote.substvars
        rm -fr -- debian/.debhelper/generated/vnote/ debian/vnote/ debian/tmp/
        rm -f debian/vnote.debhelper.log
   debian/rules override_dh_auto_install
make[1]: se entra en el directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0'
# Instalamos el binario principal en /usr/bin
install -d /usr/bin
install -m 755 build/src/vnote /usr/bin/vnote
install: no se puede borrar '/usr/bin/vnote': Permiso denegado
make[1]: *** [debian/rules:18: override_dh_auto_install] Error 1
make[1]: se sale del directorio '/home/wachin/Dev/vnote-build-releases/vnote-3.17.0'
make: *** [debian/rules:49: binary] Error 2
dpkg-buildpackage: fallo: debian/rules binary subprocess returned exit status 2"
```


El error se refiere a que el archivo binario `vnote` no se encuentra en la ruta `build/vnote` al momento de intentar instalarlo. Esto indica que, durante la compilación, el binario no se creó en esa ubicación esperada, es necesario revisar en qué carpeta se está generando el archivo binario de `vnote` después de la compilación. El error sugiere que el archivo no está en la ruta `build/vnote`. Puede que se esté generando en otro directorio.

Se puede buscar:

vnote

en Dolphin

Una encontrada la ubicación correcta del binario, ajustar la línea en el archivo `rules` donde se especifica la instalación del binario, si el binario se encuentra en una ruta diferente, como `build-release/bin/vnote`, cambiarla a la línea correspondiente:

 ```make
   install -m 755 build/vnote /usr/bin/vnote
 ```
   a:
   
   ```make
   install -m 755 build-release/bin/vnote /usr/bin/vnote
   ```


**Limpieza del directorio**: 
es recomendable limpiar el directorio de compilación para evitar conflictos si se ejecutado varias veces qmake y make hacerlo con:
   
   ```bash
   make clean
   ```

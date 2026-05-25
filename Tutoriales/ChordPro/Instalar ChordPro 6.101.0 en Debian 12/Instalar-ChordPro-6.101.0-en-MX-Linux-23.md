

## Instalando ChordPro 6.101.0 en MX Linux 23 (base Debian 12), cómo usar la GUI y línea de comandos 

ChordPro es un formato de notación diseñado para facilitar la escritura, lectura y distribución de canciones, especialmente las que incluyen acordes para guitarra u otros instrumentos. Fue desarrollado en la década de 1990 y se utiliza ampliamente por músicos y entusiastas para compartir canciones de una manera estandarizada y fácil de entender.

### **Requisitos previos**

Sistema actualizado MX Linux 23 (base Debian 12) de 64 bit o 32 bit:

```bash
sudo apt update && sudo apt upgrade -y
```

### **Paso 1: Instalar dependencias esenciales**

Según la página web para compilar para Linux

**Installation on Linux**  
[https://www.chordpro.org/chordpro/chordpro-install-on-linux/](https://www.chordpro.org/chordpro/chordpro-install-on-linux/)

Instalaremos la mayoría de los que allí están en la lista. Ejecute estos comandos para instalar compiladores y librerías necesarias:

```bash
sudo apt install build-essential cpanminus libssl-dev zlib1g-dev \
        libwx-perl libwxgtk3.2-dev libharfbuzz-dev libpango1.0-dev \
        libobject-pad-perl libpdf-api2-perl libimage-info-perl \
        libjson-pp-perl libjson-xs-perl libfile-homedir-perl \
        libdata-printer-perl libref-util-perl libref-util-xs-perl \
        libclass-std-storable-perl libpod-simple-perl \
        libpod-parser-perl libpod-pom-perl libpod-coverage-perl
       
```
  
De la lista de la pagina web en Debian 12 no hay los paquetes:

libstorable-perl 
libpod-usage-perl

pero con los que instalé funciona

---

### **Paso 2: Instalar módulos Perl requeridos**
Instala los módulos Perl críticos (incluyendo `Wx` para la GUI):

```bash
sudo cpanm Wx Wx::Perl::Packager Data::Printer File::LoadLines HarfBuzz::Shaper \
           JavaScript::QuickJS LWP::Protocol::https Mozilla::CA Pod::Usage \
           Scalar::Util String::Interpolate::Named Text::Layout \
           File::HomeDir Image::Info
```

### **Paso 4: Para Debian 12 de 32 bit tuve que hacer estos pasos:**

#### Instalar manualmente JavaScript::QuickJS

En Debian 12 no está disponible el paquete ` libjavascript-quickjs-perl` pero se lo puede instalar manualmente

Si desean hagan lo siguiente dentro de una carpeta para este propósito:

```bash
wget http://www.cpan.org/authors/id/F/FE/FELIPE/JavaScript-QuickJS-0.21.tar.gz
tar -xzvf JavaScript-QuickJS-0.21.tar.gz
```

este paquete "JavaScript-QuickJS-x.xx.tar.gz" si desean lo pueden subir a virustotal.com debido a los ultimos ataques sabidos "[Internet Estaba A Semanas Del Desastre y Nadie Lo Sabía](https://youtu.be/a62HpQpVBh8?si=C8HGbGIVzLK24Nod)", "[¡GITHUB HACKEADO!](https://youtu.be/NapghLlS2I0?si=aNdr_b-3dSSNm4zE)" (lo revisé, está limpio)

luego entro en la versión que descargué:

```bash
cd JavaScript-QuickJS-0.21
```

**Nota:** Cambiar la ruta en caso de usar otra versión.

Configurar y compilar manualmente

```bash
perl Makefile.PL
```

si sale el siguiente mensaje no es un error:

```bash
Checking if your kit is complete...
Looks good
Warning: prerequisite Test::Deep 0 not found.
Warning: prerequisite Test::FailWarnings 0 not found.
Warning: prerequisite Test::Fatal 0 not found.
Generating a Unix-style Makefile
Writing Makefile for JavaScript::QuickJS
Writing MYMETA.yml and MYMETA.json
```

sino advertencias sobre dependencias opcionales de pruebas (Test::Deep, Test::FailWarnings, Test::Fatal). El proceso de configuración (Makefile.PL) se completó correctamente y generó los archivos necesarios para la compilación, continuar nomás 

```bash
make && sudo make install
```

Verificar que los módulos estén instalados, pon en la terminal:

```bash
perl -MJavaScript::QuickJS -e 'print "Módulo instalado\n"'
```

si se instaló, dirá:

```bash
Módulo instalado
```

cierre esta instancia de la terminal

---

#### Instalar manualmente libquickjs-dev desde código fuente

**En Debian 12 `libquickjs-dev` no está disponible , instalarlo desde código fuente**:  

pero si antes deseas revisarlo, entra en:

[https://github.com/bellard/quickjs](https://github.com/bellard/quickjs)

y descarga el código fuente en el botón verde:

<>Code

y subelo a [https://www.virustotal.com/](https://www.virustotal.com/)

luego si poner (ponga esto en una carpeta para este fin):
   
```bash
# Instalar QuickJS desde el repositorio oficial
git clone https://github.com/bellard/quickjs.git
cd quickjs
make && sudo make install
```

y quedará instalado (cierre esta instancia de la terminal)

---

### **Paso 5: Descargar y compilar ChordPro**

**1.-** Descarga la versión del código fuente desde GitHub de "App-Music-ChordPro-6.070.7.tar.gz" (en una carpeta para tal propósito):

[https://github.com/ChordPro/chordpro/releases/R6.101.0/](https://github.com/ChordPro/chordpro/releases/R6.101.0/)

descargue el paquete en una carpeta para tal propósito :

App-Music-ChordPro-6.101.0.tar.gz

Súbalo a virustotal
    
**2.-** Entrar en la carpeta descomprimida desde una terminal

**3.-** Genera el `Makefile` y compila:

```bash
perl Makefile.PL
make
```

**4.-** Instala en el sistema:

```bash
sudo make install
```  

y quedaron instalados:  
 
```
chordpro
wxchordpro
```

dos programas

---

### **Paso 6: Verificar la instalación**

#### **Para la versión CLI** (línea de comandos):

```bash
chordpro --version
```
 
Debe mostrar:

```bash
chordpro --version
Non-constant field initialiser expression is experimental and may be changed or removed without notice at /usr/local/share/perl/5.36.0/ChordPro/Chords/Transpose.pm line 19.
This is ChordPro core 6.101.0
```
  
Para la ayuda:

```bash
chordpro --help
```

y allí ver con qué comandos de terminal usarlo

--

#### **Para la GUI (Interfaz Gráfica de Usuario)**:

```bash
wxchordpro
```

 ¡La interfaz gráfica debería abrirse correctamente!
 

![](https://blogger.googleusercontent.com/img/a/AVvXsEgb4Pbi5M0lx8OdU3BszmVcOG4T7gdbJBSnMKnUwEgknVQf4hZ29W-VTJAS3ec53V0xC_nRDCXX97S6VtZ-q131QJSDz2GAPMGMXr8he6rzWoWHuRX4X-6VGquriH2Mv2T0qUMrm-ZJIrzJG0x9qde1k29UnSRT0WvwKUf43xDlbu5yhJbVz_ZdUjUD4Yc=s16000)

en `Help` y `About Chordpro` puedes ver la versión del programa

---

### **Paso 7: Acceso directo (opcional)**

Si quieres un lanzador en el menú de aplicaciones, para este proceso te recomiendo Gedit, sino lo tienes instálalo:

**1.-** Crea un archivo `.desktop`:

```bash
sudo gedit /usr/share/applications/wxchordpro.desktop
```
    
**2.-** Pega este contenido:

```
[Desktop Entry]
Name=wxChordPro
Comment=ChordPro GUI Editor
Exec=wxchordpro
Icon=music
Terminal=false
Type=Application
Categories=Audio;Music;
```

guarda y cierra
    
**3.-** Actualiza el menú, opcional, pues lo mas seguro es que ya está allí:

```bash
sudo update-desktop-database
```

---

### Cómo construir el deb

Necesitamos tener instalado:

```bash
sudo apt install dh-make-perl libtest-more-utf8-perl libtemplate-perl libjson-relaxed-perl
```

Debian 12 trae versiones antiguas en sus repositorios, así que necesitas actualizarlas desde CPAN.

Instálalos así:

```bash
sudo cpanm PDF::API2
sudo cpanm Object::Pad
sudo cpanm JSON::Relaxed::Parser
```

luego tener una carpeta creada para que se cree allí dentro el deb, no es necesario estar en ninguna carpeta específica pues se descargará todo lo necesario, luego allí poner:

```bash
dh-make-perl --build --cpan App::Music::ChordPro
```

y si es que pide, escribir:

yes

y luego:

sudo

y se creará el archivo .deb 


## deb creado pero no avanza la terminal

Después de un rato se ha creado el deb:

libapp-music-chordpro-perl_6.101.0-1_all.deb

pero se ha quedado sin avanzar la terminal en:

```bash
Installing /home/wachin/AppsLinux/Chordpro/chordpro-deb/App-Music-ChordPro-6.101.0/debian/libapp-music-chordpro-perl/usr/bin/ttc
Installing /home/wachin/AppsLinux/Chordpro/chordpro-deb/App-Music-ChordPro-6.101.0/debian/libapp-music-chordpro-perl/usr/bin/chordpro
make[1]: se sale del directorio '/home/wachin/AppsLinux/Chordpro/chordpro-deb/App-Music-ChordPro-6.101.0'
   dh_installdocs
   dh_installchangelogs
   dh_installexamples
   dh_installman
   dh_perl
   dh_link
   dh_strip_nondeterminism
   dh_compress
   dh_fixperms
   dh_missing
   dh_installdeb
   dh_gencontrol
   dh_md5sums
   dh_builddeb
dpkg-deb: construyendo el paquete `libapp-music-chordpro-perl' en `../libapp-music-chordpro-perl_6.101.0-1_all.deb'.
make: se sale del directorio '/home/wachin/AppsLinux/Chordpro/chordpro-deb/App-Music-ChordPro-6.101.0'
--- Done
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
*** Notice ***
Some of the modules in the newly created package are already present
in other packages.

  PDF::API2 is in 'libpdf-api2-perl' (APT)
```

No está colgada por un error grave. Ese mensaje es un **aviso** de `dh-make-perl`.

Te está diciendo que el paquete que acabas de crear contiene módulos que también existen en otros paquetes de Debian, por ejemplo:

```text
PDF::API2 is in 'libpdf-api2-perl' (APT)
```

Como ya creó el `.deb`, puedes detener con:

```text
Ctrl + C
```

Luego verifica:

```bash
cd ~/AppsLinux/Chordpro/chordpro-deb
ls -lh *.deb
```

Para instalarlo:

```bash
sudo apt install ./libapp-music-chordpro-perl_6.101.0-1_all.deb
```

Y probar:

```bash
chordpro --version
wxchordpro
```

Ese aviso es normal porque ChordPro trae/usa módulos Perl y algunos ya existen en el sistema.


---

### 📌 **Notas adicionales**

-- **Actualizaciones**: Para actualizar, repite los pasos 5 y 6 con la nueva versión.  
-- **Documentación**: 

Consulta la ayuda en la interfaz en:

Help > ChordPro File Format

Consulta la ayuda integrada (opcional desde la terminal):  

```bash
chordpro --manual
```

Dios les bendiga
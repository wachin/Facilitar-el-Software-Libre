

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

---

# Características Principales de ChordPro:

1. **Simplicidad y Claridad**: El formato ChordPro coloca los acordes directamente sobre las letras de la canción, lo que facilita ver cuándo se deben tocar los acordes específicos mientras se canta o se toca.

2. **Uso de Etiquetas y Comandos**: ChordPro utiliza etiquetas específicas para marcar diferentes partes de la canción, como títulos, secciones de coro, y otros elementos estructurales. Algunas etiquetas comunes incluyen:
   - `{title: Título de la Canción}`
   - `{artist: Nombre del Artista}`
   - `{chorus}` para marcar el inicio de un coro y `{end_of_chorus}` para marcar el final.

3. **Acordes en Corchetes**: Los acordes se escriben entre corchetes y se colocan en la línea de la letra de la canción donde deben tocarse. Por ejemplo:
   ```
   [G] Despiértame cuan[A]do pase el temblor
   ```

4. **Compatibilidad y Conversión**: Existen muchos programas y aplicaciones que soportan el formato ChordPro, lo que facilita la conversión entre diferentes formatos de canciones y la impresión de hojas de acordes bien formateadas.

## Ejemplo de una Canción en Formato ChordPro:

```
{title: Despiértame Cuan}
{artist: Soda Stereo}

[G] Despiértame cuan[D]do pase el temblor
[G] Despiértame cuan[D]do pase el temblor

[C]Cierro los ojos
[F]No me atrevo a dormir
[C]Me duelen las manos
[F]De tanto escribir
```

## Beneficios de Usar ChordPro:                                                                                                                                                                                                                                                                                                                                                                                                                             

- **Estandarización**: Permite a los músicos compartir y leer canciones de una manera uniforme y consistente.
- **Facilidad de Uso**: Los acordes colocados directamente sobre las letras hacen que sea fácil para los músicos seguir la estructura de la canción.
- **Soporte Tecnológico**: Muchos editores y aplicaciones musicales pueden procesar y mostrar archivos ChordPro, ofreciendo funciones adicionales como transposición de acordes, generación de diagramas de acordes y más.

En resumen, ChordPro es una herramienta poderosa y sencilla para la notación de canciones, ideal tanto para principiantes como para músicos experimentados.

---

## Ejemplo de uso de ChordPro desde la línea de comandos para convertir un PDF en formato ChordPro de unos acordes de guitarra

Por cierto, en los archivos a convertir no deben haber corchetes "[ ]" o paréntesis llave "{ }" porque no se podrán convertir, debido a que ChrodPro usa estos símbolos

### Ejemplo 1: Transportar tono y convertir de .txt a .pdf

Tengo una alabanza en un archivo txt que contiene la letra y los acordes en C y quiero transponerla a D (subir un tono o dos semitonos)

El archivo contiene lo siguiente:

```
Canta al Señor
Vertical

Poner el Capotraste en la 1ra

INTRO x3
Am  G  F

VERSO
C         G         Am       G    F
Mi Cristo, mi Rey, nadie es como tu
         C       F        G
Toda mi vida, quiero exaltar,
     Am         A#      G
las maravillas de tu amor
C          G
　Consuelo, refugio,
 Am        G         F
torre de fuerza y poder
         C    F      G
Todo mi ser, lo que soy,
 Am         A#    G
nunca cese de adorar

CORO I
 C          Am       F         G
Cante al Señor toda la creación
 C         Am        F            G
Honra y poder, majestad sea al Rey
Am      G         F
Incomparables promesas me das
   Am  G  F  Am  G  F
Señor

VERSO
C   G Am G  F
C F G Am A# G
C   G Am G  F
C F G Am A# G

CORO I y II
 C          Am       F          G
Cante al Señor toda la creación
C         Am         F             G
Honra y poder, majestad sea al Rey
 Am        G        F
Montes caerán y el mar rugirá,
      G   Am    G
Al sonar de tu nombre
 C         Am        F            G
Canto con gozo al mirar tu poder
     C          Am    F        G
Por siempre yo te amaré y diré
Am    G           F              Am G F
Incomparables promesas me das Señor
                   Am  G  F
       son incomparables
                   Am  G  F
       son incomparables
         C    F      G
Todo mi ser, lo que soy,
 Am           A#  G  Am G F  Am G F
nunca cese de adorar

CORO I y II
 C          Am       F          G
Cante al Señor toda la creación
 C         Am        F             G
Honra y poder, majestad sea al Rey
 Am        G        F
Montes caerán y el mar rugirá,

 C          Am       F          G
Cante al Señor toda la creación
 C         Am        F             G
Honra y poder, majestad sea al Rey
 Am        G        F
Montes caerán y el mar rugirá,
      G   Am    G
Al sonar de tu nombre
 C         Am        F           G
Canto con gozo al mirar tu poder
     C          Am    F        G
Por siempre yo te amaré y diré

FINAL n
C       F         G
Incomparables promesas me das
Am      G         F
Incomparables promesas me das
Am      G         F
Incomparables promesas me das, etc
```

En la terminal, ejecuto (estando en una terminal ubicada donde está el archivo):

```bash
chordpro --transpose=2 'nombre-de-tu-archivo.txt'
```

Esto creará un archivo PDF:  

'nombre-de-tu-archivo.pdf'  

transportado más dos semitonos

![PDF Generado](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhu-9q6hJK_p0dmzuE5zcplgVQW-zD3ETTpt455qM6bcOP2Vm5c1_amD0VFPonR-lF2R_Ds8dK_zhiVnoP7GnQ0-evRvWGyzj03Fh3CwzOKcKGGty4RiHejwHLUJgJJowcD-Gt82AUDP5szuQXLtfWi4zopFKEjwzzadtmncvwPMHDa65vgW2urB_ZGNCM/s773/20240604-102157%20canta%20al%20se%C3%B1or%20ChordPro.webp)

El programa añade los acordes en gráfico:  
![Acordes añadidos](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjEeubCUpFM4DpwwggKqU8jOrSEye4sAcogT2D8vb4jRAhXJIZ51GPWmCRP0DNaBnYfg_GP56PgLb7MVS5frzSG8Y4NEBG4DOKVAqZKcu6_9_ig2zCe-KlGEh6gUgWLnneXGI-jBIeDynRdYLwhriY2filEkXr-Ub5Dh_pb0TMMTqoE_Gcs5m6OAxvBnuE/s650/20240604-102500%20ChordPro%20a%C3%B1ade%20acordes.webp)

---

### Ejemplo 2: Convertir .txt a .pdf sin transportar

Para convertir un archivo de texto a PDF sin transponer los acordes:

```bash
chordpro "nombrede tu archivo.txt"
```

Para ver todos los comandos disponibles:

```bash
chordpro --help
```

de la ayuda.

---

### Ejemplo 3: Transportar archivo .txt a .txt mismo

Deseo bajarle el tono a una canción que tiene su letra y acordes en un archivo de texto .txt y quiero que el proceso me dé como resultado un archivo de texto mismo.

**Solución:**  
Tengo el archivo:  
[Para ti Oh Señor (Dm).txt](https://mega.nz/file/ahMnRBrT#7dGYuTPwjrtEC_1Pco332cknCgjLmkrk55Qx9nu9Gow)

![Archivo original](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiSVdu89cuvJI1aBPlMac0_enBJuv4CX3TZHCHUwGvoCeKPyyB0oriT6l6r-oOsz3PDL-o08-rGVZIXuANa9sMz8_b8XGK6cRMw1mcPrrXQCzCbPVYbT4WE_JGB3ZmwcXAz6QwgeEh-TIemAWtF1r8u0Ni2N6wGCVhqhxVuNlHEP9EpCOEFL7BS4Hj4nl4/s820/20240605-120053%20Para%20ti%20Oh%20Se%C3%B1or%20Em.webp)

En la terminal, ejecuto:

```bash
chordpro --transpose=-2 'nombre de tu archivo.txt' -o "nombre de tu archivo_transportado.txt"
```

Esto crea el archivo:  

"nombre-de-tu-archivo_transportado.txt"


---


### Ejemplo 4: Convertir un `.txt` al formato ChordPro 

Desde la terminal usando la opción:

```bash
--convert
```

Ejemplo:

```bash
chordpro --convert "mi cancion.txt"
```

Eso generará automáticamente:

```
mi cancion.cho
```

o también puede generar `.chopro` dependiendo del nombre/configuración.

Si quieres especificar el archivo de salida:

```bash
chordpro --convert "mi cancion.txt" -o "mi mejor cancion.chopro"
```

Por ejemplo, si tienes esto:

```text
G           D
Santo, santo, santo

C           G
Dios poderoso
```

ChordPro lo convertirá automáticamente a:

```text
[G]Santo, santo, [D]santo

[C]Dios po[G]deroso
```

Y luego ya puedes renderizarlo a PDF:

```bash
chordpro cancion.cho
```

o abrirlo en la GUI:

```bash
wxchordpro
```

y se lanzará

---

## Quién usa ChordPro, Ejemplo

### songselect.ccli.com

El siguiente servicio lo usa:  
[SongSelect](https://songselect.ccli.com/)

![SongSelect](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNM4L6tU7qbGLJ07st1bLv0phzzLR0mru5TexwXYMkNz7y3l8XIo1e1xRDLoA2luTOLj0bEQ9mbv-uwkRU2IMjFoQzEFE-81wr2qDORf5EKpgRgWEBlSL5oLOrFqOVpCTbv3OdGhgztyE5H8mAABUr7PSlVjkXJUt5NCpx7fVPs5STnlmJPfPX7fAZ_gs/s1276/20240605-134802%20songselect%20Amazing%20Grace.webp)

Ejemplo de canción:  
[Amazing Grace](https://songselect.ccli.com/songs/22025/amazing-grace/viewchordsheet)

El archivo descargado es un .txt:  
![Amazing Grace ChordPro.txt](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhed8SodoJMPvLKbahh1JxsO8PfyTUju1W4aG9fp9KRTySSt68DTKh7jZMiKby9QxpjKwGd7Gpj_27AA2j4ftEoIoPV6DLOV_jIAv8utjCdJXttVKU9suymVUitsBFzJ0-Z-85Tp8JnzeyZtgj7-oIaJtLRbPvUD9RkoJxulj00vq4kP1edfzbhuNV5eeE/s728/20240605-140508%20Amazing%20Grace%20ChordPro%20.txt.webp)

Para transformarlo a PDF, ejecute `wxchordpro` y busque el archivo. Seleccione "All files":  
![Ventana wxchordpro](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirBb2e1KcxjBTn0LiuYoYJ9kyEk06z6JeYBz-cdv5r8OHjOXQbh_JGt8gg81qcNlVOYRhwYtRmVfJ1jfiiCpdG3nwTkNboFYM50rRDv2jwmKRszWqLhvsI8UTeYGOOle5P-gCrqQpLgdFj_qXQk7mHpObkrHiItsko5CAMB8ET_IdLe81BtJfHlsAsTys/s781/20240605-141744%20a%20la%20ventana%20ponerle%20All%20files.webp)

Haga clic en "Task - Default preview" y se abrirá con un visor de PDF. Guarde el archivo con un nombre.

Si desea el PDF generado:  
![Amazing Grace PDF](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqem4JwoRuajcAbw9YVUEQvQn4oTULKmGmBWnj1nIvIdvUUmytImVRcz39dYEtpq3S9AIwL_0NdPFqdaCceKGoSXC5rLkzZRRNW0Sgb38eHLRb_eheFwUlEp8f0WDMi5pUaoUZ9Qa-trnUSCatlu_3dCIWc2r859zWo9uwmmkDOsIwwbnpzJg0ypz9ZnY/s726/20240605-140211%20Amazing%20Grace%20PDF%20ChordPro.webp)

Puede convertirlo a Word con:  
[ILovePDF](https://www.ilovepdf.com/es/pdf_a_word)

![Conversión a Word](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXuQj9sBiJeQvnB5ql-8MXrpggYkIqg98B6kaAXLg4T6XjO-sWfcGpI9oaY6-LQzWpqMnc3Tn_WnFWSRLm0IzBFBB-cyFqYMfUSr7MnNt0qZi45vxIfQTj112JYvqgzpLh_AqlPF9nMUz6qHvLFXYW6uZrIWaOxmMFowkbNYY6Nd5l2Ig8gFCSwORXi-I/s751/20240605-140323%20Conversion%20del%20PDF%20a%20Word%20de%20Amazing%20Grace%20Chrod%20Pro.webp)

---

### Cancionero de acordes gratuito en texto .txt

Tengo un cancionero de alabanzas que he estado haciendo:  
[Wachin Cancionero](https://github.com/wachin/Cancionero)

![Cancionero](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQ4S4RHaWwwg5j1LEbKAdmC9ZNgDdLDYFJI0sRriS-fjWeMmpCk2p_ZUau1PnauFcLYgg7DgCSIKauL45FeqBeobSmacgej9LMmC8SuKuQa4RJesf8jj3qbKoDZwA3eMiCl4Q5mag71VnAFBE5BoK_m9vvgD4bR6GOIv1beNd3LRY9Qjh-lkyXDhrV2_I/s914/20240606-092626%20Wachi%20Cancionero.webp)

Dentro de la carpeta:  

/Acordes63x110mm

[https://github.com/wachin/Cancionero/tree/main/Acordes63x110mm](https://github.com/wachin/Cancionero/tree/main/Acordes63x110mm)

También están en .docx y PDF. En la carpeta Fonts están las fuentes usadas para los documentos .docx.

---

### Programas que usan ChordPro

**ChordSmith** lo acepta:  
[Descargar y usar ChordSmith en Linux](https://facilitarelsoftwarelibre.blogspot.com/2023/12/descargar-y-usar-chordsmith-en-linux.html)

![ChordSmith](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj539eTvi62W8wB9V7yELK3O5e-nsYs7TwpcZTGXgRixfDhaaAzy5t6xhSbhF2GBWAhTOh9TYZT0Q0NHSRX2RRnC5X0933dWnzQmRP8ZCes5o9jtVPsIoFoNsx29gslk4vOlFv-YNf2-RBfhiVJpnXOV_-t9xu8TaNXp8LO5FWKtclqiQInP8KuzON_JTc/s1084/20240605-141558%20chordsmith,%20convertir%20de%20chordpro.webp)

---

#### Songbook Pro

[Songbook Pro](https://songbook-pro.com/es/docs/manual/editor/chordpro/)  
Traducción al español:  
[Songbook Pro en español](https://songbook--pro-com.translate.goog/es/docs/manual/editor/chordpro/?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=wapp)

Descargas disponibles para:  
[Android, IOS, Windows 10, 11, Fire](https://songbook-pro.com/es/download/)

La versión de Android admite gratis 12 canciones. Permite transponer los tonos.

---

#### Worship Tools

[Worship Tools](https://www.worshiptools.com/en-us/docs/69-ch-chordpro)  
Traducción al español:  
[Worship Tools en español](https://www-worshiptools-com.translate.goog/en-us/docs/69-ch-chordpro?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=wapp)

---

#### Gig Performer

[Gig Performer](https://gigperformer.com/docs_4_8/UserManualOnline/chordpro.html)  
Traducción:  
[Gig Performer en español](https://gigperformer-com.translate.goog/docs_4_8/UserManualOnline/chordpro.html?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=wapp)  
[Sitio oficial](https://gigperformer.com/)

---

#### Onsong

[Onsong](https://onsongapp.com/docs/features/formats/chordpro/)  
Traducción:  
[Onsong en español](https://onsongapp-com.translate.goog/docs/features/formats/chordpro/?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=wapp)  
Solo para Apple.

---

# Cómo construir el deb

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
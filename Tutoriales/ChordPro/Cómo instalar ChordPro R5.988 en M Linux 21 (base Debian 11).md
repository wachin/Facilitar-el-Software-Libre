# Cómo instalar ChordPro R5.988 en M Linux 21 (base Debian 11)

ChordPro es un formato de notación diseñado para facilitar la escritura, lectura y distribución de canciones, especialmente las que incluyen acordes para guitarra u otros instrumentos. Fue desarrollado en la década de 1990 y se utiliza ampliamente por músicos y entusiastas para compartir canciones de una manera estandarizada y fácil de entender.

---

### En qué sistema operativo Linux lo instalaré

Específicamente lo voy a instalar en:  

**MX Linux 21 (Basado en Debian 11)**

**Nota:** Si deseas instalar una versión para algún Sistema Linux basado en Debian 12 o superior [ve este tutorial](https://facilitarelsoftwarelibre.blogspot.com/2025/08/chordpro-instalar-la-interfaz-grafica-de-usuario-en-linux-debian-12.html) (tal vez podría servir para Ubuntu).

Esta distribución de Linux fue liberada en Octubre 21, 2021 según:  
[MX Linux | Recent Releases](https://en.m.wikipedia.org/wiki/MX_Linux)

A la fecha Junio 2024 en que hago este tutorial estaba presente en [releases](https://github.com/ChordPro/chordpro/releases) la versión [R6.050](https://github.com/ChordPro/chordpro/releases/tag/R6.050) pero la intenté instalar y no se pudo por ser muy moderna para la base Debian 11, entonces intenté instalar varias versiones y me funcionó la versión [R5.988](https://github.com/ChordPro/chordpro/releases/tag/R5.988)

# Instalando ChordPro R5.988 en M Linux 21 (base Debian 11)

Desde este release:

[R5.988](https://github.com/ChordPro/chordpro/releases/tag/R5.988)  

Sí se puede instalar, probablemente porque las fechas de liberación están más cercanas.

Debe descargar el siguiente archivo:  

`App-Music-ChordPro-5.988.tar.gz`

![Descargar](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhvxhIgjf7X8wJ04I_mHi-qibiYJR93FJEX9n92Ilxhgj0wGlQPXnuWzOiR_ll2XXjLCFIBHEsHLlPpCU3A1TTdaohGcK2yVx-seypqfJBMA2BrGW6NkJJYho550HjBadEdC6gaXSyRfBfepdVbmlw7BB-1QZEMiLltHrtuMOrzF2kh7mwEzV9j-Hfx-RA/s973/20240604-103054%20este%20descargar.webp)

Descomprimirlo con clic derecho, entrar en la carpeta y abrir una terminal.

pero si antes deseas revisarlo, sube ese archivo a: [https://www.virustotal.com/](https://www.virustotal.com/)

y revísalo

esto debido a los ultimos ataques sabidos en el 2026 "[Internet Estaba A Semanas Del Desastre y Nadie Lo Sabía](https://youtu.be/a62HpQpVBh8?si=C8HGbGIVzLK24Nod)", "[¡GITHUB HACKEADO!](https://youtu.be/NapghLlS2I0?si=aNdr_b-3dSSNm4zE)" (lo revisé, está limpio)

---

## Compilación

Según consulté en:  
[Installation on Linux](https://www.chordpro.org/chordpro/chordpro-install-on-linux/)

Instalé las siguientes dependencias:

```bash
sudo apt install dh-make-perl pristine-tar libwxgtk3.2-dev libdpkg-parse-perl
sudo apt install libpdf-api2-perl libimage-info-perl libwx-perl
```

Para compilarlo, en la terminal abierta poner:

```bash
cpan build chordpro
```

Espere y llegará un momento que pide contraseña, póngala.

---

## Para lanzar la interfaz gráfica

Para lanzar la interfaz gráfica, ponga en la terminal:

```bash
wxchordpro
```

Aparecerá una ventana que pedirá un archivo de ChordPro. Búsquelo:

![Ventana wxchordpro](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9hyphenhyphen8-nQS5tjrcxf4-qpSDMd_OFhW7KT2-46Jx5a-msR9jrgsZyQBQLRsEqi_qIwC5-WINsWsD1LerfIqRbxhfla3W69xoFlqmOD6LPAz0KmIULVPlybJVjdslO4W7lmhsCJxHp9Pc-2N7tjDHJBruLdTm5OvvALhdqhDivMC0e7cgmnT_vOZ-cGuBDoc/s893/20240604-103353%20programa%20wxchordpro.webp)

Configure lo que desee hacer, por ejemplo:  
**Task - More...**

![Task - More...](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjXVWkRK75MXwysnpnrZUps_t1PQx6_2g08-Cs6ju5N_-U6WV493XuNS0HiPuxbCRFuGP8rcBTlvHCVjtDgiVkLHLJIaV38E2NnjJcm_BgJJyHeAxD2QeRR4GUcVHf9jNV-kLXbPBh17Asq-4ZZg_oVgBlz5bHe9_rdddlsMUhlAwfJrhRfNOauJmXrR0E/s603/20240604-103530%20Task%20-%20More....webp)

Una vez finalizado, se abrirá automáticamente el archivo PDF generado.

---

## Características Principales de ChordPro:

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

### Ejemplo de una Canción en Formato ChordPro:

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


---

## Versión R0_975 ya compilada y generados los binarios

En la versión R0_975, la compilación produjo archivos binarios ejecutables que pueden ser distribuidos sin necesidad de incluir el código fuente original. Descargar desde:  
[R0_975](https://github.com/ChordPro/chordpro/releases/tag/R0_975)  
[R0_977](https://github.com/ChordPro/chordpro/releases/tag/R0_977)

Descargar exactamente estos archivos:  
[chordpro-0.975-linux.tar.gz](https://github.com/ChordPro/chordpro/releases/download/R0_975/chordpro-0.975-linux.tar.gz)  
[chordpro-0.977-linux.tar.gz](https://github.com/ChordPro/chordpro/releases/download/R0_977/chordpro-0.977-linux.tar.gz)

Descomprimirlo, entrar en la carpeta y ejecutarlo desde una terminal.

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

### CONSULTAS

- How to convert perl modules into deb packages?  
  [StackOverflow](https://stackoverflow.com/questions/29170674/how-to-convert-perl-modules-into-deb-packages)

- Perl FAQ  
  [Debian Wiki](https://wiki.debian.org/PerlFAQ)  
  Comando mencionado: `dh-make-perl --build --cpan Perl::Tidy`

- ChordPro  
  [Linux Magazine](https://www.linux-magazine.com/Issues/2020/236/ChordPro)

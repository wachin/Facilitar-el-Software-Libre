2025-07-30 Revisíon: Si usted usa Linux y a usted le dan un archivo hecho en Microsoft Office y lo abre en [LibreOffice](https://www.libreoffice.org/download/download-libreoffice/) o [WPS Office](https://www.wps.com/) (u otro editor de ofimática como OnlyOffice o Foftmaker FreeOffice) se dará cuenta que muchas veces no encajan las fuentes como estaba el original, o se cambian los lugares donde están las cosas, o en WPS Office aparecen fuentes feas. Es como si se desbaratara el documento, esto muchas veces es debido a que no están instaladas las fuentes con las que fue hecho el archivo original. La Solución para visualizar bien los documentos en caso de que el tipo de la fuente no esté instalada en su Sistema Operativo Linux es instalar las Fuentes de Windows

Esto también servirá para Diseño Gráfico con Inkscape u otro 

## **SOLUCIÓN 1.- Copiar las fuentes de una computadora con Windows**  
Este método es el más fácil y le instalará todo lo necesario. Para hacerlo, en una computadora con Windows (puede ser suya o en un cyber) diríjase a la carpeta:

 C:\Windows\Fonts

las siguientes son  imágenes:  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh4Y_GK2dP67iHR4Ur8vsn7EbY0mDRSEFFa9wxY_jsM42-3Rdame1U06M8O2W1RbgSxekM0FU5U0kUNah60CIcPVc27vzk-T8Sr1WqaBW6-wvtOdqTMcqkoDYINI9dI_vpagV7RBVCKDRY/s16000-rw/00+carpeta+Windows.png)

y debe quedar aquí:  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk9oj6TzlW3v4KYVGJZJV7oU9DRgZML0ej1TApSfC5tSIM4ybBoj6ha_ymXkUGxkWX2mh5WliQJ0bKpcqpBVJK7q7MPfPIVVL1gFbtsw8Bs4Lwd8RrcTQ9AY41tdM3qrTLXWoaEBY9Se4/s16000-rw/01+Carpeta+Fonts.png)

como verá, dentro de la carpeta "Windows" está la carpeta "Fonts", entre allí y con el administrador de archivos, de clic encima de una fuente y seleccione todos los archivos con "**Ctrl + E**" y con clic derecho copiar:  
  
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh5m8C37SrY8Eh3EEa5KZGFWuE4MYFAM-14ir1r5NCpYwCpoM4a496pntGS0q-MCQsu91xGoPEtUH0Q73JjmcB7mNzFlLGVL-HftCdNXI0s-qpk5rMCSUl6pNISObYXm7OI_xu7U3moaLU/s16000-rw/02+copiando+las+fuentes.png) 
  
al hacer esto usted copiará todos los archivos de las fuentes, y en un pendrive cree una carpeta con un nombre como por ejemplo "FuentesWindows":

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGG0RAXj5TH9pOsbT7FR57zAcXpJt295_YDe_Yy8WJYqivOlWOTkWSSQ5uNpcv2CX9xQ1-hB1JQTXTo6YAo4OSyEcW79Kcy-S-iYQ5sG5BtQKetQDZ3cckTDE1rAa04ZVTEVv519GsZAY/s16000-rw/nombrando+carpeta+en+el+pendrive.png)

y los pegará dentro en esa capeta que usted haya creado:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhL7l57kyU__-juWEY5ZpNA8aObb5m9bVbrLbeKgZQq6rvF4890N2383ww6pXqcBbjgsMhFfqzz2f0qTc7rQeQOFdV9RbGBqWgNxB3DXjetf2pGUWeUC9lq6qk1VVU6IdNUSeq2DaFcwxE/s16000-rw/Pegando.png)


# Instalación de fuentes tipográficas en Linux

En muchas guías antiguas se recomienda copiar las fuentes de Windows a la carpeta personal `~/.fonts`.  
Esto **sigue siendo funcional en 2025**, pero el archivo de configuración de Fontconfig en Debian 12:

/etc/fonts/fonts.conf

indica claramente:

```xml
<dir prefix="xdg">fonts</dir>
<!-- the following element will be removed in the future -->
<dir>~/.fonts</dir>
```
![](https://blogger.googleusercontent.com/img/a/AVvXsEizJKqIR0EABs9Adxy82JnefqzQaC_4UfN0ymDV4Pqr4IkBVoDycNYVY14F4Z53rgbkbZhQaSLZYLHQ03JWPixHhGMy_Yj_A7l2B-VprbbkBPBRFCSrEeb6nMXyq7P8rppyg1SiAKSUZjpz7o-UROxj_fbfGCpWc3ZLDImXiMLUB2chSYIoc225HnlJohc=s16000-rw)

Esto significa que `~/.fonts` **será removida en el futuro**, y la ubicación recomendada según el estándar **XDG Base Directory** es:

```
~/.local/share/fonts
```

Por lo tanto, si instalas fuentes solo para tu usuario, es mejor usar esa ruta recomendada para ya ir acostumbrandose

## Instalar fuentes solo para tu usuario (sin tocar el sistema)

Para instalar fuentes tipográficas solo para tu cuenta de usuario, puedes guardarlas en la carpeta recomendada:

```
~/.local/share/fonts
```

> **Nota:** El símbolo `~` representa tu carpeta personal (por ejemplo: `/home/tuusuario/`).

### 1. Crear la carpeta automáticamente (método rápido)
Abre una terminal y escribe el siguiente comando:  

```bash
mkdir -p ~/.local/share/fonts
```

Este comando crea toda la ruta necesaria.

* La opción `-p` hace que **se creen las carpetas que falten** sin dar errores si ya existen.

### 2. Crear la carpeta manualmente (sin usar la terminal)

Si prefieres hacerlo de forma gráfica:

1. Abre tu **administrador de archivos**.  
2. Presiona `Ctrl + H` para mostrar las **carpetas ocultas** (en Linux las carpetas que empiezan con un punto `.` son ocultas).  
3. Si no existe la carpeta `.local`, créala:  

   * Clic derecho → **Crear carpeta** → escribir `.local`  
4. Dentro de `.local`, crea otra carpeta llamada `share`.  
5. Dentro de `share`, crea otra carpeta llamada `fonts`.  

La ruta final debe quedar así:

```
/home/tuusuario/.local/share/fonts
```

### 3. Copiar las fuentes

Copia todos los archivos de fuentes de Windows (`.ttf` o `.otf`) y pégalos en esa carpeta.
Puedes crear subcarpetas dentro de `fonts` si quieres organizar tus fuentes (por ejemplo: `windows`, `personales`, etc.).

---

### Ventajas de este método

* No necesitas permisos de administrador.
* Las fuentes se aplican solo a tu usuario (otros usuarios del sistema no las verán).
* Es la forma recomendada actualmente (la carpeta antigua `~/.fonts` sigue funcionando, pero está marcada para eliminarse en el futuro).


## Instalación de fuentes para todo el sistema

Si el equipo tiene **varios usuarios** y todos necesitan las fuentes de Windows, se deben instalar **para todo el sistema**.

### ¿Dónde van las fuentes del sistema?

Las fuentes del sistema en Linux se guardan en:

/usr/share/fonts/truetype/

Podemos crear una carpeta nueva, por ejemplo:

/usr/share/fonts/truetype/windows

y dentro de ella pegar todas las fuentes de Windows.

### ¿Cómo copiar las fuentes sin usar la terminal?

Para mover archivos a esa carpeta necesitamos permisos de administrador. Hay varias formas de hacerlo gráficamente:

#### 1. Usando **Krusader**

**a.)** Instalar Krusader (si no lo tiene):  

```bash
sudo apt install krusader
```

**b.)** Ejecutar Krusader como superusuario:  

```bash
sudo krusader
```

**c.)** Navegar a la carpeta donde tienes las fuentes de Windows y copiarlas.  

**d.)** Abrir una pestaña con "`Ctrl + T`" e ir a "`/usr/share/fonts/truetype/`", crear la carpeta `windows` y pegar allí las fuentes.  
   *(También puedes hacerlo usando el otro panel en lugar de crear una pestaña).*

#### 2. Usando **Double Commander (GTK o QT)**

**a.)** Instalar Double Commander:  

```bash
sudo apt install doublecmd-gtk
```

o si usas KDE Plasma o LXQT:

```bash
sudo apt install doublecmd-qt
```

**b.)** Ejecutar Double Commander con permisos de superusuario:  

```bash
sudo doublecmd-gtk
```

o:

```bash
sudo doublecmd-qt
```

**c.)** Copiar las fuentes a `/usr/share/fonts/truetype/windows`.  

## Consejos para usar el administrador de archivos como superusuario

* **Tenga mucho cuidado** de no borrar ni mover carpetas o archivos del sistema operativo. Si elimina o mueve algo crítico, el sistema puede dejar de funcionar y podría ser necesario reinstalarlo.
* **No abra sus archivos personales (imágenes, documentos, etc.)** desde el administrador de archivos ejecutado como superusuario.
  Esto se debe a que el programa que abre esos archivos puede heredar permisos de superusuario y cambiar la propiedad de los mismos, provocando que luego no pueda acceder a ellos desde su usuario normal.
* **Cierre el administrador de archivos cuando termine de usarlo como superusuario.**
  Dejarlo abierto puede ser peligroso porque, al volver más tarde y olvidar que sigue con permisos de administrador, podría borrar o mover algo importante sin darse cuenta.

## Actualizar el caché de fuentes (opcional)

Después de copiar las fuentes, se recomienda actualizar el caché de fuentes:

```bash
sudo fc-cache -fv
```

### Verificar la instalación

Abre un programa como LibreOffice, GIMP o Inkscape y revisa si aparecen las fuentes recién agregadas.


### 🔁 ¿Cuándo sí se necesita `fc-cache -fv`?

1. **Cuando instalas fuentes en directorios no estándar**, como uno que creaste manualmente o no es reconocido automáticamente.
2. **Cuando haces scripts automatizados o instalaciones sin sesión gráfica activa**, por ejemplo en servidores o instalaciones masivas.
3. **Cuando un programa específico no detecta la fuente nueva**, a pesar de reiniciarlo.
4. **Cuando tienes problemas con fuentes corruptas, cache antigua o conflictos**, y necesitas regenerar toda la caché de fuentes.

### ✅ RESUMEN

Cuando instalas una fuente en directorios estándar como:

* `~/.fonts` (obsoleto pero aún funcional en muchos sistemas)
* `~/.local/share/fonts` (recomendado para instalaciones por usuario)
* `/usr/share/fonts` (para todo el sistema)

el sistema detecta automáticamente los archivos `.ttf`, `.otf`, etc. La mayoría de los entornos de escritorio modernos y programas (como LibreOffice, GNOME, KDE, etc.) **usan `fontconfig`**, que suele monitorear automáticamente los cambios en esos directorios.

LibreOffice, al reiniciarse, vuelve a cargar las fuentes disponibles a través de `fontconfig`, por eso ya te aparecen sin hacer nada.


### 📜 Un poco de historia

Durante mucho tiempo, el lugar "de facto" para instalar fuentes a nivel de usuario era:

* `~/.fonts` (es decir, una carpeta `.fonts` en tu directorio personal)

Este método funcionaba bien y era el más documentado en distros como Debian, Ubuntu, etc., desde antes de 2010. Muchos tutoriales antiguos (y aún varios actuales 2025) siguen recomendando esta ruta.

---

### 🆕 ¿Qué cambió?

A partir de las **especificaciones de XDG** (X Desktop Group), las distribuciones comenzaron a migrar a una estructura más estandarizada para los archivos de usuario. En esa estructura:

* Los datos del usuario se almacenan en `~/.local/share/`
* Por tanto, las **fuentes por usuario** se instalan en:

```
~/.local/share/fonts
```

Este cambio fue adoptado gradualmente, y **`fontconfig` desde versiones modernas (como la que trae Debian 12)** reconoce y monitorea automáticamente esa ruta como válida para fuentes.


## 📌 Opcional: Instalar una GUI para gestionar fuentes
Si quieres ver, activar o desactivar fuentes fácilmente, instala **Fontmatrix**: 
 
```bash
sudo apt install fontmatrix
```
Luego ábrelo desde el menú y revisa tus fuentes instaladas. 

Si las fuentes no se ven bien, debes configurar las fuentes visibles

Da clic en:

**Edit > Preferences**

Da clic en:

**Display > Default font size**

y pon ejemplo:

**10**

este número es un ejemplo y depende de cómo se vean las fuentes en tu monitor. Da clic en Close y además cierra Fontmatrix y vuelvelo a abrir y se verá el cambio

También puedes ver mi tutorial:

**Instalar FontMatrix y configurarlo en Debian 12**  
[https://facilitarelsoftwarelibre.blogspot.com/2025/02/instalar-fontmatrix-y-configurarlo-en-debian-12.html](https://facilitarelsoftwarelibre.blogspot.com/2025/02/instalar-fontmatrix-y-configurarlo-en-debian-12.html)  

---

## Consejos adicionales
- Si compartes documentos con usuarios de Windows sólo usa fuentes de Windows para asegurarte que se abran en otro ordenador, ejemplo cuando una persona está haciendo una tesis y debe compartir archivos con otros estudiantes, o cuando vas a hacer imprimir algún archivo de diseño gráfico como puede ser un .svg convertido en pdf y lo lleves a hacer imprimir a una imprenta. O cualquier archivo que lo vayas a habrir en otro ordenador cerciorate que la fuente esté allí también o llevala en un pendrive e instalalas en ese ordenador para que se puedan visualizar.

# Referencias

**Linux Font Equivalents to Popular Web Typefaces | Jon Christopher**  
[https://jonchristopher.us/blog/linux-font-equivalents-to-popular-web-typefaces/ ](https://jonchristopher.us/blog/linux-font-equivalents-to-popular-web-typefaces/) 

**How do I install fonts?**  
[how-do-i-install-fonts](https://askubuntu.com/questions/3697/how-do-i-install-fonts)

**Añadir una tipografía adicional para usuarios individuales**  
[fonts-user.html.es](https://help.gnome.org/admin/system-admin-guide/stable/fonts-user.html.es)  

**Font configuration (Español)**  
[Font_configuration_%28Español%29](https://wiki.archlinux.org/title/Font_configuration_%28Español%29)



## SOLUCIÓN 2.- Descargar las fuentes tipográficas subidas a internet

Encontré la siguiente descarga:

### Desde Github

[https://github.com/FSKiller/Microsoft-Fonts.git](https://github.com/FSKiller/Microsoft-Fonts.git)

**Nota:** De este repositorio hice un Fork con explicaciones, está explicado después de este. 

Para descargarlo dar clic en Code y descargar el Zip (si lo hace de esta manera no estará presente la carpeta oculta .git la cual ocupa mucho espacio):

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMlCqto4JwMCsX_w66l9hQiYjGYdeWmmEumHffc8ZG7J8mcdCnR7M8XTamSApm-V9QIOIaet28i0GcKAEw97edgMnEbWmM5mPBx_TTAC4r8n_8sotD66ulOSMWKLRDuZBGe-c1eBP-vS6VqNwnw94qYc0tocqa7v9mCqJJ9mTe5PPf7V7293jhm0x7Bpc/s16000-rw/20250730-155222%20tambi%C3%A9n%20puede%20dar%20clic%20en%20Code%20y%20descargar%20el%20Zip.png "también puede dar clic en Code y descargar el Zip")

la descomprime y la pone en .fonts

### Mi Fork 

además yo hice un fork y le puse muchas explicaciones, puede ver en:

[https://github.com/wachin/Microsoft-Fonts](https://github.com/wachin/Microsoft-Fonts)

Para instalarlo con mayor facilidad poner en la terminal:

```bash
mkdir -p ~/.local/share/fonts/Microsoft-Fonts
git clone https://github.com/wachin/Microsoft-Fonts
rm -rf Microsoft-Fonts/.git
mv Microsoft-Fonts/* ~/.local/share/fonts/Microsoft-Fonts/
rm -rf Microsoft-Fonts
echo "Dios les bendiga"
```

este comando además eliminará la carpeta .git la cual contiene mucho espacio que no necesitamos. Y leer además las descripciones que le puse en español en mi Fork: 

**Readme en español**  
[https://github.com/wachin/Microsoft-Fonts/blob/main/README_ES.md](https://github.com/wachin/Microsoft-Fonts/blob/main/README_ES.md)

**Texto de las fuentes con sus nombres**  
[https://github.com/wachin/Microsoft-Fonts/blob/main/01%20Text%20with%20fonts%20and%20their%20names.pdf](https://github.com/wachin/Microsoft-Fonts/blob/main/01%20Text%20with%20fonts%20and%20their%20names.pdf)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJHHylHznl7O1x5cLm1gx-o8mqAkua7n97PtfdYL2WY-XdGq6sqfcpoGOdYBg1wvWhohJOGyacHZJWzfgPzuiZMi4jMuriYWAkuO1WyqQbD0eQvkToVyqe4CRXlZBKRDvj2VhJOHZylB-577b1uNgIHGvR0oUHUepzbDCjXFjs-XIyT2ePHH1XJphyphenhyphenCvM/s16000-rw/20250730-160753%20fuentes%20con%20sus%20nombres.png)

### **Descarga desde w7df.com**

Entre en la siguiente pagina: 

[https://www.w7df.com/p/windows-10.html](https://www.w7df.com/p/windows-10.html)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEia079ERRuHmdYkMoKiSpIFhdDTY-Tt6OnGhVJ5Tb1Wn0QTGaeY1uNCnAtWH7oVoxAPsu-bJhkIVsBn8q1M3N3zj_FfBUe-7oqAbdgVwJz9Jz-uFwynvKub3a85x46RdyqDxkz3qcSzEMU1yEg30rypwBimsCChtPuJIVdk_L2YnkPCmUg1LjritFfirHw/s16000-rw/20250730-160211%20descarga%20fuentes%20de%20windows%2010%20desde%20w7df.com.png "descarga fuentes de windows 10 desde w7df.com")

descargar el archivo y descomprimirlo y poner la carpeta en .fonts (no se preocupe que dentro hay otra carpeta igual las reconocerá el sistema, pero si desea puede pasa el contenido de la carpeta segunda a la primera).

## SOLUCIÓN 3.- Instalar algunas fuentes de Windows del paquete ttf-mscorefonts-installer

Si tal vez usted no quiera usar el método anterior puede instalar algunas pocas de Windows del paquete ttf-mscorefonts-installer, la siguiente es una lista de las fuentes que este paquete instalará:

**Lista de las fuentes**

-     Andale Mono
-     Arial Black
-     Arial (Bold, Italic, Bold Italic)
-     Comic Sans MS (Bold)
-     Courier New (Bold, Italic, Bold Italic)
-     Georgia (Bold, Italic, Bold Italic)
-     Impact
-     Times New Roman (Bold, Italic, Bold Italic)
-     Trebuchet (Bold, Italic, Bold Italic)
-     Verdana (Bold, Italic, Bold Italic)
-     Webdings

Ponga en la terminal el siguiente comando para la instalación (Nota: Si ya tenía instalado PlayOnLinux o Wine ya lo habrá instalado)  

```bash
sudo apt-get install ttf-mscorefonts-installer
```

Ese paquete tiene ese nombre en Ubuntu y en Debian. Puede constatar aquello en:

[https://packages.ubuntu.com/ttf-mscorefonts-installer](https://packages.ubuntu.com/ttf-mscorefonts-installer)

[https://packages.debian.org/ttf-mscorefonts-installer](https://packages.debian.org/ttf-mscorefonts-installer)

**Nota:** Esto significa que lo puede instalar en Sistemas operativos basados en ellos.  

el paquete instalará las fuentes en:  

/usr/share/fonts/truetype/msttcorefonts/  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiAMVbwWaJ23iAC9SUvpiJwJz8ASWkXIrEhH1SCaLszr7ZFBSpVwAqwq5LWCWJ9PLh4Wba5qXp2-pNAvWuO7L0ZaeXxdliQY8xqpBvA6yxwLbJrZkxGO7xHVXLau_qTkDJ16pIRLxo75mw/s16000-rw/Selecci%25C3%25B3n_109.png)

**Nota:** Esta vista es en el administrador de archivos thunar.  
Si ustedes leen en la vista de lista (esto en thunar) allí están instaladas y se observa el nombre de la fuente en "Tipo":

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh30t-xF6Gkw9KygmAuBgd99QzsE26-JqcussKLuzKg2ZQShHe2TMU2NH4e62vtU2YBHu15gsRB4vY1nvfm0WWDWEZoRBbFLoEhnaDhgopAob-JtyxP3ZU6ZU5cLxZ1fQ18aEvlAL3TPn4/s16000-rw/Selecci%25C3%25B3n_110.png)

**Nota 1:** No todos los nombres de fuentes se ven en "Tipo" 

## SOLUCÓN 4.- Instale Power Point Viewer

Si usted no quiere usar el primer metodo para tener las fuentes de Windows y ha usado la instalación anterior, puede instalar las siguientes del instalador  Power Point Viewer

**Lista de fuentes que instalará:**

Corbel  
Constantina  
Consolas  
Candara  
Cambria  
Calibri  

Este ejecutable "**Power Point Viewer**" ya no está disponible para su descarga en la página de Microsoft, lo deben descargar desde una de estas tres direcciones: 

**DESCARGA:**

**Descargar PowerPoint Viewer 14.0.4754.1000 - FileHippo.com**  
[https://filehippo.com/es/download_powerpoint/](https://filehippo.com/es/download_powerpoint/)

**PowerPoint Viewer | Libere las revisiones de la transferencia directa y del software | CNET Download.com**  
[http://descargar.cnet.com/PowerPoint-Viewer/3000-2075_4-75450958.html](http://descargar.cnet.com/PowerPoint-Viewer/3000-2075_4-75450958.html) 

**Nota:** Es posible que los enlaces algún día se caigan por lo que ustedes deberán de buscar otros.

**Para extraer el contenido de ese ejecutable .exe usar el gestor de archivadores**

Esto me funciona en MX Linux 19, puede que funcione en otro tipo de Linux. En Thunar solo hay que dar clic derecho al ejecutable:

![](https://blogger.googleusercontent.com/img/a/AVvXsEjADpl8Bb5aHh3Jik7QmV3K0dFQ51rVIy9bMJhbrKzeW-YmuFoU5Ln25cG4JDDGBDlbHF9FEit4dLRfOEHqMkbzgO7B9pgdrebytdYkqsfPSza5XlTBIaA-DMjGwX5uO7hl3a1F5HfhRdcm0vT6NpOWrTcoTXgIt7awYGMKR57DPgPWCvS_HF8A3il7FyQ=s16000-rw)

  
luego extraer el .cab

![](https://blogger.googleusercontent.com/img/a/AVvXsEjkiTHDxbS3M4e41USJKCUaZEYKonSTxNL4SrQzOZV904p9Fg79GqoOl4PrAYKOW6Ssfn2efHjhzwetVWa022LFwL0YZPsXU9HBocA8ZqY8kOZ5XNGj0ow1SsqkZyGPhQUch3LvbGnt636gEHfZpzNnMxpBBqGbg0vw83LdSxm8xTcMNAegkFe2fiWpUqg=s16000-rw)
  
depende de su sistema Linux aparecerá alguna opción, como sea guarde lo que se va a extraer a alguna carpeta:

![](https://blogger.googleusercontent.com/img/a/AVvXsEggEiDsXAMBcp1JFF5-D6tiOENgwUuaLnUszhugRb9Z3ps4qz5oTmsMEhLD9qvKLLPi7b3bEbP5UQKI5Jvgg8l1o5EnOXsamUV81z2wsgRPYy4sXWFs0NTpoxdmp6ErdeZXrflfWpfC5FFZdTMZx9h-2ouU0uoJxXVpXEXEdqZIC23xhz_0dcKj6f5wFd4=s16000-rw)

y ahora debe buscar la carpeta donde lo extrajo al archivo .cab abrirlo con el gestor de archivadores:

![](https://blogger.googleusercontent.com/img/a/AVvXsEgG2SU9voPVkFBcvmygO-rJvQ2Fu7kH6OSNfl7feqSSAPc9NBXj53Tf1M45aPzHPvDsLfMHbQt_nViy2fI4HCitpzREwcTK6rGbyQOLUqafdAKpfoYeXaM-xztcqr34HRGQRmCZbvSIG_UkObWx0Uvh6MOxNQXsX1sFgVYsmsiJ3ktDgulg5LL2or8uipA=s16000-rw)

y extraer allí su contenido:

![](https://blogger.googleusercontent.com/img/a/AVvXsEh34jBNjHUI_hkDn79H2tEMKa0QogEi9v0P5Y6QEe5sMvkQOXj11Vb8up0zaJayauO2O3V7vXXU930Utn67fz7qYWWjA2NC-NcZrc1g3YPmrtkvI-jYQWMZDXqY7XMpT4u-Rx2KFDvRuUKxsvTtVFIvbIV27BVZNHjqygPQN5R06uLUjCwYfQgyBjqbLss=s16000-rw)

**También puede usar peazip**  

Este programa no está en los repositorios, hay que descargarlo de:

[https://github.com/peazip/PeaZip/releases/](https://github.com/peazip/PeaZip/releases/)

o:

[https://sourceforge.net/projects/peazip/files/](https://sourceforge.net/projects/peazip/files/)

**PeaZip** 

Hay algunas versiones de 64 o 32 bits, o para ambas de 64 o 32 bits, yo instalé en MX Linux 19 de 32 bits la siguiente versión:

**PeaZip 7.2.1**

En la página 4

[https://github.com/peazip/PeaZip/releases?page=3](https://github.com/peazip/PeaZip/releases?page=3)

 
![](https://blogger.googleusercontent.com/img/a/AVvXsEj_v4voEsbYgICVGJfbSX2LOq0eguOGzvDNuQm-RHbveKisgV8A5asq-sXhPTzehZFSpiLUoDyrTpclDsAfXwrAL_epdC5VtS4tWp5tytQ1EVv3E0mhF1M4APseqO0DtRtvD--JYTVG-YaN9KFIQOIAr3A0lQI_jFIs8D9J7VGX3kpzWebzg9BrRAlJbws=s16000-rw)

esa versión es para ambas arquitecturas, es la ultima de ese tipo que encontré, de allí las nuevas son solo para 64 bits

Instalelo con gdebi, sino sabe cómo hacerlo vea este [tutorial](https://facilitarelsoftwarelibre.blogspot.com/2016/09/instalar-paquetes-deb-con-gdebi.html).

Una vez instalado PeaZip búsquelo entre sus aplicaciones y ábralo:

![](https://blogger.googleusercontent.com/img/a/AVvXsEiMyGyMe-oK1LRJmSjUg2Bo_WdfJQ61MxaDF1Wy4AyuXgDf1vWcP4pY60AN8KeViXvXNq-0iwcniWlsThLssA8jqrJHeBOKghPdYmlejbqxyX83uM8VrumGIp0sObqYS4zRut9ORlkNpgbNftgy9nYbkiWxCYv_6QuUxJ6OjnDeuSi4gzxRBNe_SW5cPqc=s16000-rw)
En esta versión para ponerla en español dar clic en: 

**opciones - localización**

elija el idioma en español:

![](https://blogger.googleusercontent.com/img/a/AVvXsEj6k_rnXqiqKGvyCdvfPDXErHBGcQo_pNvSiHD57iiBWxkyHe-F5nHgdIQyVxWTjLY8H6-svS0VESYYTvuyPlwELriSHkIXKTzg-VFAc5IHwNkiHHSa0Vgvbq1gOiVREqwS3-3w7sg_5mrxXANEu3_smOAT0zTvSd-EdyIZ6lT5HRbYUOuQEEK1xX9qRDY=s16000-rw)

en esta versión se cierra y al iniciarse otra vez ya estarán en español (en versiones futuras puede que mejoren eso)

Ahora descomprima el archivo que descargó (60.3 MB)  
Para hacerlo búsquelo con PeaZip, debe estar en descargas:
![](https://blogger.googleusercontent.com/img/a/AVvXsEjTidHy_7AIrqcFRn2LiX-xoeil5_jE2G7IQMVI9uAhcrppeucwO21leDzzOL7fU1VvDLE48_G1bqSAkXdWojeSZwshgT3eYQmzcLKUMwWnnS8jq9DIPBH_CvA4MarGCq3Z5Q7ykYKugZoTKA-3QqAt0AgzexofFnQlX04eUe0IBgoKoGOlh9j2JiOqMbg=s16000-rw)

darle doble clic al .cab

![](https://blogger.googleusercontent.com/img/a/AVvXsEhbYqbVVZZ5UOKtT10SdTtX9nJnr6wCUEsSl9JwPdVksDSFBFygSDaMrtMMD-kaDxwwj9rf7uGXGsE8_2GmwG7VsELUMmWF0dlwafr8irYfOkdN564zabEIWLKnEqaH6QIRKi0Rdb7Or9sA02zanOZq6gEhcjwPiiYHtKILtN_UUz6RzXlfqoqs5RZOdhk=s16000-rw)

dar clic en extraer

**Nota**: Cuidado le da clic en alguno de los archivos allí dentro pues después se seleccionaría solo aquel.

![](https://blogger.googleusercontent.com/img/a/AVvXsEgjW3sfHYkd1SEBZbu1whp929ZSS3C0g73WZlcfWgd4i8DxVT8fE3t28slXyPVVll-hUHLah9cFkf2RzfBPx3xAqmzVxtQoUgj0Ldg0IgMyMyT8FBhe0uJ1HjGmSgcH6BysO_LGH6LMtQ9uHPdCemjJFlrLQGfBc9luW7r_1FByaUNpwoI6k8KvxAE2KU0=s16000-rw)

Debe de marcar extraer en una nueva carpeta y clic en Aceptar:

![](https://blogger.googleusercontent.com/img/a/AVvXsEitTO7HDVMS6sw3G-YWrTDF_cWip_6aziVduBoykDLYhlIq3ybroPHXBM6eSOJPnU__jVveJhK-lrsDHFEZyWRfwDipTs64nBv8uwt3n560BL54awkDhj-2v-hTbJlp0Ak4Jtbc5FWjw7qdxIa6tu5BRmH5uV7sY3-kDBl5FDqoW7uHE04E4NqLezb5PeM=s16000-rw)
  
y se descomprime el contenido a:

![](https://blogger.googleusercontent.com/img/a/AVvXsEglvBwqZU62CjBT8jaSG6Eu8xsoGZDKU1c8LSJP2naC2HIVT3UpAH7kEBVneTsUqBukGYr12abTdliNf30YYd-EJV8jP5S-M34XayOkctEtl5wYlSiZxNO2Jds4s4IfgLYFksVSD-N0Y4Y7t86htzx6gDh1UQuOjuYzMdtrmIPuofDWN4eVE7X7UBwu4Wo=s16000-rw)

allí dentro están todos los .ttf

![](https://blogger.googleusercontent.com/img/a/AVvXsEiPGl-5Wtc3ULMikXSyOm3hvuQvUMJYAtQ-zWXvche5Y60svaLuRh8CRooByFCcA44oSWqUc7tDn3ZT5ILUb0zjrFJGBQ1IJmX-W7EwQDyulN0GzzG81EAOtor76gUiBk7unIVkUa7Rj9ootPcuk96olnhkChDZFGcRXxUMBRIQfLJF1SnVDPXw5vViDyo=s16000-rw)

en la imagen de arriba en Thunar estoy en la vista de Detalles y he dado clic en la opción "Tipo" para que se ordenen los archvios por tipo y así poder seleccionar cada uno de los .ttf o sea todas las fuentes que las voy a sacar de allí y poner en otra carpeta con un nombre por ejemplo:

Power Point Fonts

para poder ponerlas en 

~/.local/share/fonts/

Como quiera, con el administrador de archivos que usted use, deberá de ordenarlas por tipo y luego  cortarlas y ponerlas en otra carpeta con algún nombre y pegarlas en la carpeta .fonts

Y no se olvide que para que estén disponibles en los programas donde usted las necesite como: LibreOffice, WPS Office, Inkscape, Gimp, etc, si usted tenía abierto al programa debe de cerrarlo y volverlo a abrir para que la fuente aparezca disponible.  
  
Dios les bendiga 

Le aconsejo ver la siguiente entrada:

**Cómo instalar fuentes tipográficas en Linux**  
[https://facilitarelsoftwarelibre.blogspot.com/2021/01/como-instalar-fuentes-tipograficas-en-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2021/01/como-instalar-fuentes-tipograficas-en-linux.html)

 **LECTURAS IMPORTANTES (sólo que están en Inglés)** 

**Install Free Office 2007 Fonts for Linux and XP - OpenOffice.org Ninja**  
[https://www.oooninja.com/2008/01/calibri-linux-vista-fonts-download.html](https://www.oooninja.com/2008/01/calibri-linux-vista-fonts-download.html) 

**Metric Equivalent Fonts and Font Substitution - OpenOffice.org Ninja**  
[https://www.oooninja.com/2008/02/metrical-equivalent-fonts-and-font.html](https://www.oooninja.com/2008/02/metrical-equivalent-fonts-and-font.html)  

**Fonts - ArchWiki**  
[https://wiki.archlinux.org/index.php/fonts](https://wiki.archlinux.org/index.php/fonts) 

**Microsoft fonts - ArchWiki**  
[https://wiki.archlinux.org/index.php/Microsoft_fonts](https://wiki.archlinux.org/index.php/Microsoft_fonts) 

**[SOLVED] ttf-mscorefonts-installer reinstall**  
[https://ubuntuforums.org/showthread.php?t=2286648](https://ubuntuforums.org/showthread.php?t=2286648)


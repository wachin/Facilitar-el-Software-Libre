

# Cómo descargar Vídeos de youtube en mp4, mkv o mp3 u otros con yt-dlp desde la terminal de Linux o de Termux

**yt-dlp**es una bifurcación (fork) de**youtube-dl**, una herramienta popular de línea de comandos utilizada para descargar videos de YouTube, Facebook, Tiktok, Instagram, Twitter y otros sitios web, desde la terminal.**yt-dlp**incluye características adicionales, mejoras en la funcionalidad original y soporte para más plataformas. Es una herramienta poderosa para gestionar contenido multimedia desde diversas plataformas.

## Paso 1: Instalar Termux en Android

Debemos instalar Termux en Android pero no la versión que viene en la Play Store sino la versión completa, si tiene un celular Xiaomi allí está una versión completa disponible en el gestor de software de esos celulares, pero
no en otros como los SANSUMG. Si tiene un SAMSUNG u otro celular debe  instalar F-Droid o la apk que allí está, para ello vea la siguiente  entrada:

**Tutorial: Uso de Git en Termux para Android**
[https://github.com/wachin/Instalar-git-en-Android-con-Termux](https://github.com/wachin/Instalar-git-en-Android-con-Termux)

Si has seguido bien mi tutorial deberás haber usado:

```bash
pkg update
```

y recomiendo usar un solo repositorio de los paquetes Termux, yo uso Grimler, y bueno allí están las explicaciones.

## Paso 2.1: Instalar
las dependencias necesarias para Termux

Para usar**yt-dlp**, necesitarás Python y FFmpeg. Ejecuta
el siguiente comando para instalar esos paquetes:

```bash
pkg install python ffmpeg -y
```

Donde:

-**python**: Es necesario para ejecutar**yt-dlp**.

-**ffmpeg**: Es una herramienta esencial para fusionar
video y audio.

## Paso 2.2: Instalar las dependencias necesarias para Linux

Para usar**yt-dlp** en los Sistemas Operativos Linux necesitarás Python (ya viene instalado por defecto) FFmpeg y python3-mutagen, Ejecuta el siguiente comando:

```bash
sudo apt install ffmpeg python3-mutagen
```

## Paso 3.1: Instalar yt-dlp y mutagen en Termux desde pip

Para Android en Termux, una vez instaladas las dependencias python, ffmpeg, instala**yt-dlp**y**mutagen**usando**pip**:

```bash
python -m pip install yt-dlp mutagen
```

El paquete de[Python
mutagen](https://products.documentprocessing.com/es/metadata/python/mutagen/#:~:text=Mutagen%20es%20una%20biblioteca%20Python%20potente%20y,incluidos%20MP3%2C%20FLAC%2C%20OGG%2C%20AAC%20y%20m%C3%A1s.)sirve para manipular metadatos de archivos de audio. Permite leer, escribir y modificar etiquetas de metadatos en diversos formatos, como MP3, FLAC, OGG, y muchos otros, esto es para que la imagen del Vídeo mp4 quede en el mp3.

## Paso 3.2: Instalar yt-dlp en Linux

Para Ubuntu y sabores, para Linux Mint y otros
 semejantes desde PPA (del siguiente tutorial solo usa la indicación del PPA):

**Instalar "Media Downloader" y "yt-dlp" para descarga audios (en mp3) y videos (mp4) de youtube con en MX Linux, Ubuntu, Linux Mint, otros**  
[https://facilitarelsoftwarelibre.blogspot.com/2024/01/descarga-videos-y-audios-de-youtube-con-media-downloader-en-mx-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2024/01/descarga-videos-y-audios-de-youtube-con-media-downloader-en-mx-linux.html)  

y en Debian y otros basados en este, desde este tutorial:

**Instalar el repositorio de MX Linux en Debian 12, 11, 10 y Sistemas Operativos  Linux basados en el, y el instalador MX Instalar paquetes para instalar Ksnip, yt-dlp, otros**
[https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html)

y para **MX Linux** (no se si en los paquetes de **antiX** también esté) pues ya viene listo para instalar, igual las instrucciones de instalación  están en la entrada.

Para otros Linux debe averiguar según su distribución.

## Paso 4.1: Mantener yt-dlp actualizado en Termux

Es recomendable mantener**yt-dlp**actualizado para aprovechar las últimas funciones y correcciones. Este comando es para usarlo después, para actualizarlo:

```bash
python3 -m pip install -U "yt-dlp[default]"
```

Este comando debemos de usarlo con cierta frecuencia, puede ser una vez al mes o una vez cada dos meses, es para ver si han enviado alguna actualización y aplicarla, debido a que sino se hace esto, es posible que ya no se pueda descargar desde Youtube.

## Paso 4.1: Mantener yt-dlp actualizado en Linux

Si instaló yt-dlp en Ubuntu, Linux Mint con el PPA este se acualizará cuando envien una actualización y usted actualice el sistema, y si lo instaló en Debian, MX u otros como se indica en ese tutorial debe revisar dónde está el paquete más actual.

**Nota**: Por un caso, no piense que se puede instalar yt-dlp desde pip, bueno si se puede en Linux pero habría que crear un entorno virtual venv y eso es todo un trámite, y una gran demora, no es necesario si ya está en los paquetes del Sistema.

## Paso 5: Acceder al almacenamiento interno de Android

En tu celular Android, para descargar con yt-dlp desde Termux archivos directamente en tu almacenamiento interno, configura los permisos de acceso con:

```bash
termux-setup-storage
```

Sigue los pasos y quedará listo.

Luego, navega al directorio compartido con uno de los siguientes métodos:

```bash
cd /sdcard
```

O bien:

```bash
cd storage/shared
```

Y por si lo necesitas, para verificar tu ubicación actual, usa:

```bash
pwd
```

sólo allí debes descargar los videos. Esto y otras indicaciones están explicadas en el anterior [tutorial](https://github.com/wachin/Instalar-git-en-Android-con-Termux).

# Descargar vídeos (junto con su audio) en formato mp4

Usa el siguiente comando para descargar un video con audio en formato**.mp4** (es que si no se hace esto sólo de descarga el vídeo sin el audio):

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>
```

**Explicación del comando:**

1. **-f “bv*****+ba”**: Selecciona el mejor
formato de video (**bv***) y lo combina con el mejor formato de
audio (**ba**).
2. **-S ext:mp4**: Prioriza los formatos con extensión**.mp4**.
3. **–merge-output-format mp4**: Garantiza que el archivo
final sea un**.mp4**, pero también puedes poner otro formato
de salida: mkv, webm, flv, avi, mov
4. **<URL_DEL_VIDEO>**: Reemplaza esto con la URL del
video que deseas descargar

## **Formatos de video que**yt-dlp**puede generar (con ayuda de**ffmpeg**)**

Cuando usas**--merge-output-format**, los formatos más comunes que puedes usar son:

* **mp4**Muy compatible con casi todos los dispositivos y navegadores.
* **mkv**Flexible, soporta múltiples pistas de audio, subtítulos, capítulos, etc.
* **webm**Formato abierto, bien soportado por navegadores.
* **flv**Antiguo formato usado para streaming (menos común ahora).
* **avi**Formato más viejo; no recomendado para contenido moderno.
* **mov**Usado por Apple/QuickTime.

si deseas ver todos los formatos disponibles pon:

```bash
ffmpeg -muxers
```

## Ejemplo práctico de descarga de vídeo:

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 https://www.youtube.com/watch?v=example
```

Verifica que el archivo se haya descargado correctamente:

```bash
ls
```

allí deberás ver los archivos, claro también los puedes ver con el
administrador de archivos de Android

# Micro Resumen de descarga

Solo tengan en bloque de notas como [keep.google.com](http://keep.google.com) u otro, los siguientes comandos, en texto plano, pues es para que pueda reemplazar las url con las suyas:

```
---
✔️ DESCARGAR MP3 de YouTube

yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata https://youtube.com/watch?v=9u_kg7y_M5E&si=YhG-YkMSyIrmEY_R

------------------------------

✔️ DESCARGAR MP4 de Facebook

yt-dlp -v -f "bv*+ba" -S ext:mp4 https://www.facebook.com/share/p/18BBF9fFT4/ 

------------------------------

✔️ Desde TikTok

yt-dlp https://vt.tiktok.com/ZSmP3VcUg/

------------------------------

✔️ DESCARGAR MP4 DE YOUTUBE

yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 https://youtube.com/watch?v=MjrrtaCWNzM&si=woAcBz3RwW_5YnMJ

------------------------------

```

una vez que hayan realizado el reemplazo, copien el código a Termux y ejecutarlo.

Dios les bendiga

# Cómo instalar yt-dlp en Termux en Android para descargar videos, audio (MP3) de YouTube, Facebook, Tiktok, Instagram, Twitter y otros

`yt-dlp` es una bifurcación (fork) de `youtube-dl`, una herramienta popular de línea de comandos utilizada para descargar videos de YouTube, Facebook, Tiktok, Instagram, Twitter y otros sitios web, desde la terminal. `yt-dlp` incluye características adicionales, mejoras en la funcionalidad original y soporte para más plataformas. Es una herramienta poderosa para gestionar contenido multimedia desde diversas plataformas.

**Nota**: Este tutorial es para celulares con Android, si deseas instalar yt-dlp en Linux aconsejo [este tutorial.](https://facilitarelsoftwarelibre.blogspot.com/2024/01/descarga-videos-y-audios-de-youtube-con-media-downloader-en-mx-linux.html)

## Paso 1: Instalar Termux

Debemos instalar Termux en Android pero no la versión que viene en la Play Store sino la versión completa, esta está en los celulares Xiaomi donde viene disponible en el gestor de software de esos celulares, pero no en otros como los SANSUMG. Vea la siguiente entrada con todas las explicaciones, para que pueda instalar Termux en su Celular con Adroid:

**Tutorial: Uso de Git en Termux para Android**  
[https://github.com/wachin/Instalar-git-en-Android-con-Termux](https://github.com/wachin/Instalar-git-en-Android-con-Termux)

Si has seguido bien mi tutorial deberás haber usado:

```bash
pkg update
```

y recomiendo usar un solo repositorio de los paquetes Termux, yo uso Grimler, y bueno allí están las explicaciones.

## Paso 2: Instalar las dependencias necesarias

Para usar `yt-dlp`, necesitarás Python y FFmpeg. Ejecuta el siguiente comando para instalar esos paquetes:

```bash
pkg install python ffmpeg -y
```

Donde: 

\- `python`: Es necesario para ejecutar `yt-dlp`. 

\- `ffmpeg`: Es una herramienta esencial para fusionar video y audio.

## Paso 3: Instalar yt-dlp

Una vez instaladas las dependencias, instala **yt-dlp** y **mutagen** usando **pip**:

```bash
python -m pip install yt-dlp mutagen
```

El paquete de [Python mutagen](https://products.documentprocessing.com/es/metadata/python/mutagen/#:~:text=Mutagen%20es%20una%20biblioteca%20Python%20potente%20y,incluidos%20MP3%2C%20FLAC%2C%20OGG%2C%20AAC%20y%20m%C3%A1s.) sirve para manipular metadatos de archivos de audio. Permite leer, escribir y modificar etiquetas de metadatos en diversos formatos, como MP3, FLAC, OGG, y muchos otros, esto es para que la imagen del Vídeo mp4 quede en el mp3.

## Paso 4: Mantener yt-dlp actualizado

Es recomendable mantener `yt-dlp` actualizado para aprovechar las últimas funciones y correcciones. Este comando es para usarlo después, para actualizarlo:

```bash
python3 -m pip install -U "yt-dlp[default]"
```

Este comando debemos de usarlo con cierta frecuencia, puede ser una vez al mes o una vez cada dos meses, es para ver si han enviado alguna actualización y aplicarla, debido a que sino se hace esto, es posible que ya no se pueda descargar desde Youtube.

## Paso 5: Acceder al almacenamiento interno

Para descargar archivos directamente en tu almacenamiento interno, configura los permisos de acceso con:

```bash
termux-setup-storage
```
Luego, navega al directorio compartido con uno de los siguientes métodos:
```bash
cd /sdcard
```
O bien:
```bash
cd storage/shared
```
Para verificar tu ubicación actual, usa:
```bash
pwd
```
sólo allí debes descargar los videos. Esto y otras indicaciones están explicadas en el anterior tutorial.

  

# Descargar vídeos con audio en formato mp4

Usa el siguiente comando para descargar un video con audio en formato `.mp4` (es que si no se hace esto sólo de descarga el vídeo sin el audio):

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>
```

**Explicación del comando:**  

1. **-f "bv`*`+ba"**  : Selecciona el mejor formato de video (`bv*`) y lo combina con el mejor formato de audio (`ba`). 
2. **-S ext:mp4**: Prioriza los formatos con extensión `.mp4`. 
3. **--merge-output-format mp4**: Garantiza que el archivo final sea un `.mp4`, pero también puedes poner otro formato de salida: mkv, webm, flv, avi, mov 
4. **<URL_DEL_VIDEO>**: Reemplaza esto con la URL del video que deseas descargar

## 🎥 **Formatos de video que `yt-dlp` puede generar (con ayuda de `ffmpeg`)**

Cuando usas `--merge-output-format`, los formatos más comunes que puedes usar son:

| Formato |                               Descripción                                |
| ------- | ------------------------------------------------------------------------ |
| `mp4`   | Muy compatible con casi todos los dispositivos y navegadores.            |
| `mkv`   | Flexible, soporta múltiples pistas de audio, subtítulos, capítulos, etc. |
| `webm`  | Formato abierto, bien soportado por navegadores.                         |
| `flv`   | Antiguo formato usado para streaming (menos común ahora).                |
| `avi`   | Formato más viejo; no recomendado para contenido moderno.                |
| `mov`   | Usado por Apple/QuickTime.                                               |

si deseas ver todos los formatos disponibles pon:

```bash
ffmpeg -muxers
```
   

## Ejemplo práctico:

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 https://www.youtube.com/watch?v=example
```

Verifica que el archivo se haya descargado correctamente:
```bash
ls
```
allí deberás ver los archivos, claro también los puedes ver con el administrador de archivos de Android

## Descargar resumiendo el nombre de los archivos

A veces hay nombres de archivos que son muy largos y tienen en el nombre caracteres extraños, pero agregando la siguiente línea al final del comando eliminarás todo aquello:

```bash
-o "%(title)s.%(ext)s" --restrict-filenames
```

**Explicación de cada parte del comando:**

1.  **\-o "%(title)s.%(ext)s"**: Esta opción define el formato del nombre del archivo de salida.
    *   `%(title)s`: Es una variable que se reemplaza con el título del video.
    *   `%(ext)s`: Es una variable que se reemplaza con la extensión del archivo (mp4, en este caso).
    *   Las comillas son necesarias para que el sistema reconozca el patrón completo.
2.  **\--restrict-filenames**:
    
    *   Esta es la parte clave para resolver el problema de que algunos videos tienen caracteres extraños ya que limita los caracteres permitidos en los nombres de archivo a caracteres ASCII básicos.
    *   Reemplaza espacios con guiones bajos.
    *   Elimina o sustituye caracteres especiales, emojis, comillas y otros símbolos que podrían causar problemas en el sistema de archivos.
    *   Hace que los nombres de archivo sean compatibles con la mayoría de los sistemas operativos y entornos.

**Al añadirla queda así**

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 -o "%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```

  

# Descargar vídeo desde TikTok, Facebook, Instagram, Twitter

Para descargar un vídeo de TikTok, Facebook, Instagram, Twitter, usa el siguiente comando (en estas redes sociales sino puedes obtener el link fácilmente solo da clic en la opción "Compartir" el video y allí busca, y debe haber una opción para copiar el enlace. En Twitter dale clic derecho al vídeo y copia el enlace)

**Ejemplo práctico:**

```bash
yt-dlp https://www.tiktok.com/@usuario/video/1234567890
```

pero yo no lo uso porque se descargan videos con algunos caracteres raros que a veces causan problemas, por eso mejor lo siguiente:

## Para descargar vídeo resumiendo el nombre del archivo

A veces hay nombres de archivos que son muy largos y tienen en el nombre caracteres extraños, pero con el siguiente comando eliminarás todo aquello:

```bash
yt-dlp -o "%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```
al poner el comando espera un momento, y funcionará

**Explicación de cada parte del comando:**

1.  **yt-dlp**: Es el nombre del programa que estás utilizando para descargar videos.
2.  **\-o "%(title)s.%(ext)s"**: Esta opción define el formato del nombre del archivo de salida.
    *   `%(title)s`: Es una variable que se reemplaza con el título del video.
    *   `%(ext)s`: Es una variable que se reemplaza con la extensión del archivo (se descargará con el formato de video de la plataforma, generalmente en mp4).
    *   Las comillas son necesarias para que el sistema reconozca el patrón completo.
3.  **\--restrict-filenames**:
    *   Esta es la parte clave para resolver el problema de que algunos videos tienen caracteres extraños ya que limita los caracteres permitidos en los nombres de archivo a caracteres ASCII básicos.
    *   Reemplaza espacios con guiones bajos.
    *   Elimina o sustituye caracteres especiales, emojis, comillas y otros símbolos que podrían causar problemas en el sistema de archivos.
    *   Hace que los nombres de archivo sean compatibles con la mayoría de los sistemas operativos y entornos.
4.  **<URL\_DEL\_VIDEO>**: La dirección del video que quieres descargar.

## Ejemplo práctico

Supongamos que deseas descargar el siguiente video:

```bash
yt-dlp -o "%(title)s.%(ext)s" --restrict-filenames https://x.com/i/status/1630244294484443137
```


**Otras variables útiles que podrías usar en el patrón de salida (opcional)**

Lo siguiente es solamente opcional, pues podría dar errores de descarga

*   `%(uploader)s`: Nombre del usuario que subió el video.
*   `%(id)s`: ID único del video.
*   `%(upload_date)s`: Fecha de subida (formato AAAAMMDD).

Por ejemplo, si quisieras incluir la fecha y el usuario, podrías usar:

```bash
yt-dlp -o "%(upload_date)s-%(uploader)s-%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```

pero lo malo de este comando es que puede dejar el nombre del archivo muy largo y podría no poder descargarse

## Deseo elegir la cantidad de los caracteres del nombre del archivo  

Si el nombre resultante de la descarga es muy largo, para solucionar esto podemos usar el siguiente comando que limita el título a los primeros 30 caracteres:

```bash
yt-dlp -o "%(upload_date)s-%(uploader).30s-%(title).30s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```

La sintaxis `.30s` después de una variable (allí hay dos variables) limita esa parte a 30 caracteres.

Puedes ajustar este número según tus preferencias, por ejemplo:

```bash
yt-dlp -o "%(upload_date)s-%(uploader).15s-%(title).40s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```

Esto tomaría los primeros 15 caracteres del nombre del canal y los primeros 40 del título. Y así se pueden hacer otros experimentos.

  

# Descargar vídeos de otros sitios web

`yt-dlp` también es compatible con otros sitios web. Simplemente cambia la URL en el comando:

```bash
yt-dlp -o "%(title)s.%(ext)s" "https://www.example.com/video"
```

También puedes intentar añadir al comando alguno de los anteriormente explicados si los necesite.

  

# Descargar solo audio, en formato mp3 u otros

Para descargar solo el audio en formato mp3, usa el siguiente comando:

```bash
yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata <URL_DEL_VIDEO>
```

**Explicación de las opciones:**

1. **\--audio-format mp3:** elegimos el formato mp3, y si deseamos descargar audio en otros formatos podemos cambiarlo por: `m4a`, `aac`, `flac`, etc.
2. **\--embed-thumbnail:** descarga la miniatura del video y la incrusta como imagen de portada en el archivo MP3 (necesita ffmpeg y mutagen para funcionar).
3. **\--add-metadata:** añade metadatos como el título, artista, etc., si están disponibles.
4. **<URL\_DEL\_VIDEO>**: La dirección del video que quieres descargar.
## 🎵 Formatos que `yt-dlp` puede convertir con `--audio-format`:

**mp3** Muy compatible. Perfecto para reproductores antiguos.

**m4a** Alta calidad y buena compresión. Recomendado para la mayoría de los usuarios.

**aac** Similar a m4a pero sin envoltura MP4. Buena calidad y ampliamente soportado.

**flac** Audio sin pérdida (lossless). Muy pesado, ideal para audiófilos que quieren la mejor calidad.

**wav** Sin compresión, lo que genera archivos grandes. Se usa en contextos técnicos o de producción.

**opus** Muy eficiente a bajo bitrate. Ideal para voz o archivos con limitaciones de espacio.

**ogg** Formato contenedor abierto que suele usar el códec Vorbis. Buena calidad y compresión, pero no es tan compatible como mp3 o m4a.

**alac** Apple Lossless. Poco común fuera del ecosistema Apple, útil si se requiere calidad sin pérdida y compatibilidad con productos de Apple.

**ac3** Formato Dolby Digital. Usado en DVDs y contenido con audio multicanal. No es recomendable para música general.

**aiff** Alternativa sin compresión a WAV, más utilizada en entornos Apple o producción de audio profesional.

**amr** Optimizado para voz en baja calidad, como en grabadoras antiguas. No es ideal para música.

> 🔧 Esto requiere tener `ffmpeg` correctamente instalado

**Ejemplo práctico:**

```bash
yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata https://youtu.be/JMYFz-uoOUw?si=h_MFWXsiukrKD3_Y
```
Se descargarán algunos archivos, debes esperar a que el proceso termine pues debe quedar sólo un archivo, el de audio, con la imagen de la carátula insertada.

## Para descargar resumiendo el nombre de los archivos

Opcionalmente si necesitas que el archivo no contenga caracteres extraños, usa:

```bash
yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>
```
**Ejemplo práctico:**

```bash
yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s" --restrict-filenames https://youtu.be/JMYFz-uoOUw?si=h_MFWXsiukrKD3_Y
```

# Descargar sólo audio en formato mp3 u otros, con diferentes calidades

`yt-dlp` es una herramienta muy flexible que permite descargar audio en varios formatos y calidades. A continuación, se explica cómo descargar videos en formato MP3 con opciones específicas de calidad.

## Cómo se qué calidad del vídeo tenía cuando fue subido?

Antes de continuar explico que un video en Youtube puede haber sido subido con muy buena calidad o con una calidad baja, pero no podemos saber que yo sepa a qué calidad de audio fue subido un video, ejemplo yo subí este:

**20220814 Miguel Pelaez presentacion del Ministerio Gedeones Internacionales en Guayaquil**  
[https://youtu.be/60AecDF_Kqg?si=Zw2OdfPeBvSjFZfF](https://youtu.be/60AecDF_Kqg?si=Zw2OdfPeBvSjFZfF)

y al dar clic en la **Tuerca** y en **Calidad** indico lo que podemos ver que es la calidad de la imagen del video:  

![20250404 Captura de pantalla de la información de la caldad de un video que subí a Youtube](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiryssasgZn91yCzSsb3QBk236Uir_9lfkX2aCyxD3YTRMLVZlyK2J-gYoDsy51Lhod7ngX4JXi1s63E4kwbGOswZ7gNk3c5A7OTZohhmS2fsHn-baEoPOTYclBXCBZcQxgin328f2zx5nfIZo9N_ljOdHpLUWXmoTieVd-mvH3GL2UcKVHc92ciEgFbBQ/s898/20250404-112310%20informaci%C3%B3n%20de%20la%20caldad%20de%20un%20video.png)

y para saber cual es la **calidad del audio**, yo lo que hago es escuchar el video y presuponer según lo que escucho qué calidad de audio tendrá (lo mejor es tener un buen auricular).

Entonces, descargar un vídeo en formato MP3 con una calidad específica, usa el siguiente comando:

```bash
yt-dlp -x --audio-format mp3 --audio-quality <CALIDAD> <URL_DEL_VIDEO>
```

**Explicación del comando:** 

1. **-x**: Extrae solo el audio.
2. **--audio-format mp3**: Especifica que el formato de salida debe ser mp3 que es el más usado, pero también puede ser otro, como: m4a, , aac, flac, wav, opus, alac.
3. **--audio-quality <CALIDAD>**: Define la calidad del audio en kbps (kilobits por segundo).
4. **<URL_DEL_VIDEO>**: Reemplaza esto con la URL del video que deseas descargar.

  

## Ejemplo práctico

Supongamos que deseas descargar el siguiente video en formato MP3 con una calidad de 128 kbps:

```bash
yt-dlp -x --audio-format mp3 --audio-quality 128K https://www.youtube.com/watch?v=example
```

  

## Calidades disponibles

Aquí tienes una lista de las calidades que puedes especificar:

*   `320K`: Calidad máxima (320 kbps)
*   `256K`: Alta calidad (256 kbps)
*   `224K`: Buena calidad (224 kbps)
*   `192K`: Calidad estándar (192 kbps)
*   `160K`: Media calidad (160 kbps)
*   `144K`: Baja calidad (144 kbps)
*   `128K`: Calidad promedio (128 kbps)
*   `112K`: Baja calidad (112 kbps)
*   `96K`: Muy baja calidad (96 kbps)
*   `80K`: Calidad mínima aceptable (80 kbps)
*   `64K`: Calidad muy baja (64 kbps)
*   `56K`: Calidad extremadamente baja (56 kbps)
*   `48K`: Calidad para voz (48 kbps) (La uso para compartir predicas largas por Whatsapp)
*   `40K`: Calidad mínima para voces claras (40 kbps)

**Nota:** Las calidades más bajas son ideales para archivos de voz o cuando necesitas ahorrar espacio.

**2. Descargar videos desde otras plataformas**

`yt-dlp` no solo funciona con YouTube, sino también con muchas otras plataformas como Facebook, Instagram, TikTok y páginas web. A continuación, se explica cómo hacerlo.

  


# Notas adicionales

*   **Compatibilidad:** Algunas plataformas pueden requerir autenticación o cookies para descargar contenido. En esos casos, consulta la documentación oficial de `yt-dlp` para obtener instrucciones específicas.
*   **Velocidad de descarga:** Si experimentas problemas de velocidad, verifica tu conexión a internet. También puedes intentar usar un servidor proxy o VPN si sospechas limitaciones geográficas.
*   **Depuración:** Si encuentras problemas durante la descarga, agrega la opción `-v` al comando para obtener información detallada, ejemplos:

```bash
yt-dlp -v -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>
```

o 

```bash
yt-dlp -v -x --audio-format mp3 --audio-quality 128K <URL_DEL_VIDEO>
```

# Un Versículo Bíblico 🌟

> **“Y estas palabras que yo te mando hoy, estarán sobre tu corazón; y las repetirás a tus hijos, y hablarás de ellas estando en tu casa, y andando por el camino, y al acostarte, y cuando te levantes.”**  
> — **Deuteronomio 6:6-7** 📖✨

Este versículo nos recuerda la importancia de **compartir conocimientos y sabiduría** con los demás, especialmente con aquellos que están dispuestos a aprender. Al crear tutoriales como este, estamos compartiendo lo que hemos aprendido (nuestro “conocimiento”) para que otros puedan beneficiarse de ello, tal como se menciona en este pasaje bíblico.

Al usar herramientas como `Termux`, y `yt-dlp`, estamos aprovechando la tecnología moderna para **facilitar el acceso a la información** desde los celulares Android, lo cual es una forma práctica de aplicar este principio bíblico en nuestra vida diaria. 🌍💻

Dios les bendiga

# Consultas

**"Format Selection and Output Template Options." GitHub Repository.**  
[https://github.com/yt-dlp/yt-dlp#output-template](https://github.com/yt-dlp/yt-dlp#output-template)

**"Termux Package Management." Termux Wiki.**  
[https://wiki.termux.com/wiki/Package\_Management](https://wiki.termux.com/wiki/Package_Management)

**"File System Limitations on Android." Android Developer Documentation.**  
[https://developer.android.com/guide/topics/data/data-storage](https://developer.android.com/guide/topics/data/data-storage)

**Termux Setup Storage**  
[https://wiki.termux.com/wiki/Termux-setup-storage](https://wiki.termux.com/wiki/Termux-setup-storage)

**yt-dlp en Reddityt-dlp en Reddit**  
[https://www.reddit.com/r/youtubedl/comments/pr7ruk/ytdlp_on_termux/](https://www.reddit.com/r/youtubedl/comments/pr7ruk/ytdlp_on_termux/)

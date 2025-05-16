### Cómo instalar yt-dlp en Termux en Android para descargar videos, audio (MP3) de YouTube, Facebook, Tiktok, Instagram y otros

Publicadas por [Washington Indacochea Delgado](https://www.blogger.com/profile/17773143494819856315 "author profile")  [abril 04, 2025](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-yt-dlp-en-termux-para-descargar-vieos-audios-de-youtube-y-otros-sitios.html "permanent link")

`**Nota**: Este tutorial es para celulares con Android, si deseas instalar yt-dlp en Linux aconsejo [este tutorial.   ](https://facilitarelsoftwarelibre.blogspot.com/2024/01/descarga-videos-y-audios-de-youtube-con-media-downloader-en-mx-linux.html)`

Ahora sí, sigamos: `yt-dlp` es una bifurcación (fork) de `youtube-dl`, una herramienta popular de línea de comandos utilizada para descargar videos de YouTube y otros sitios web. `yt-dlp` incluye características adicionales, mejoras en la funcionalidad original y soporte para más plataformas. Es una herramienta poderosa para gestionar contenido multimedia desde diversas plataformas.

Antes de continuar con este tutorial, debes revisar mi guía sobre cómo instalar y usar **Git en Termux**, ya que contiene información imprescindible sobre la instalación de Termux Full y configuración:

[Tutorial: Uso de Git en Termux para Android](https://github.com/wachin/Instalar-git-en-Android-con-Termux)

## **Paso 1: Actualizar los repositorios de Termux**

Abre Termux y ejecuta el siguiente comando para actualizar los paquetes disponibles:
```bash
    pkg update
```
Este proceso puede tardar unos minutos. Cuando te pida confirmación, responde con:

    y

Es posible que te haga varias preguntas; sigue respondiendo con `y` hasta que el proceso termine.

## **Paso 2: Instalar las dependencias necesarias**

Para usar `yt-dlp`, necesitarás Python y FFmpeg. Ejecuta el siguiente comando para instalarlos:

    pkg install python ffmpeg -y

Aquí: 

\- `python`: Es necesario para ejecutar `yt-dlp`. 

\- `ffmpeg`: Es una herramienta esencial para fusionar video y audio.

## **Paso 3: Instalar yt-dlp**

Una vez instaladas las dependencias, instala `yt-dld y mutagen` usando `pip`:

    python -m pip install yt-dlp mutagen

## **Paso 4: Mantener yt-dlp actualizado**

Es recomendable mantener `yt-dlp` actualizado para aprovechar las últimas funciones y correcciones. Usa el siguiente comando para actualizarlo:

    python3 -m pip install -U "yt-dlp[default]"

**Importante**.- Este comando debemos de volverlo a usar con cierta frecuencia, puede ser una vez al mes o una vez cada dos meses, es para ver si han enviado una actualización y aplicarla, debido a que sino se hace esto es posible que ya no se pueda descargar desde Youtube, porque ellos a veces hacen cambios.

## **Paso 5: Configurar el repositorio de Termux**

Para evitar problemas con los repositorios, asegúrate de usar un solo repositorio confiable. Puedes verificar y cambiar tu repositorio con el siguiente comando:

    termux-change-repo

Cuando aparezca el menú, selecciona la opción para elegir manualmente un repositorio (por ejemplo, Grimler o BFSU). Luego, actualiza los paquetes nuevamente:

    pkg update

Recomendación: Revisa los repositorios disponibles en el [tutorial de Git en Termux](https://github.com/wachin/Instalar-git-en-Android-con-Termux).


## **Paso 6: Acceder al almacenamiento interno**

Para descargar archivos directamente en tu almacenamiento interno, configura los permisos de acceso con:

    termux-setup-storage

Luego, navega al directorio compartido con uno de los siguientes métodos:

    cd /sdcard

O bien:

    cd storage/shared

Para verificar tu ubicación actual, usa:

    pwd


## **Paso 7: Descargar contenido multimedia con yt-dlp**

### **Descargar videos con audio (formato MP4)**

Usa el siguiente comando para descargar un video con audio en formato `.mp4`:

    yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>

Explicación del comando: 

`**-f "bv*+ba"**`: Selecciona el mejor formato de video (`bv*`) y lo combina con el mejor formato de audio (`ba`). 

`**-S ext:mp4**`: Prioriza los formatos con extensión `.mp4`. 

`**--merge-output-format mp4**`: Garantiza que el archivo final sea un `.mp4`. 

`**<URL_DEL_VIDEO>**`: Reemplaza esto con la URL del video que deseas descargar.

**Ejemplo práctico:**

    yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 https://www.youtube.com/watch?v=example

Verifica que el archivo se haya descargado correctamente:

    ls


### **Descargar solo audio, formato MP3**

Para descargar solo el audio en formato MP3, usa el siguiente comando:

yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata <URL\_DEL\_VIDEO\>

**Explicación de las opciones nuevas:**

**\--embed-thumbnail:** descarga la miniatura del video y la incrusta como imagen de portada en el archivo MP3 (necesita ffmpeg y mutagen para funcionar).

**\--add-metadata: añade metadatos como el título, artista, etc., si están disponibles.**

**Ejemplo práctico:**

yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata https://youtu.be/JMYFz-uoOUw?si=h\_MFWXsiukrKD3\_Y

También puedes descargar audio en otros formatos como `m4a`, `aac`, `flac`, etc., cambiando la extensión en el comando.


### **Descargar videos de otros sitios web**

`yt-dlp` también es compatible con otros sitios web. Simplemente cambia la URL en el comando:

    yt-dlp -o "%(title)s.%(ext)s" "https://www.example.com/video"


## **Notas adicionales**

-   **Velocidad de descarga:** Si experimentas problemas de velocidad, verifica tu conexión a internet. También puedes intentar usar un servidor proxy o VPN si sospechas limitaciones geográficas.
    
-   **Depuración:** Si encuentras problemas durante la descarga, agrega la opción `-v` al comando para obtener información detallada:
    

    yt-dlp -v -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>


## **Consultas útiles**

-   [Termux Setup Storage](https://wiki.termux.com/wiki/Termux-setup-storage)
-   [yt-dlp en Reddit](https://www.reddit.com/r/youtubedl/comments/pr7ruk/ytdlp_on_termux/)


Con estos pasos, estarás listo para descargar videos, audio y otros contenidos multimedia desde YouTube y otros sitios web utilizando `yt-dlp` en Termux en Android. ¡Disfruta de tus descargas!


# **Descargar videos en formato MP3 con diferentes calidades**

`yt-dlp` es una herramienta muy flexible que permite descargar audio en varios formatos y calidades. A continuación, se explica cómo descargar videos en formato MP3 con opciones específicas de calidad.

## **1\. Descargar audio en formato MP3 con calidad específica**

Antes de continuar explico que un video en youtube puede haber sido subido con muy buena calidad o con una calidad baja pero no podemos saber que yo sepa a qué calidad de audio fue subido un video, ejemplo yo subí este:

**20220814 Miguel Pelaez presentacion del Ministerio Gedeones Internacionales en Guayaquil**  
[https://www.youtube.com/watch?v=60AecDF\_Kqg](https://www.youtube.com/watch?v=60AecDF_Kqg)

y al dar clic donde indico lo que podemos ver es la calidad de la imagen del video:  

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiryssasgZn91yCzSsb3QBk236Uir_9lfkX2aCyxD3YTRMLVZlyK2J-gYoDsy51Lhod7ngX4JXi1s63E4kwbGOswZ7gNk3c5A7OTZohhmS2fsHn-baEoPOTYclBXCBZcQxgin328f2zx5nfIZo9N_ljOdHpLUWXmoTieVd-mvH3GL2UcKVHc92ciEgFbBQ/s16000-rw/20250404-112310%20informaci%C3%B3n%20de%20la%20caldad%20de%20un%20video.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiryssasgZn91yCzSsb3QBk236Uir_9lfkX2aCyxD3YTRMLVZlyK2J-gYoDsy51Lhod7ngX4JXi1s63E4kwbGOswZ7gNk3c5A7OTZohhmS2fsHn-baEoPOTYclBXCBZcQxgin328f2zx5nfIZo9N_ljOdHpLUWXmoTieVd-mvH3GL2UcKVHc92ciEgFbBQ/s898/20250404-112310%20informaci%C3%B3n%20de%20la%20caldad%20de%20un%20video.png)

yo lo que hago es escuchar el video y presuponer según lo que escucho qué calidad de audio tendrá (lo mejor es tener un buen auricular).

Para descargar un video en formato MP3 con una calidad específica, usa el siguiente comando:

    yt-dlp -x --audio-format mp3 --audio-quality <CALIDAD> <URL_DEL_VIDEO>

Explicación del comando: 

`**-x**`: Extrae solo el audio. 

`**--audio-format mp3**`: Especifica que el formato de salida debe ser MP3. 

`**--audio-quality <CALIDAD>**`: Define la calidad del audio en kbps (kilobits por segundo). 

`**<URL_DEL_VIDEO>**`: Reemplaza esto con la URL del video que deseas descargar.

### **Ejemplo práctico**

Supongamos que deseas descargar el siguiente video en formato MP3 con una calidad de 128 kbps:

    yt-dlp -x --audio-format mp3 --audio-quality 128K https://www.youtube.com/watch?v=example

### **Calidades disponibles**

Aquí tienes una lista de las calidades que puedes especificar:

-   `320K`: Calidad máxima (320 kbps)
-   `256K`: Alta calidad (256 kbps)
-   `224K`: Buena calidad (224 kbps)
-   `192K`: Calidad estándar (192 kbps)
-   `160K`: Media calidad (160 kbps)
-   `144K`: Baja calidad (144 kbps)
-   `128K`: Calidad promedio (128 kbps)
-   `112K`: Baja calidad (112 kbps)
-   `96K`: Muy baja calidad (96 kbps)
-   `80K`: Calidad mínima aceptable (80 kbps)
-   `64K`: Calidad muy baja (64 kbps)
-   `56K`: Calidad extremadamente baja (56 kbps)
-   `48K`: Calidad para voz (48 kbps)
-   `40K`: Calidad mínima para voces claras (40 kbps)

**Nota:** Las calidades más bajas son ideales para archivos de voz o cuando necesitas ahorrar espacio.

## **2\. Descargar videos desde otras plataformas**

`yt-dlp` no solo funciona con YouTube, sino también con muchas otras plataformas como Facebook, Instagram, TikTok y páginas web. A continuación, se explica cómo hacerlo.

  

### **TikTok, Facebook, Instagram**

Para descargar un video de TikTok, Facebook, Instagram usa el siguiente comando (en estas redes sociales sino puedes obtener el link fácilmente solo da clic en la opción "Compartir" el video y allí busca y debe haber una opción para copiar el enlace):

    yt-dlp <URL_DEL_VIDEO>

**Ejemplo práctico:**

    yt-dlp https://www.tiktok.com/@usuario/video/1234567890

pero yo no lo uso porque se descargan videos con algunos caracteres raros que a veces causan problemas, por eso mejor lo siguiente:

**Para descargar resumiendo el nombre de los archivos**

Esto es importante porque a veces hay nombres de archivos que son muy largos y tienen en el nombre caracteres extraños, pero con el siguiente comando eliminarás todo aquello:

    yt-dlp --output "%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO> 

al poner el comando parece que desaparece y no pasa nada, pero si, solo hay que esperar un poco para que descargue

**Explicación de cada parte del comando:**

1.  **yt-dlp**: Es el nombre del programa que estás utilizando para descargar videos.
    
2.  **\--output "%(title)s.%(ext)s"** (o en versión corta: **\-o "%(title)s.%(ext)s"**):
    
    -   Esta opción define el formato del nombre del archivo de salida.
    -   `%(title)s`: Es una variable que se reemplaza con el título del video.
    -   `%(ext)s`: Es una variable que se reemplaza con la extensión del archivo (mp4, en este caso).
    -   Las comillas son necesarias para que el sistema reconozca el patrón completo.
3.  **\--restrict-filenames**:
    
    -   Esta es la parte clave para resolver el problema de que algunos videos tienen caracteres extraños ya que limita los caracteres permitidos en los nombres de archivo a caracteres ASCII básicos.
    -   Reemplaza espacios con guiones bajos.
    -   Elimina o sustituye caracteres especiales, emojis, comillas y otros símbolos que podrían causar problemas en el sistema de archivos.
    -   Hace que los nombres de archivo sean compatibles con la mayoría de los sistemas operativos y entornos.
4.  **<URL\_DEL\_VIDEO>**: La dirección del video que quieres descargar.
    

**Otras variables útiles que podrías usar en el patrón de salida (opcional)**

Lo siguiente es solamente opcional, pues podría dar errores de descarga

-   `%(uploader)s`: Nombre del usuario que subió el video.
-   `%(id)s`: ID único del video.
-   `%(upload_date)s`: Fecha de subida (formato AAAAMMDD).

Por ejemplo, si quisieras incluir la fecha y el usuario, podrías usar:

    yt-dlp -o "%(upload_date)s-%(uploader)s-%(title)s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>

pero lo malo de este comando es que puede dejar el nombre del archivo muy largo y podría no poder descargarse

**Qué hago si en algún momento el video no se pueda descargar por ser muy largo su nombre**  
Para solucionar este problema, aquí un comando que limita el título a los primeros 30 caracteres:

    yt-dlp -o "%(upload_date)s-%(uploader).30s-%(title).30s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>

La sintaxis `.30s` después de una variable limita esa parte a 30 caracteres. Puedes ajustar este número según tus preferencias, por ejemplo:

    yt-dlp -o "%(upload_date)s-%(uploader).15s-%(title).40s.%(ext)s" --restrict-filenames <URL_DEL_VIDEO>

 Esto tomaría los primeros 15 caracteres del nombre del canal y los primeros 40 del título.

O si quieres un formato intermedio con más información pero todavía compacto, puedes experimentar:  

    yt-dlp -o "%(upload_date)s-%(id)s.%(ext)s" --restrict-filenames 

y así se pueden hacer otros experimentos, que podrían no funcionar.  
  

### **Páginas web genéricas**

Si encuentras un video incrustado en una página web, puedes intentar descargarlo usando `yt-dlp`. Simplemente copia la URL de la página y ejecuta el siguiente comando:

    yt-dlp <URL_DE_LA_PÁGINA_WEB>

**Ejemplo práctico:**

    yt-dlp https://www.ejemplo.com/video


## **3\. Notas adicionales**

-   **Formatos alternativos:** Si prefieres descargar el audio en otro formato (por ejemplo, AAC, FLAC, OGG), puedes cambiar el parámetro `--audio-format` al formato deseado. Ejemplo:
    
        yt-dlp -x --audio-format aac --audio-quality 128K <URL_DEL_VIDEO>
    
-   **Compatibilidad:** Algunas plataformas pueden requerir autenticación o cookies para descargar contenido. En esos casos, consulta la documentación oficial de `yt-dlp` para obtener instrucciones específicas.
    
-   **Depuración:** Si encuentras problemas durante la descarga, agrega la opción `-v` al comando para obtener información detallada sobre el proceso:
    
        yt-dlp -v -x --audio-format mp3 --audio-quality 128K <URL_DEL_VIDEO>
    

Con estos comandos y explicaciones, podrás descargar videos en formato MP3 con diferentes calidades y acceder a contenido multimedia desde diversas plataformas.

### **un Versículo Bíblico** 🌟

> **“Y estas palabras que yo te mando hoy, estarán sobre tu corazón; y las repetirás a tus hijos, y hablarás de ellas estando en tu casa, y andando por el camino, y al acostarte, y cuando te levantes.”**  
> — **Deuteronomio 6:6-7** 📖✨


### **Explicación** 🤔💡

Este versículo nos recuerda la importancia de **compartir conocimientos y sabiduría** con los demás, especialmente con aquellos que están dispuestos a aprender. Al crear tutoriales como este, estamos compartiendo lo que hemos aprendido (nuestro “conocimiento”) para que otros puedan beneficiarse de ello, tal como se menciona en este pasaje bíblico.

Al usar herramientas como `Termux`, `git` y `yt-dlp`, estamos aprovechando la tecnología moderna para **facilitar el acceso a la información** desde los celulares Android, lo cual es una forma práctica de aplicar este principio bíblico en nuestra vida diaria. 🌍💻

Dios les bendiga

### Consultas

**"Format Selection and Output Template Options." GitHub Repository.**  
[https://github.com/yt-dlp/yt-dlp#output-template](https://github.com/yt-dlp/yt-dlp#output-template)

**"Termux Package Management." Termux Wiki.**  
[https://wiki.termux.com/wiki/Package\_Management](https://wiki.termux.com/wiki/Package_Management)

**"File System Limitations on Android." Android Developer Documentation.**  
[https://developer.android.com/guide/topics/data/data-storage](https://developer.android.com/guide/topics/data/data-storage)


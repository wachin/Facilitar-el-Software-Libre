# **Cómo instalar yt-dlp en Termux para descargar videos, audio (MP3) de YouTube y otros sitios**

`yt-dlp` es una bifurcación (fork) de `youtube-dl`, una herramienta popular de línea de comandos utilizada para descargar videos de YouTube y otros sitios web. `yt-dlp` incluye características adicionales, mejoras en la funcionalidad original y soporte para más plataformas. Es una herramienta poderosa para gestionar contenido multimedia desde diversas plataformas.

Antes de continuar con este tutorial, te recomiendo revisar mi guía sobre cómo instalar y usar **Git en Termux**, ya que contiene información valiosa sobre la configuración inicial de Termux:

[Tutorial: Uso de Git en Termux para Android](https://github.com/wachin/Instalar-git-en-Android-con-Termux)

---

## **Paso 1: Actualizar los repositorios de Termux**

Abre Termux y ejecuta el siguiente comando para actualizar los paquetes disponibles:

```bash
pkg update
```

Este proceso puede tardar unos minutos. Cuando te pida confirmación, responde con:

```bash
y
```

Es posible que te haga varias preguntas; sigue respondiendo con `y` hasta que el proceso termine.

---

## **Paso 2: Instalar las dependencias necesarias**

Para usar `yt-dlp`, necesitarás Python y FFmpeg. Ejecuta el siguiente comando para instalarlos:

```bash
pkg install python ffmpeg -y
```

Aquí:
- `python`: Es necesario para ejecutar `yt-dlp`.
- `ffmpeg`: Es una herramienta esencial para fusionar video y audio.

---

## **Paso 3: Instalar yt-dlp**

Una vez instaladas las dependencias, instala `yt-dlp` usando `pip`:

```bash
python -m pip install yt-dlp
```

---

## **Paso 4: Mantener yt-dlp actualizado**

Es recomendable mantener `yt-dlp` actualizado para aprovechar las últimas funciones y correcciones. Usa el siguiente comando para actualizarlo:

```bash
python3 -m pip install -U "yt-dlp[default]"
```

---

## **Paso 5: Configurar el repositorio de Termux**

Para evitar problemas con los repositorios, asegúrate de usar un solo repositorio confiable. Puedes verificar y cambiar tu repositorio con el siguiente comando:

```bash
termux-change-repo
```

Cuando aparezca el menú, selecciona la opción para elegir manualmente un repositorio (por ejemplo, Grimler o BFSU). Luego, actualiza los paquetes nuevamente:

```bash
pkg update
```

Recomendación: Revisa los repositorios disponibles en el [tutorial de Git en Termux](https://github.com/wachin/Instalar-git-en-Android-con-Termux).

---

## **Paso 6: Acceder al almacenamiento interno**

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

---

## **Paso 7: Descargar contenido multimedia con yt-dlp**

### **Descargar videos con audio (formato MP4)**

Usa el siguiente comando para descargar un video con audio en formato `.mp4`:

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>
```

Explicación del comando:
- `-f "bv*+ba"`: Selecciona el mejor formato de video (`bv*`) y lo combina con el mejor formato de audio (`ba`).
- `-S ext:mp4`: Prioriza los formatos con extensión `.mp4`.
- `--merge-output-format mp4`: Garantiza que el archivo final sea un `.mp4`.
- `<URL_DEL_VIDEO>`: Reemplaza esto con la URL del video que deseas descargar.

**Ejemplo práctico:**

```bash
yt-dlp -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 https://www.youtube.com/watch?v=example
```

Verifica que el archivo se haya descargado correctamente:

```bash
ls
```

---

### **Descargar solo audio (formato MP3)**

Para descargar solo el audio en formato MP3, usa el siguiente comando:

```bash
yt-dlp -x --audio-format mp3 <URL_DEL_VIDEO>
```

**Ejemplo práctico:**

```bash
yt-dlp -x --audio-format mp3 https://youtu.be/g8MX3GpouE4?si=C6gwurplt06fsBe0
```

También puedes descargar audio en otros formatos como `m4a`, `aac`, `flac`, etc., cambiando la extensión en el comando.

---

### **Descargar videos de otros sitios web**

`yt-dlp` también es compatible con otros sitios web. Simplemente cambia la URL en el comando:

```bash
yt-dlp -o "%(title)s.%(ext)s" "https://www.example.com/video"
```

---

## **Notas adicionales**

- **Velocidad de descarga:** Si experimentas problemas de velocidad, verifica tu conexión a internet. También puedes intentar usar un servidor proxy o VPN si sospechas limitaciones geográficas.
  
- **Depuración:** Si encuentras problemas durante la descarga, agrega la opción `-v` al comando para obtener información detallada:

```bash
yt-dlp -v -f "bv*+ba" -S ext:mp4 --merge-output-format mp4 <URL_DEL_VIDEO>
```

---

## **Consultas útiles**

- [Termux Setup Storage](https://wiki.termux.com/wiki/Termux-setup-storage)
- [yt-dlp en Reddit](https://www.reddit.com/r/youtubedl/comments/pr7ruk/ytdlp_on_termux/)

---

Con estos pasos, estarás listo para descargar videos, audio y otros contenidos multimedia desde YouTube y otros sitios web utilizando `yt-dlp` en Termux en Android. ¡Disfruta de tus descargas!

---

# **Descargar videos en formato MP3 con diferentes calidades**

`yt-dlp` es una herramienta muy flexible que permite descargar audio en varios formatos y calidades. A continuación, se explica cómo descargar videos en formato MP3 con opciones específicas de calidad.

## **1. Descargar audio en formato MP3 con calidad específica**

Para descargar un video en formato MP3 con una calidad específica, usa el siguiente comando:

```bash
yt-dlp -x --audio-format mp3 --audio-quality <CALIDAD> <URL_DEL_VIDEO>
```

Explicación del comando:
- `-x`: Extrae solo el audio.
- `--audio-format mp3`: Especifica que el formato de salida debe ser MP3.
- `--audio-quality <CALIDAD>`: Define la calidad del audio en kbps (kilobits por segundo).
- `<URL_DEL_VIDEO>`: Reemplaza esto con la URL del video que deseas descargar.

### **Ejemplo práctico**

Supongamos que deseas descargar el siguiente video en formato MP3 con una calidad de 128 kbps:

```bash
yt-dlp -x --audio-format mp3 --audio-quality 128K https://www.youtube.com/watch?v=example
```

### **Calidades disponibles**

Aquí tienes una lista de las calidades que puedes especificar:

- `320K`: Calidad máxima (320 kbps)
- `256K`: Alta calidad (256 kbps)
- `224K`: Buena calidad (224 kbps)
- `192K`: Calidad estándar (192 kbps)
- `160K`: Media calidad (160 kbps)
- `144K`: Baja calidad (144 kbps)
- `128K`: Calidad promedio (128 kbps)
- `112K`: Baja calidad (112 kbps)
- `96K`: Muy baja calidad (96 kbps)
- `80K`: Calidad mínima aceptable (80 kbps)
- `64K`: Calidad muy baja (64 kbps)
- `56K`: Calidad extremadamente baja (56 kbps)
- `48K`: Calidad para voz (48 kbps)
- `40K`: Calidad mínima para voces claras (40 kbps)

**Nota:** Las calidades más bajas son ideales para archivos de voz o cuando necesitas ahorrar espacio.

---

## **2. Descargar videos desde otras plataformas**

`yt-dlp` no solo funciona con YouTube, sino también con muchas otras plataformas como Facebook, Instagram, TikTok y páginas web. A continuación, se explica cómo hacerlo.

### **Facebook**

Para descargar un video de Facebook, simplemente usa el siguiente comando:

```bash
yt-dlp <URL_DEL_VIDEO_DE_FACEBOOK>
```

**Ejemplo práctico:**

```bash
yt-dlp https://www.facebook.com/watch/?v=1234567890
```

### **Instagram**

Para descargar un video o imagen de Instagram, usa el siguiente comando:

```bash
yt-dlp <URL_DEL_CONTENIDO_DE_INSTAGRAM>
```

**Ejemplo práctico:**

```bash
yt-dlp https://www.instagram.com/p/ABC123456789/
```

### **TikTok**

Para descargar un video de TikTok, usa el siguiente comando:

```bash
yt-dlp <URL_DEL_VIDEO_DE_TIKTOK>
```

**Ejemplo práctico:**

```bash
yt-dlp https://www.tiktok.com/@usuario/video/1234567890
```

### **Páginas web genéricas**

Si encuentras un video incrustado en una página web, puedes intentar descargarlo usando `yt-dlp`. Simplemente copia la URL de la página y ejecuta el siguiente comando:

```bash
yt-dlp <URL_DE_LA_PÁGINA_WEB>
```

**Ejemplo práctico:**

```bash
yt-dlp https://www.ejemplo.com/video
```

---

## **3. Notas adicionales**

- **Formatos alternativos:** Si prefieres descargar el audio en otro formato (por ejemplo, AAC, FLAC, OGG), puedes cambiar el parámetro `--audio-format` al formato deseado. Ejemplo:

  ```bash
  yt-dlp -x --audio-format aac --audio-quality 128K <URL_DEL_VIDEO>
  ```

- **Compatibilidad:** Algunas plataformas pueden requerir autenticación o cookies para descargar contenido. En esos casos, consulta la documentación oficial de `yt-dlp` para obtener instrucciones específicas.

- **Depuración:** Si encuentras problemas durante la descarga, agrega la opción `-v` al comando para obtener información detallada sobre el proceso:

  ```bash
  yt-dlp -v -x --audio-format mp3 --audio-quality 128K <URL_DEL_VIDEO>
  ```

---

Con estos comandos y explicaciones, podrás descargar videos en formato MP3 con diferentes calidades y acceder a contenido multimedia desde diversas plataformas.
 

---

### **un Versículo Bíblico** 🌟

> **"Y estas palabras que yo te mando hoy, estarán sobre tu corazón; y las repetirás a tus hijos, y hablarás de ellas estando en tu casa, y andando por el camino, y al acostarte, y cuando te levantes."**  
> — **Deuteronomio 6:6-7** 📖✨

---

### **Explicación** 🤔💡

Este versículo nos recuerda la importancia de **compartir conocimientos y sabiduría** con los demás, especialmente con aquellos que están dispuestos a aprender. Al crear tutoriales como este, estamos compartiendo lo que hemos aprendido (nuestro "conocimiento") para que otros puedan beneficiarse de ello, tal como se menciona en este pasaje bíblico.

Al usar herramientas como `Termux`, `git` y `yt-dlp`, estamos aprovechando la tecnología moderna para **facilitar el acceso a la información** desde los celulares Android, lo cual es una forma práctica de aplicar este principio bíblico en nuestra vida diaria. 🌍💻

---

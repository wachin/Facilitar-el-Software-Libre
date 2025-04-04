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


 

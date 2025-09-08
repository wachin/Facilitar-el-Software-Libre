

# 🎥 Cómo estabilizar un video tembloroso en Linux con FFmpeg desde la terminal

¿Alguna vez filmaste un video con tu celular y al verlo después parecía que estabas en un terremoto? 📱🎥  
No te preocupes, a todos nos ha pasado. Sobre todo si lo grabaste caminando, en un bus, o con las manos un poco nerviosas.

Pero ¡buena noticia! Si usás **Linux**, podés arreglar ese temblor **sin instalar programas complicados**. Solo necesitás una herramienta que ya viene en muchos sistemas: **`ffmpeg`**.

Vamos a ver cómo usarla para dejar tu video **fijo como una roca**. 🪨

---

## 🔍 Primero: ¿Tu `ffmpeg` puede estabilizar videos?

No todos los `ffmpeg` son iguales. Algunos pueden estabilizar videos… y otros no.  
Pero no te preocupes, vamos a **chequearlo en 10 segundos**.

Abrí la terminal (sí, esa pantalla negra que parece de hacker) y escribí:

```bash
ffmpeg -filters | grep stabiliz
```

Ahora mirá lo que te responde, a mi me da:

```bash
wachin@debian12:~$ ffmpeg -filters | grep stabiliz
ffmpeg version 5.1.6-0+deb12u1 Copyright (c) 2000-2024 the FFmpeg developers
  built with gcc 12 (Debian 12.2.0-14)
  configuration: --prefix=/usr --extra-version=0+deb12u1 --toolchain=hardened --libdir=/usr/lib/i386-linux-gnu --incdir=/usr/include/i386-linux-gnu --arch=i386 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-sndio --enable-libjxl --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --ignore-tests='hapenc-hap-none,hapenc-hapa-none,hapenc-hapq-none' --enable-shared
  libavutil      57. 28.100 / 57. 28.100
  libavcodec     59. 37.100 / 59. 37.100
  libavformat    59. 27.100 / 59. 27.100
  libavdevice    59.  7.100 / 59.  7.100
  libavfilter     8. 44.100 /  8. 44.100
  libswscale      6.  7.100 /  6.  7.100
  libswresample   4.  7.100 /  4.  7.100
  libpostproc    56.  6.100 / 56.  6.100
 ... deshake_opencl    V->V       Feature-point based video stabilization filter
 ... vidstabdetect     V->V       Extract relative transformations, pass 1 of 2 for stabilization (see vidstabtransform for pass 2).
 ... vidstabtransform  V->V       Transform the frames, pass 2 of 2 for stabilization (see vidstabdetect for pass 1).
```

En la parte de abajo al final veo lo siguiente:

```bash
vidstabdetect     V->V       Extract relative transformations...
vidstabtransform  V->V       Transform the frames...
```

¡Si es así felicidades! Tu `ffmpeg` **sí puede estabilizar videos**. Podés seguir.

---

## 🛠️ Paso a Paso: Estabilizando tu video tembloroso

Ahora viene la parte mágica. Vamos a hacer **dos pasos**:

### ✅ Paso 1: Analizar el video (como hacerle un "escáner")

`ffmpeg` necesita primero entender **cómo y cuánto tiembla** tu video. Para eso, escribí esto en la terminal (cambiando `tu_video.mp4` por el nombre real de tu video):

```bash
ffmpeg -i tu_video.mp4 -vf vidstabdetect=result=trf.trf -f null -
```

➡️ Esto no crea un video nuevo. Solo analiza y guarda la información en un archivo llamado `trf.trf`.

> 🕵️‍♂️ Piensa como si le estuvieras tomando una radiografía a tu video.

---

### ✅ Paso 2: Arreglar el temblor (la parte cool)

Ahora sí, vamos a crear el video estable. Escribí esto:

```bash
ffmpeg -i tu_video.mp4 -vf "vidstabtransform=input=trf.trf:smoothing=25:crop=1" video_estable.mp4
```

Y listo. 🎉  
En unos minutos (dependiendo del tamaño del video), vas a tener un archivo nuevo llamado `video_estable.mp4`… ¡sin temblores!

---

## 🔧 ¿Qué significan esos nombres raros?

- `smoothing=25`: Suaviza los movimientos.  
  → Si ponés 10, corrige poco. Si ponés 30, corrige más.  
  → 25 es un buen punto medio.
  
- `crop=1`: Recorta los bordes negros que aparecen cuando el video se mueve para corregirse.  
  → Si no querés recortar, usá `crop=0`.

- `input=trf.trf`: Le dice a `ffmpeg` que use la "radiografía" que hicimos antes.

---

## 💡 Consejos útiles

- Haz una copia del video original antes de empezar (por si algo sale mal).
- Probá con un pedacito corto del video primero (los primeros 10 segundos).
- Si el resultado se ve muy rígido, bajá el `smoothing` a 15.
- Este método **no usa IA ni apps de celular**: es todo con comandos simples en Linux. 💻

---

## 🧠 ¿Por qué funciona?

Cuando filmás con el celular, aunque no lo notes, la cámara se mueve un poquito todo el tiempo.  
`ffmpeg` con `vid.stab` detecta esos movimientos y **mueve cada cuadro en sentido contrario**, como si le dijeras:  
> “Oye, este cuadro se movió hacia arriba… movámoslo hacia abajo para que quede en su lugar”.

Y así, paso a paso, el video queda estable.

---

## ✅ En resumen

1. Abrí la terminal.
2. Chequeá si tenés soporte: `ffmpeg -filters | grep stab`
3. Analizá el video: `ffmpeg -i video.mp4 -vf vidstabdetect=...`
4. Creá el video estable: `ffmpeg -i video.mp4 -vf vidstabtransform=...`
5. ¡Listo! Disfrutá tu video sin temblores.

---

> 📌 *Nota: Este tutorial fue probado en Debian, Ubuntu y sistemas similares. El nombre del archivo de entrada debe estar en la misma carpeta o usar la ruta completa.*

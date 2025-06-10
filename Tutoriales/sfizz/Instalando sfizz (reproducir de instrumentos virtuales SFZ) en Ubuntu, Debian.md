# 🐧 Tutorial: Instalación y Uso de `sfizz` en Linux (Debian 12)

## 🔧 Paso 1: Instalar sfizz
En el repositorio de opensuse.org está sfizz para las distribuciones: Debian, Fedora, Mageia, openSUSE, Raspian, Ubuntu

### Descargar desde OpenSUSE Build Service
Desde [https://software.opensuse.org//download.html?project=home%3Aposener&package=sfizz](https://software.opensuse.org//download.html?project=home%3Aposener&package=sfizz)

En mi caso seleccioné Debian 12 y siguí las instrucciones para añadir el repositorio y luego instalar `sfizz`.

---

### 🎹 Paso 2: Preparar los archivos del piano Salamander
Descargar "Salamander Grand Piano" (Yamaha C5, recorded with two AKG c414 disposed in an AB position ~12cm above the strings, 48kHz 24bit, 16 velocity layers) desde:

[https://sfzinstruments.github.io/pianos/salamander/](https://sfzinstruments.github.io/pianos/salamander/)

el enlace directo de estarga:

**Instrument 	wav (24bit) 	48 KHz 	1.18 GB**
[http://freepats.zenvoid.org/Piano/SalamanderGrandPiano/SalamanderGrandPianoV3+20161209_48khz24bit.tar.xz](http://freepats.zenvoid.org/Piano/SalamanderGrandPiano/SalamanderGrandPianoV3+20161209_48khz24bit.tar.xz)

Descargado correctamente el conjunto de muestras del **Salamander Grand Piano**, archivo descargado:

SalamanderGrandPianoV3+20161209_48khz24bit.tar.xz

- Descomprirlo y deberá contener:
  - Dos archivos `.sfz`
  - Una carpeta con todos los `.wav` de las muestras

Recomendado: Mueve estos archivos a una carpeta dedicada, por ejemplo:

~/Samples/Piano

Esto evita errores al cargarlo en el SFZ player si las rutas no coinciden.

---

### 🎛️ Paso 3: Usar sfizz dentro de REAPER

#### 1. Cargar sfizz como instrumento LV2

- Abre REAPER.
- Ve al pista donde quieres cargar el piano.
- Haz clic en el botón "FX" de esa pista.
- En la ventana de efectos, haz clic en "All plugins" > "Instruments".
- Selecciona:
  ```
  LV2i: sfizz (SFZTools) (2 out)
  ```

  > La opción `sfizz-multi (16 outs)` permite salida multicanal para efectos avanzados, como micrófonos separados. Para uso normal, usa la versión simple `(2 out)`.

#### 2. Cargar el archivo `.sfz`

- Al abrir sfizz, verás una interfaz sencilla.
- Haz clic en el botón ▼ (flecha hacia abajo).
- Selecciona "Load".
- Navega hasta donde descomprimiste los archivos y selecciona:
  ```
  SalamanderGrandPianoV3.sfz
  ```

- Una vez cargado, prueba reproducir tu proyecto MIDI y deberías escuchar el piano correctamente.

---

### 📚 Notas adicionales

- **sfizz** también puede usarse fuera de REAPER, como reproductor independiente desde terminal. Ejemplo:

  ```bash
  sfizz SalamanderGrandPianoV3.sfz
  ```

  Esto abre un reproductor básico con salida de audio.

- También puedes usar `sfizz` con otros DAWs compatibles con LV2 como Ardour, Qtractor, etc.

---



### ✅ Resumen

| Paso | Acción |
|------|--------|
| 1 | Instala `sfizz` e integración LV2 |
| 2 | Descarga y organiza el Salamander Grand Piano |
| 3 | En REAPER, carga `LV2i: sfizz` e importa el `.sfz` |
| 4 | ¡Disfruta tocando o reproduciendo tus proyectos MIDI! |

---

¿Te gustaría que te ayude a crear un script automático para cargar sfizz desde terminal o desde un lanzador gráfico? ¿O quizás configurar soporte MIDI externo?

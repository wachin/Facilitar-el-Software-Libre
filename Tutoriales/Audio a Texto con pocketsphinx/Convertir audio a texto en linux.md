### Instalación de PocketSphinx

La siguiente prueba está hecha en MX Linux 23 de 32 bit


 **Instalar PocketSphinx y SphinxBase**:

```sh
   sudo apt update
   sudo apt install pocketsphinx sphinxbase-utils
```

### Descargar Modelos en Español


1. **Descargar el modelo acústico en español**:

   Puedes encontrar modelos en español en el repositorio de CMU Sphinx. Descarga el modelo acústico y el diccionario de pronunciación:

https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Spanish/

descargar manualmente los tres archivos

decomprimir los archivo:

file:///home/wachin/Dev/Audio-a-texto/cmusphinx-es-5.2.tar.gz
file:///home/wachin/Dev/Audio-a-texto/es-20k.lm.gz
file:///home/wachin/Dev/Audio-a-texto/es.dict

cmusphinx-es-5.2.tar.gz

con lo que nos quedan la carpeta y los los archivos que necesitamos:

cmusphinx-es-5.2
es-20k.lm
es.dict



### Convertir el Audio a Texto

El archivo de audio que usted tenga debe convertirlo a WAV

Requisitos del archivo WAV

- Mono
- 16000 Hz

1. **Convertir el archivo de audio a formato WAV con ffmpeg**
puede usar ffmpeg así

```sh
   ffmpeg -i tu_audio.mp3 -ar 16000 -ac 1 tu_audio.wav
```

2. **Usar PocketSphinx para transcribir el audio**:

PocketSphinx tiene varias herramientas para trabajar con audio y modelos. Usa el siguiente comando para transcribir el audio

En una terminal entrar en la raíz donde estan la carpeta y archivos poner:

```   
pocketsphinx_continuous -hmm cmusphinx-es-5.2/model_parameters/voxforge_es_sphinx.cd_ptm_4000 -lm es-20k.lm -dict es.dict -infile tu_audio.wav
```

Este proceso convertirá tu archivo de audio en español a texto utilizando PocketSphinx en Linux. 

**RESULTADO**

El resultado no es bueno
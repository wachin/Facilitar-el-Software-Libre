## Si tienen problemas con el rendimiento del ordenador

Si te sale el siguiente error en la terminal: 

```
$ scrcpy
scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy>
INFO: ADB device found:
INFO:     -->   (usb)  c146bb85                        device  2201117TG
/usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0 skipped. 0.8 MB/s (71112 bytes in 0.086s)
[server] INFO: Device: [Xiaomi] Redmi 2201117TG (Android 13)
[server] ERROR: Encoding error: android.media.MediaCodec$CodecException: Error 0xfffffff4
[server] INFO: Retrying with -m1920...
[server] INFO: Retrying...
INFO: Renderer: opengl
INFO: OpenGL version: 2.1 Mesa 22.3.6
WARN: Trilinear filtering disabled (OpenGL 3.0+ or ES 2.0+ required)
INFO: Texture: 864x1920
ERROR: [FFmpeg] get_buffer() failed
ERROR: [FFmpeg] decode_slice_header error
ERROR: [FFmpeg] no frame!
ERROR: Decoder 'video': could not send video packet: -1094995529
ERROR: Demuxer error
```

Intenta usar una de las siguientes resoluciones:

**Resoluciones comunes:**

- 640x360 (para dispositivos de gama baja o para conexiones lentas)
- 1280x720 (HD, buena para la mayoría de los dispositivos)
- 1920x1080 (Full HD, para dispositivos de gama media-alta)
- 2560x1440 (2K, para dispositivos de gama alta)
- 3840x2160 (4K, para dispositivos de gama alta más recientes)

Puedes usar estas resoluciones con el comando -m. Por ejemplo en mi ordenador del 2008 que armé con una mainboard que me regaló mi primo Paco me va muy bien con la siguiente resolucón:

```
scrcpy -m1280
```

esto es para usar la resolucón: 1280x720, aunque también se puede escribir así:

```
scrcpy -m1280x720
```

Si desea usar la resolución 1920x1080 es así:

```
scrcpy -m1920
```

La resolución óptima dependerá del modelo de tu celular y de la capacidad de tu computadora para procesar la imagen. Es recomendable empezar con una resolución media como 1280x720 y ajustar según sea necesario.

## **Problemas con el audio**

Las versiones de scrcpy modernas transmiten el audio del dispositivo a la computadora. ESi no tienes audio el silencio que experimentas en el celular podría ser un problema separado. Aquí hay algunas cosas que puedes verificar:

1. Asegúrate de que el volumen del celular no esté en silencio o muy bajo.
2. Verifica que no haya ningún dispositivo Bluetooth conectado que pueda estar capturando el audio.
3. Reinicia el celular para ver si se resuelve el problema de audio.

## Comando específico para enviar audio al ordenador

Si quieres transmitir el audio del celular a la computadora de una manera específica, puedes usar la opción experimental de audio de scrcpy:

```
scrcpy --audio-codec=opus --audio-bit-rate=128K --audio-buffer=50
```




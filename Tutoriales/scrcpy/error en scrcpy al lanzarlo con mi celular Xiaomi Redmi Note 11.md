


He instalado  scrcpy en linux debian 12 y he configurado mi celular android en las herramientas de desarrollador habilitando el debug USB así como dicen las instrucciones, y he configurado el celular conectandolo con el cable usb y poniendolo en modo de transferencia de archivos, pero me sale este error en la terminal:

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


Solucón lanzar con:

scrcpy -m1280

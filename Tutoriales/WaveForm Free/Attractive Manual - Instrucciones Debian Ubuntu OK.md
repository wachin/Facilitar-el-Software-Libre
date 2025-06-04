En este tutorial he instalado WaveForm Free en Debian 12, pero también es para Ubuntu, Linux Mint y otros que utilicen la paquetería .deb

# Para descargar el WaveForm Free entra en la siguiente dirección:

[https://www.tracktion.com/products/waveform-free](https://www.tracktion.com/products/waveform-free)

esto me reenvía a:  
  
[https://www.tracktion.com/register](https://www.tracktion.com/register)  
  
allí poner los datos, solo una indicación, para la contraseña yo había usado @ # $ y otros signos extraños y no me permitía, y a la final puse una contraseña con números, letras minúsculas y mayúsculas ejemplo Egj56nsiud927D45Y9 y me la aceptó, y siguiendo los pasos recibí el paquete:

`tracktion\_download\_manager\_v1.5.3.deb`

este hay que instalarlo, vea [mi tutorial](https://facilitarelsoftwarelibre.blogspot.com/2016/09/instalar-paquetes-deb-con-gdebi.html) si no sabe cómo hacerlo.

# Tracktion Donwload Manager
Luego al abrirlo, instalé lo siguiente:  
  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiSWBQDJgkbtwNqYtAyFl3hJ9cLNBU8IO6BvTygqceWyjEYonovN58vbnNRNOEkzhaGuLp-sPNHCpZPH3Tc7DNgsU8llnzibPj7noAZLfqbwHkf5bK5rYgWHUqMZFFP0TFbTJLAr5amJe1cnRoWP3YSlFOe2fYu_WFJLh1_9ierrHt9_GCGMNpp76gn16g/s16000/20250602-230242%20componentes%20a%20instalar%20de%20Waveform%20en%20Debian%2012.png)

y para instalarlo di clic en el instalador:  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh4lF4ikKga_luaIEBaopw6n6LRslX3RnJdlZtGHgGs5ILloaPME87bpXvjC2-RwWANTmOPquvO9q9C3fPJL1s_QeItiekJ8VhoCBd3Xpya_vle71bJ96SwFJ1pzHcZwxjFfd98_XdrgYHsPPYjlyMF79WApjYVt73Ay-jR2KXJhh_Ds71niVb5dafvlCA/s16000/20250603-003206%20clic%20para%20abrir%20el%20instalador.png)

y me aparece la ventana del instalador de paquetes deb que está instalado en mi Linux:

![](https://blogger.googleusercontent.com/img/a/AVvXsEi4dwk047MMM_4Dje96aUnr5Lj8z-X7ntF8kuGlLuThFBUA1UgjV98wF-PM_oI10KQEJMCHmFUq0Yk_cg0gQr8C006PWZy_v8DW7zIcIUv9D9RXyV64txS0PHmmR6k5FFs20RDL1RjRo1uEDP5qZacWSNtM7Nj7yf8VRb56nIWTAPk0r4Hi8pBtik80360=s16000)
  
y escribí s para aceptar la instalación:  

![](https://blogger.googleusercontent.com/img/a/AVvXsEi8BCDx-swySnJQuYNy_LRLVIkGB8y_P_5WWTxkxgjWBb6pZTYnZUVRWO7IO631g2ouX5JHyfN3IquuPOoStVIOX_HflKbvtBko9ORtBrzV4D8oD5y7oJ0Fnnnss-02lGvH6c1QXd5QRobE2VX0O0zHvSPzMY0xGazdJ7jviYzBOSy_WscQxl8J7rb15HE=s16000)

  
luego hay que hacer lo siguiente, ir al escritorio y darle clic derecho al archivo:

`attractive\_vx.x.x\_linux.zip`

y descomprimirlo:  

![](https://blogger.googleusercontent.com/img/a/AVvXsEjmKbcqJF4SMd9X-c3oBRkshUIXMrfohH6c9cAQiYist0JUsUPqHmGfAJk1BullEf4MFcvVu_I2VB3ZS3chW5wooQsWxEf6cHRA5jaao8clfxn9V-BzCmYs8yMWe6EMgLj_0oSU1xzyh46EE2SoHRAtVUx-Vxkgv3QRNVOVtcxxJLB7B7SE-b0bbnqtUWI=s16000)

  
y allí dentro hay un pdf con instrucciones:

`/Desktop/attracktive\_v1.0.9\_linux/Attracktive Manual.pdf`

de lo cual lo adapto para este manual


# 🎛️ Cómo Instalar Complementos (Plugins) VST en WaveForm en Linux (Ubuntu/Debian)

##  Instalando plugins VST

1. Copia el archivo correspondiente a vst:

`/home/wachin/Desktop/attracktive_v1.0.9_linux/Attracktive.so`  
  
en el directorio de plugins VST. Las ubicaciones comunes son:

- `/usr/lib/vst`
- `/usr/local/lib/vst`
- `~/.vst`
- `/usr/lib/vst3`
- `/usr/local/lib/vst3`
- `~/.vst3`

como lo más probable es que no existan esas ubicaciones nos tocará crearlas
   
2. Copia la carpeta correspondiente al plugin vst3:
  
`/home/tuusuario/Desktop/attracktive_v1.0.9_linux/Attracktive.vst3/`  
  
en el directorio de plugins VST3
   
Para facilitar las cosas crearemos los directorios para el usuario actual en HOME:

- `~/.vst`
- `~/.vst3`

para lograrlo haremos visibles los archivos ocultos con `Ctrl + H` (u otro, dependiendo del administrador de archivos usado) y crear esas carpetas con clic derecho crear nueva carpeta o si tu administrador de archivos te lo permite con `Ctrl + Shift + N` o `F10` u otro atajo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhKjVLAE-ChOQT5DvReqS_3kwAlsWt20yQrUNobgOvdfCCuwJTlS6vOmhJr4iknj-kBqL1PPKTCfujjcUmGrVlGrnJpquCOt-qXXWTWEoN5LBS3ucduMQCW3KwanwvW0QoYxchhv8HjGx5qXpHWjuG8EKHeD1FbXqy6h1ik4HrOFjlt2mtmwq0HuogeoVw/s663/20250604-003444%20crear%20carpeta%20.vst%20en%20HOME.png)

en la siguiente imagen está pegado en:

.vst/Attractive.so

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiywjzDvK4AUmG0lnvkAd-S2OB-G1y1ZF-TyuBrNYpMFrgnhH8G6kELKZu4opt9aumBwhIBa438i2edRyy4USN5U8U_OQeMI3wu5dDVgOfyNyS0ivaLGzyU_s1ZPoueaEH9E23kZDhy9ApiKpRFAVMOrJFr9vjLOuAXPQ-en7glfnLmfzLRAyV0rclgBb0/s553/20250604-003939%20vst%20.so%20copiado%20a%20.vst.png)

hacer lo mismo para el otro archivo en la carpeta:

.vst3

y me queda allí dentro la carpeta con todo su contenido:

.vst3/Attracktive.vst3

visto eso con tree (si no lo tiene instalado instálelo):

```bash
wachin@netisntcd:~/.vst3$ tree
.
└── Attracktive.vst3
    └── Contents
        ├── Resources
        │   └── moduleinfo.json
        └── x86_64-linux
            └── Attracktive.so

5 directories, 2 files
```

2. Revisar que el programa esté configurado para escanear esa ubicación, 

abre WaveForm:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjhtvfvN-KPlr7Byz0HSLqKk04qFE-CZAxE9Eu1BteLzyKwwJI-hgAmaGg3EpQUqK4jCTpJAZE0tHYyPA7TS556w89w00MLgASsF5OY_4c_Uqu2KGN_qF8qwts5nDznkyzUMQ99PgYI3hq-TJ31AJ4b7Y-qUcXauGu_IFl0-XumDL5MoN9fx50miMmajHg/s16000/20250604-103845%20abriendo%20WaveForm.png)

clic en:

**Settings**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuN2d45dARVn0EdJDyERNy5EW5FeC0gLEOYFsKz0s06AELpuVTlv2tfvVH9uLsANzCJVqPyMg3urvC_GN6nlXH32g_c86MAz09I4vuPtrZ6sAWrt0DtEY8uUJDBpHHI8elu2AMPcoF-x3FhMbxhkPeosRLm6aY3r8WztnKDYOMbWvjVO3QkBAspOM6Fmo/s1266/20250604-092427%20en%20WaveForm%20dar%20clic%20en%20Settins.png)

y allí observo que está bien:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiGM9e2dMUKnpultX7ZV2Jyw_Ho9_PKHuFdbtKVgE80UXx3Uhuzv7PMSIlE2bJgUFOOl0HieIdGz-e7pmrIUuqc4j3O9vdatLbGw11pt9lUp06Rsa48wWiNeDazHuXwxLjwXaAM2RMh2bwx6ge1gRgFSqdYcI8e_JvXE6pT1kXYVGK6Z7Hp4GnJOn0yAuk/s951/20250604-092717%20verificando%20las%20rutas%20de%20los%20vst.png)

y en **Plugins** dar clic en **Scan for Plugins**:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjz6dwcyFlIOiemZWKHHVuWkKAtpZz1UlRyn-1wsTAPfzwbVN6Msw9qwl6uWDoPOuchPm9LqaEjeB-i16WVd7GpPSnNRc-EOZxR_mJDZb0rBlmfKXCW2oaYtGUDJjL-TRJxGefT2UJ5-RXd-L6HwGMbIa-lxJ790vrO0JGHmrfaSQdeie0K-RNAIh2pVwA/s16000/20250604-093811%20en%20Plugins%20dar%20clic%20en%20Scan%20for%20Plugins.png)

**Nota**: Allí se ven varios plugins, eso los instalé tomando como ejemplo la lista de plugins que se instala en UbuntuStudio, [vea este tutorial](https://facilitarelsoftwarelibre.blogspot.com/2020/10/plugins-de-autio-de-ubuntustudio-para-mx-linux.html).

y escanear:

 * Scan for new or updated VST plug-ins
 * Scan for new or updated VST plug-ins

uno cada vez:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIICuC6W4Oun_xBmH1JpNszy_oM1mwoBwXwIJDRWZ8vSGCMSCamDx-z9Zbv-qiT5uAfewKXLtmPzye5fW9I246gJjHRg9GGEhJXC-Ijn6omSqNiJo6iKjbYxXGxIeYf43RYhpb4D7nL2UsXgv2urC7Bu3Udy6E29pXBA7zsZKPyqrt7WfEz0uwqH6Bm1o/s16000/20250604-093954%20clic%20en%20Scan%20for%20new%20or%20updated%20VST%20plug-ins.png)

4.  arrastre el plugin Attractive a los favoritos:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjvXb8VjWhnIZJa0dq7Y8nDctDq1qAgznXG-rVvoH46jsS_-382Mz9kTu3UnSBQHENDG5gCRSHSj1I_lCspa2uqTlnNOujfx5zrLORxFrLFs9lKsgl_gM1Gb62ydnssrEglx8wE5sQPb1nAWHpOdtFFZOPEk5b45FLIsx3g_ehGSQPPI_lDHAobb4Otd34/s16000/20250604-095920%20arrastre%20el%20plugin%20Attractive%20a%20los%20favoritos.png)
  
valida el archivo Atractive.so ubicado en .vst

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjFJCObB76y17dkMFD-9OOd113u4sQpgmKF2Rtseh7h1pPdb1LuKAQlcycdn7n9z_AyI92kVkYUzZ5V0jhaqxYPDWU1wd0eTRWzOun0cUbdXa2jlX11au_m8UdUq_UDdgYZs_61lVzbdefWWI-hOsQD8iCdjZc9P90jTH5DKMqCQNWLjRH_G9BpdtaOPU0/s16000/20250604-100554%20valida%20el%20plugin%20en%20.vst.png)

para validar el plugin de clic en Open  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh3PZP4Gc9qAmAS3BdKyi5WA84WkhIE3inJYpryYWQzi7B8WYxDhd9hRYLw05OlbrdvLywx6WW7aYk1qS3yc4mUSpcP5rEU-JsacrsHoBBZwLHDq7hOmmmOyIOVasO63FM2DPjLFPx3pHOoCXYQJQC8T-ME6YblAsCghrwwx2uH6tFM95kieg9KI2cpJ4k/s16000/20250604-101316%20para%20validar%20el%20plugin%20de%20clic%20en%20Open.png)

realiza lo mismo para el plugin vst3 pero debes de buscarlo en la ruta:

`/home/tuusuario/.vst3/Attracktive.vst3/Contents/x86_64-linux/Attracktive.so`

aunque es posible que este no se pueda validad, pero bueno con el primer vst ya tenemos

3. Reinicia tu programa principal (**DAW**) y cualquier instancia abierta de **Attracktive**.

## 📁 Directorios de Contenido BioTek

Al activar **Attracktive** el cual es un reproductor de contenido **BioTek**, se crearán unas carpetas y buscará instrumentos y muestras en el directorio:

~/Tracktion/BioTek/

### ✅ Estructura Final Esperada

- `"~/Tracktion/BioTek/Instruments"`  
  Contiene archivos `.biotek2inst` y/o `.biotekinstrument`.

- `"~/Tracktion/BioTek/Samples"`  
  Contiene archivos `.biotek2sample` y/o `.acktionsample`.

- `"~/Tracktion/BioTek/Images"`  
  Contiene diversas imágenes.
 
# Para instalar otros complementos

Entrar en:

[https://www.tracktion.com/](https://www.tracktion.com/)

allí buscar la opción:

Instruments

allí buscar

Me encontré otro gratis llamado:

**zyklop**  
[https://www.tracktion.com/products/zyklop](https://www.tracktion.com/products/zyklop)

allí di clic en **Download** y luego en **View chart **e hice el **checkout** y al final me dieron a descargar el deb del paquete "**tracktion_download_manager_vx.x.x.deb**" el cual no lo instalé porque ya lo tengo instalado, y lo que hice fue buscarlo y abrirlo e instalar el plugin "**zyklop**" así como se ve en la siguiente imagen:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjJfc5VwX-JxV035XobtgP18gfFUaASY_ZTarHKiE6U2_Wmn8gTdEpLpAPRPGY94sH9EylpfZT9U6MZ99BSGMJDxSjaPC8cQ-Y7iWijPdiVnJwl7UMipiXd3ImFju8y-rdCX8mLRIbusPC05jnO5kEODaTuyGjI4uoInwgn2414gSHw1E3RGrp4TQfFigk/s16000/20250604-122950%20plugin%20zyklop%20ya%20instalado.png)

 y asjí hacer con otros, pero esos son de pago.

## Revisa la configuración del dispositovo de Audio:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiHd_1pX1KOqNCK7SvnsVbBFoeDfO3_Xs1qLzdPn-hcM9IatDCQdIeUbmRxZvcpi3jo7rro9uhnEZybLPti7h498E-QwIouBMWH7-j4yky7jzh3VKOQ0S-wQVMHtTpoAvK8unawQJCG8JhgyIbAAWoyC2jGhqYI2TWXn8rFwj2yA0nABIkISprP7Xgpqbk/s16000/20250604-102258%20revisa%20la%20configuraci%C3%B3n%20del%20dispositovo%20de%20Audio.png)

luego da clic en el + y en New Project:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmljnJGsFZ8oUUFsrSoqrOeNxqBUYvSUV2TDzQxqEKWF6VCOHTCuQanSPr-3FnzDmj_izFkCKeMhPiKh6Fh4-iwoXDNHFm9eXbmIsGlfR9zDJ8mwKwPgFDIDZEjBMvdQoinwuLeeHKl2dNY-0WZ2LovHuN7DTdxuWjeZhZhsNvMtGSRveL5PIljnWvoqg/s16000/20250604-102506%20luego%20da%20clic%20en%20el%20+%20y%20en%20New%20Project.png)

allí le pongo nombre y lo dejo en la plantilla por defecto

abriendo un MIDI en WaveForm Free en Linux

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgdUXFTtgfQ7arCW7GAiqoJW1UrlOMRK-AH9_fF4MkqulIvlUG4H-R1tPWbI70FSxZJTfhIdOsWjJ7v_XS_aepNXPDEM2UKIN_kCaPtPplEvw-mp37GoWm_5PaY-BBmvR0Ox9Hu2nzH-anXO0bARFIg2WDjsmZkGSJ3fAotf9yYzFxogXD53Yx-6ZFSxmM/s16000/20250604-124406%20abriendo%20un%20MIDI%20en%20WaveForm%20Free%20en%20Linux.png)

y en la siguiente imagen ya está cargado:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEitrF4vePhAYNULa743hNWj29ekmTOyHmzK8Ugh0cNsgNU-xPYwfnmHhIJ2vS8he8YnjOSQA9um97n6OgdaHsCOZEbTqoneTH8P3X0lHEWn-tRgDxj9MBfEroGA0q4Oe63it6se9oms4OLS0yo08jqzw7EdqwqNlnm39zTj3uE9WcRlnjMO91olNIck5gw/s16000/20250604-124741%20MIDI%20cargado%20en%20WaveForm%20Free.png)







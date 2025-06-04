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
   
2. Copia el archivo correspondiente a vst3:
  
`/home/tuusuario/Desktop/attracktive_v1.0.9_linux/Attracktive.vst3/Contents/x86_64-linux/Attracktive.so`  
  
en el directorio de plugins VST3
   
Para facilitar las cosas crearemos los directorios para el usuario actual en HOME:

- `~/.vst`
- `~/.vst3`

para lograrlo haremos visibles los archivos ocultos con `Ctrl + H` (u otro, dependiendo del administrador de archivos usado) y crear esas carpetas con clic derecho crear nueva carpeta o si tu administrador de archivos te lo permite con `Ctrl + Shift + N` o `F10` u otro atajo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhKjVLAE-ChOQT5DvReqS_3kwAlsWt20yQrUNobgOvdfCCuwJTlS6vOmhJr4iknj-kBqL1PPKTCfujjcUmGrVlGrnJpquCOt-qXXWTWEoN5LBS3ucduMQCW3KwanwvW0QoYxchhv8HjGx5qXpHWjuG8EKHeD1FbXqy6h1ik4HrOFjlt2mtmwq0HuogeoVw/s663/20250604-003444%20crear%20carpeta%20.vst%20en%20HOME.png)

en la siguiente imagen está pegado en:

.vst  

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiywjzDvK4AUmG0lnvkAd-S2OB-G1y1ZF-TyuBrNYpMFrgnhH8G6kELKZu4opt9aumBwhIBa438i2edRyy4USN5U8U_OQeMI3wu5dDVgOfyNyS0ivaLGzyU_s1ZPoueaEH9E23kZDhy9ApiKpRFAVMOrJFr9vjLOuAXPQ-en7glfnLmfzLRAyV0rclgBb0/s553/20250604-003939%20vst%20.so%20copiado%20a%20.vst.png)

hacer lo mismo para el otro archivo en la carpeta:

.vst3

2. Revisar que el programa esté configurado para escanear esa ubicación, clic en:

**Settings**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuN2d45dARVn0EdJDyERNy5EW5FeC0gLEOYFsKz0s06AELpuVTlv2tfvVH9uLsANzCJVqPyMg3urvC_GN6nlXH32g_c86MAz09I4vuPtrZ6sAWrt0DtEY8uUJDBpHHI8elu2AMPcoF-x3FhMbxhkPeosRLm6aY3r8WztnKDYOMbWvjVO3QkBAspOM6Fmo/s1266/20250604-092427%20en%20WaveForm%20dar%20clic%20en%20Settins.png)

y allí observo que está bien:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiGM9e2dMUKnpultX7ZV2Jyw_Ho9_PKHuFdbtKVgE80UXx3Uhuzv7PMSIlE2bJgUFOOl0HieIdGz-e7pmrIUuqc4j3O9vdatLbGw11pt9lUp06Rsa48wWiNeDazHuXwxLjwXaAM2RMh2bwx6ge1gRgFSqdYcI8e_JvXE6pT1kXYVGK6Z7Hp4GnJOn0yAuk/s951/20250604-092717%20verificando%20las%20rutas%20de%20los%20vst.png)

y en **Plugins** dar clic en **Scan for Plugins**:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjz6dwcyFlIOiemZWKHHVuWkKAtpZz1UlRyn-1wsTAPfzwbVN6Msw9qwl6uWDoPOuchPm9LqaEjeB-i16WVd7GpPSnNRc-EOZxR_mJDZb0rBlmfKXCW2oaYtGUDJjL-TRJxGefT2UJ5-RXd-L6HwGMbIa-lxJ790vrO0JGHmrfaSQdeie0K-RNAIh2pVwA/s16000/20250604-093811%20en%20Plugins%20dar%20clic%20en%20Scan%20for%20Plugins.png)

y escanear:

 * Scan for new or updated VST plug-ins
 * Scan for new or updated VST plug-ins

uno cada vez:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIICuC6W4Oun_xBmH1JpNszy_oM1mwoBwXwIJDRWZ8vSGCMSCamDx-z9Zbv-qiT5uAfewKXLtmPzye5fW9I246gJjHRg9GGEhJXC-Ijn6omSqNiJo6iKjbYxXGxIeYf43RYhpb4D7nL2UsXgv2urC7Bu3Udy6E29pXBA7zsZKPyqrt7WfEz0uwqH6Bm1o/s16000/20250604-093954%20clic%20en%20Scan%20for%20new%20or%20updated%20VST%20plug-ins.png)

4.  
  
  
Realiza un escaneo de plugins en tu host.

## 📁 Directorios de Contenido BioTek

**Attracktive** es un reproductor de contenido **BioTek**, por lo tanto, busca instrumentos y muestras en los siguientes directorios:

### Instrucciones de Instalación del Contenido

1. Crea un directorio llamado `Attracktive` en:  
   ```
   ~/Tracktion/BioTek/
   ```  
   *(se creará cuando abras el programa)*

2. Copia el contenido según corresponda:
   - **Instrumentos**:  
     ```
     ~/Tracktion/BioTek/Instruments
     ```
   - **Muestras**:  
     ```
     ~/Tracktion/BioTek/Samples
     ```
   - **Imágenes**:  
     ```
     ~/Tracktion/BioTek/Images
     ```

3. Reinicia tu programa principal (**DAW**) y cualquier instancia abierta de **Attracktive**.

### ✅ Estructura Final Esperada

- `"~/Tracktion/BioTek/Instruments"`  
  Contiene archivos `.biotek2inst` y/o `.biotekinstrument`.

- `"~/Tracktion/BioTek/Samples"`  
  Contiene archivos `.biotek2sample` y/o `.acktionsample`.

- `"~/Tracktion/BioTek/Images"`  
  Contiene diversas imágenes.


## 🔐 Autorización del Plugin

Aunque **Attracktive** es gratuito, utiliza protección contra copia basada en software. Necesitas una licencia activada para usarlo sin restricciones.

### 🌐 Autorización En Línea

1. Carga **Attracktive** como plugin de instrumento dentro de tu DAW.
2. Haz clic en el botón **Unlock (Desbloquear)** en la barra de navegación del plugin.
3. Ingresa tu correo electrónico y contraseña del **Tracktion Marketplace**.
4. Haz clic en **Register (Registrar)** para desbloquearlo permanentemente.  
   *(Se requiere conexión a Internet)*

### 💾 Autorización Offline (Sin Internet)

1. Haz clic en el botón **Offline Unlock (Desbloqueo Offline)** si no tienes conexión.
2. Sigue las instrucciones en pantalla para autorizar manualmente.
3. Una vez autorizado, podrás usar **Attracktive** sin limitaciones.


## 📦 Instalación de Paquetes de Sonido / Librerías

### 3.1 Usando el Tracktion Download Manager

✎ **Recomendado**

1. Descarga el **Tracktion Download Manager** desde tu cuenta de Tracktion.
2. Localiza tu paquete de sonido comprado y haz clic en **Instalar**.
3. Sigue las instrucciones en pantalla.
4. El paquete se reconocerá automáticamente en **Attracktive** y estará listo para usarse.


### 3.2 Instalación Manual

1. Descarga el **Paquete de Sonido** desde tu cuenta de Tracktion o mediante el **Download Manager**, asegurándote de **no activar la opción "Instalar cuando termine la descarga"**.
2. En **Attracktive**, abre el menú **Global** haciendo clic en el botón hamburguesa (☰) en la barra de navegación.
3. Haz clic en **"Install Content Pack" (Instalar paquete de contenido)** y selecciona el archivo del paquete en tu computadora.
4. Sigue las instrucciones en pantalla. Una vez completado, el paquete quedará disponible inmediatamente.


> 🧠 **Consejo:** Mantén tus librerías organizadas y verifica periódicamente si hay actualizaciones disponibles en tu cuenta de Tracktion.



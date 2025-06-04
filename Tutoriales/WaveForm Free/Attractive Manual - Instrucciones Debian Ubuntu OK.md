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

allí dice y lo voy arreglando:


# 🎛️ Cómo Instalar Complementos (Plugins) en WaveForm en Linux (Ubuntu/Debian)

## 2.3 Para Linux Ubuntu

### 2.3.1 Tracktion Download Manager

✎ **Recomendamos** utilizar el **Tracktion Download Manager** para descargar e instalar tu software de Tracktion.

1. Descarga el **Tracktion Download Manager** desde tu cuenta de Tracktion → [Mis descargas](https://www.tracktion.com).
2. Localiza tu instrumento o paquete de sonidos comprado y haz clic en el botón **Instalar**.
3. Sigue las instrucciones en pantalla.

### 2.3.2 Instalación Manual

1. Copia el archivo `Attracktive.so` en el directorio de plugins VST. Las ubicaciones comunes son:
   - `/usr/lib/vst`
   - `/usr/local/lib/vst`
   - `~/.vst`

2. Asegúrate de que tu programa principal (**host DAW**) esté configurado para escanear esa ubicación.
3. Realiza un escaneo de plugins en tu host.

## 📁 Directorios de Contenido BioTek

**Attracktive** es un reproductor de contenido **BioTek**, por lo tanto, busca instrumentos y muestras en los siguientes directorios:

### Instrucciones de Instalación del Contenido

1. Crea un directorio llamado `Attracktive` en:  
   ```
   ~/Tracktion/BioTek/
   ```  
   *(Puede que ya exista)*

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



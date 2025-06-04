
# 🎛️ Cómo Instalar Complementos (Plugins) en WaveForm en Linux (Ubuntu/Debian)

## 2.3 Para Linux Ubuntu

### 2.3.1 Tracktion Download Manager

✎ **Recomendamos** utilizar el **Tracktion Download Manager** para descargar e instalar tu software de Tracktion.

1. Descarga el **Tracktion Download Manager** desde tu cuenta de Tracktion → [Mis descargas](https://www.tracktion.com).
2. Localiza tu instrumento o paquete de sonidos comprado y haz clic en el botón **Instalar**.
3. Sigue las instrucciones en pantalla.

---

### 2.3.2 Instalación Manual

1. Copia el archivo `Attracktive.so` en el directorio de plugins VST. Las ubicaciones comunes son:
   - `/usr/lib/vst`
   - `/usr/local/lib/vst`
   - `~/.vst`

2. Asegúrate de que tu programa principal (**host DAW**) esté configurado para escanear esa ubicación.
3. Realiza un escaneo de plugins en tu host.

---

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

---

### ✅ Estructura Final Esperada

- `"~/Tracktion/BioTek/Instruments"`  
  Contiene archivos `.biotek2inst` y/o `.biotekinstrument`.

- `"~/Tracktion/BioTek/Samples"`  
  Contiene archivos `.biotek2sample` y/o `.acktionsample`.

- `"~/Tracktion/BioTek/Images"`  
  Contiene diversas imágenes.

---

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

---

## 📦 Instalación de Paquetes de Sonido / Librerías

### 3.1 Usando el Tracktion Download Manager

✎ **Recomendado**

1. Descarga el **Tracktion Download Manager** desde tu cuenta de Tracktion.
2. Localiza tu paquete de sonido comprado y haz clic en **Instalar**.
3. Sigue las instrucciones en pantalla.
4. El paquete se reconocerá automáticamente en **Attracktive** y estará listo para usarse.

---

### 3.2 Instalación Manual

1. Descarga el **Paquete de Sonido** desde tu cuenta de Tracktion o mediante el **Download Manager**, asegurándote de **no activar la opción "Instalar cuando termine la descarga"**.
2. En **Attracktive**, abre el menú **Global** haciendo clic en el botón hamburguesa (☰) en la barra de navegación.
3. Haz clic en **"Install Content Pack" (Instalar paquete de contenido)** y selecciona el archivo del paquete en tu computadora.
4. Sigue las instrucciones en pantalla. Una vez completado, el paquete quedará disponible inmediatamente.

---

> 🧠 **Consejo:** Mantén tus librerías organizadas y verifica periódicamente si hay actualizaciones disponibles en tu cuenta de Tracktion.

--- 

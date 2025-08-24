
En **Debian 12** (y derivados como Ubuntu), el paquete **`apktool`** está disponible en los repositorios oficiales.

👉 **¿Qué es?**
`apktool` es una herramienta de línea de comandos para **ingeniería inversa de aplicaciones Android (APK)**.

👉 **Para qué sirve:**

* **Descompilar APKs** → Permite extraer los recursos (layouts XML, imágenes, cadenas de texto, etc.) y el bytecode Dalvik (en formato Smali).
* **Reconstruir APKs** → Después de modificar los recursos o el código, se puede volver a compilar el APK.
* **Análisis de apps** → Se usa mucho en auditorías de seguridad, localización de errores, traducciones o modificaciones de la interfaz.
* **Educación / desarrollo** → Sirve para aprender cómo están estructuradas las apps Android.

👉 **Lo que NO hace:**

* No es un desensamblador Java completo (no devuelve código Java original, sino **Smali**, un lenguaje intermedio).
* No genera un APK “firmado” listo para instalar: tras recompilar hay que **firmarlo** con `apksigner` o `jarsigner`.

📦 En Debian puedes instalarlo con:

```bash
sudo apt update
sudo apt install apktool
```

## USO RESUMEN, SIMPLE

sudo apt install apktool

Usar este comando, ejemplo:

apktool d "Mi app.apk"
 


## USO PARA RECOMPILAR

### 2. Descargar un APK de prueba

Puedes usar uno que ya tengas en tu teléfono Android o algún APK gratuito (por ejemplo desde [APKMirror](https://www.apkmirror.com/)).

Supongamos que el archivo se llama `app.apk` y lo tienes en tu carpeta de usuario.

---

### 3. Descompilar el APK

```bash
apktool d app.apk -o app_src
```

* `d` = decode (descompilar)
* `app.apk` = tu archivo
* `-o app_src` = carpeta donde se guardará el código y recursos

👉 Esto crea una carpeta `app_src` con:

* **`AndroidManifest.xml`** → información principal de la app.
* **`res/`** → layouts, strings, imágenes, etc.
* **`smali/`** → código en lenguaje *Smali* (el bytecode Dalvik desensamblado).

---

### 4. Editar archivos

Ejemplo: abrir `res/values/strings.xml` y cambiar un texto visible en la app.

---

### 5. Recompilar el APK

```bash
apktool b app_src -o app_modificado.apk
```

* Esto genera `app_modificado.apk` con tus cambios.

---

### 6. Firmar el APK

Android no permite instalar APKs sin firma.
Puedes generar una clave de prueba y firmar así:

```bash
# Generar una clave (keystore) válida por 10000 días
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
```

Luego firmas el APK:

```bash
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 \
-keystore my-release-key.keystore app_modificado.apk alias_name
```

Finalmente, si tienes `apksigner` (paquete `apksigner` en Debian), puedes alinear y firmar mejor:

```bash
apksigner sign --ks my-release-key.keystore --out app_final.apk app_modificado.apk
```

---

### 7. Instalarlo en un dispositivo Android

Con ADB:

```bash
adb install -r app_final.apk
```

---

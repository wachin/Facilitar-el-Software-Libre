Si usas **PCManFM-QT** en Debian 12 o cualquier otra distribución de Linux y la opción **"Extraer aquí"** no funciona correctamente (especialmente con archivos `.rar .deb .zip xz`), esta guía te ayudará a solucionarlo integrando **Engrampa** en el menú contextual del botón derecho de `pcmanfm-qt`.

# Requisitos
Se necesitan los siguientes requisitos:

# En Debian no viene activado el repositorio non-free, activalo

unrar-free tiene limitaciones con ciertos archivos `.rar`, especialmente los modernos. El paquete `unrar` (de repositorios no-free) ofrece mejor soporte. Si no tienes habilitado el repositorio `non-free`, sigue los pasos de la siguiente entrada para habilitarlo (de paso activa también contrib):

**En Debian no viene activado el repositorio non-free, ni contrib, activalos** 
[https://facilitarelsoftwarelibre.blogspot.com/2025/07/en-debian-no-viene-activado-repositorio-non-free-ni-contrib.html](https://facilitarelsoftwarelibre.blogspot.com/2025/07/en-debian-no-viene-activado-repositorio-non-free-ni-contrib.html)

---

# ✅ Instalar utilidades necesarias para descomprimir

`pcmanfm-qt` utiliza internamente otras herramientas del sistema (como `unzip`, `7z`, etc.) para realizar las operaciones de extracción. Instala las herramientas básicas necesarias:

```bash
sudo apt update
sudo apt install unzip unrar-free unrar xz-utils p7zip-full engrampa pcmanfm-qt
```

*   `unzip`: para archivos `.zip`
*   `unrar`: soporte para archivos `.rar`
*   `p7zip-full`: soporte para formatos adicionales como `.7z`, etc.
*   `engrampa`: es el gestor de archivos comprimidos, usado por algunas interfaces gráficas.

**Nota**: En caso que algun .rar no lo puedas descomprimir lo mejor será instalar la versión de Windows de WinRar en Linux con Wine, vea [este](https://facilitarelsoftwarelibre.blogspot.com/2024/07/como-instalar-winrar-en-debian-mx-linux.html) tutorial.  


# SOLUCIÓN 1.- Instalar emgrama y elegirlo en las opciones avanzadas de PCManFM

Como ya está instalado engrama con los demás soportes, elegirlo en:

`Editar → Preferencias  → Avanzado`
 
allí en `Archivador integrado al sistema` elige `engrampa` 

da clic en `Aceptar` y quedará listo, desde ahora lo que descomprimas en PCManFM usará engrama

![20250811 Exraer aquí](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjZSk7vLSwRTaM6e_M3uLHGqQcdzT21Dh8sfIDkIQr8qC_VBlxC7Gl2V0oANva-fcTM95h4sTAMXRJNdTGxCR0aghyphenhyphen65TkrD-jQZuxe3aT7XnUkqtQDXOHIxVPy_yFDB1Ffh-nL9XJ0vLdOnXzlsEDKnoe28mynIl4ui3gjKgVeX1xTSG3JTbKeTv9SViY/s16000-rw/20250811-093607%20PCmanFM%20Extraer%20aqu%C3%AD.png)


# SOLUCIÓN 2.1- Creción de menú Extraer aquí, con instalación automática (Opcional)

Este paso es opcional, pero te dará una idea de que se pueden crear más menus. Vamos a crear una **acción contextual personalizada para `pcmanfm-qt`** que permita integrar las opciones de **Engrampa** directamente desde el menú contextual del explorador de archivos. Este método usa el sistema de acciones personalizadas de `pcmanfm-qt`, que se guardan en la carpeta:

```
~/.local/share/file-manager/actions/
```

Este método añade dos nuevas acciones contextuales:

- **Extraer aquí**
- **Extraer a carpeta**

La segunda crea una nueva carpeta con el nombre del archivo comprimido antes de la extracción, evitando así la acumulación de espacio en el directorio actual

En la siguiente imagen está funionando este menú con un archivo .rar:

![](https://blogger.googleusercontent.com/img/a/AVvXsEgvLxgBpzlDXsRpKw9NN8W2BzEDH5CX2PaF696JNpIMa08b5HImELEkDFKuhrM9-nceQh4ap8lP7Zd5jDXI9jD0yArd9KB3J783XPcIpksCxvlJ6Lmm_rH5xQesEtNnvp2ieT5gqs9zDL0Zb6EL1f1uZz6yFz8DXp3mahS8lLRKI05zqBouY2jLOgH_07E=s16000)


## Crear una acción contextual personalizada para `pcmanfm-qt` que permita integrar las opciones para “Extraer aquí” con Engrampa

Mi objetivo de este blog es hacer las cosas fáciles de usar, así que he hecho una manera de instalar el nuevo menú contextual que integra las opciones de **Engrampa**

## Instalación rápida y automática con script

Copiar todas las siguietnes líneas (obvio después de haber instalado las dependencias de arriba) y poner en una terminal como Konsole, gnome-terminal o alguna otra que acepte el uso de pegar todas las líneas (hay algunas terminales que no pueden manejar esto, en ese caso hacerlo una por una):

```bash
mkdir -p ~/.local/share/file-manager/actions/
cd /tmp
git clone https://github.com/wachin/PCManFM-engrampa-Extract-Here
cd PCManFM-engrampa-Extract-Here
cp *.desktop ~/.local/share/file-manager/actions/
cd && echo "Dios les bendiga"
```

y da **Enter**, y quedará una ultima linea en la terminal (dependiendo de la terminal usada tal vez tengas que dar **Enter** otra vez) y **Reinicia** PCManFM (cerrarlo y volverlo a abrir) y quedará instalado correctamente

*   Hacer clic derecho sobre un archivo comprimido (`.zip`, `.rar`, etc.)
*   Verás dos nuevas opciones:
    *   **“Extract Aquí”**
    *   **“Extract en carpeta”** con iconos:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVfjYheejm8yhXaLDT4k4kSilIEvPtgKDfLSS7irIbYXaInGB9Fx_bJ9q34KCnk9HKmrYf4pMEPDXxejfRuvF5UxMl7L2iRcBqUU9Utq_8Va8tS8a3rzv8BsWlwTYddr9qtUWXbSwrxq19h6bY8BUK0nPlViA6Kj8wFRFTipOTP2XEzY-9woy2xGZY5pI/s16000/20250505-0004%20extraer%20aqu%C3%AD%20con%20engrampa%20en%20PCManFM.png "PCmanFM, extraer archivos zip, rar con clic derecho Extraer aquí creando menú contextual con emgrampa")

## 🔍 Explicación línea por línea del Script

**1. `mkdir -p ~/.local/share/file-manager/actions/`**

*   Crea la carpeta donde `pcmanfm-qt` busca las acciones personalizadas.
*   La opción `-p` asegura que se creen todas las carpetas necesarias si no existen.
*   Si ya existe, no hace nada.

📁 Carpeta final:  
`~/.local/share/file-manager/actions/`

**2. `cd /tmp`**

*   Cambia al directorio temporal `/tmp`.
*   Es una ubicación común para descargar o clonar repositorios temporales.

**3. `git clone https://github.com/wachin/PCManFM-engrampa-Extract-Here`**

*   Clona mi repositorio de GitHub en la máquina local.
*   Descarga los archivos `.desktop` desde el repositorio público.

📦 Esto crea una carpeta llamada `PCManFM-engrampa-Extract-Here` dentro de `/tmp`.

**4. `cd PCManFM-engrampa-Extract-Here`**

*   Entra a la carpeta recién clonada para trabajar con sus archivos.

**5. `cp *.desktop ~/.local/share/file-manager/actions/`**

*   Copia todos los archivos `.desktop` (en este caso, las dos acciones) a la carpeta de acciones personalizadas de `pcmanfm-qt`.

📄 Archivos copiados:

*   `engrampa-extract-here.desktop`
*   `engrampa-extract-to-folder.desktop`

**6. `cd && echo "Dios les bendiga"`**

*   `cd` sin argumentos vuelve al directorio personal (`~`).
*   `echo "Dios les bendiga"` muestra un mensaje amigable y positivo en la terminal 😊

**✅ Resultado final**

Después de ejecutar este script:

*   Se habrán instalado correctamente las dos acciones personalizadas.
*   Al abrir `pcmanfm-qt`, al hacer clic derecho sobre un archivo comprimido (`.zip`, `.tar.gz`, etc.) aparecerán estas opciones:
    *   **"Extraer aquí"**
    *   **"Extraer en carpeta"**

Ambas usarán **Engrampa**, respetando el idioma del sistema y mostrando iconos apropiados si están disponibles.

- - -

# SOLUCIÓN 2.2.- Si deseas crear manualmente los menú haz lo siguiente

Puede que haya alguien que tenga dudas en usar el metodo automático de arriba y quiera revisar personalmente cada paso y cada parte del código, entonces si fuera así, para su tranquilidad haga lo siguiente:

## 📁 Paso 1: Crear la carpeta (lo más seguro es que no exista)

Ejecuta este comando en tu terminal:

```
mkdir -p ~/.local/share/file-manager/actions
```

## 📄 Paso 2: Crear el archivo `.desktop` para “Extraer aquí”

Crea un archivo llamado:

```
~/.local/share/file-manager/actions/engrampa-extract-here.desktop
```

Puedes usar `nano` o tu editor favorito:

```bash
nano ~/.local/share/file-manager/actions/engrampa-extract-here.desktop
```

**Nota:** Si no sabes usar nano ve este [tutorial](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html).

### ✅ Contenido del archivo:

El siguiente es el contenido que debes copiar y pegar en ese archivo:

```bash
# Extract Here - Supports multiple languages
# Use this action to extract archives directly into the current folder using Engrampa
# Proyecto Facilitar el Software Libre en el Ecuador
# By: Washington Indacochea Delgado
# https://facilitarelsoftwarelibre.blogspot.com

[Desktop Entry]
Type=Action
Tooltip[es]=Extraer el archivo comprimido aquí usando Engrampa
Tooltip[en]=Extract the archive here using Engrampa
Tooltip[fr]=Extraire l'archive ici avec Engrampa
Tooltip[de]=Archiv hier mit Engrampa entpacken
Tooltip[it]=Estrarre l'archivio qui con Engrampa
Tooltip[pt]=Extrair o arquivo aqui com o Engrampa

Name[es]=Extraer aquí
Name[en]=Extract Here
Name[fr]=Extraire ici
Name[de]=Hier entpacken
Name[it]=Estrai qui
Name[pt]=Extrair aqui

Icon=archive-extract

Profiles=profile-zero;

[X-Action-Profile profile-zero]
MimeTypes=application/zip;application/x-rar;application/vnd.rar;application/x-rar-compressed;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;application/x-xz-compressed-tar;application/gzip;application/x-lzma-compressed-tar;application/x-lz4-compressed-tar;application/vnd.debian.binary-package;

Exec=engrampa --extract-here %u

Name[es]=Extraer a la carpeta actual
Name[en]=Extract to current folder
Name[fr]=Extraire dans le dossier actuel
Name[de]=In aktuellen Ordner entpacken
Name[it]=Estrai nella cartella corrente
Name[pt]=Extrair na pasta atual
```

después de pegar, guarda y cierra el archivo.


## 📄 Paso 3: Crear otro archivo para “Extraer en carpeta…”

También puedes crear otra acción para extraer **en una carpeta con el nombre del archivo zip**:

```bash
nano ~/.local/share/file-manager/actions/engrampa-extract-to-folder.desktop
```

### ✅ Contenido del archivo:

El siguiente es el contenido que debes copiar y pegar en ese archivo:

```bash
# Extract to Folder - Supports multiple languages
# Use this action to extract archives into their own folder using Engrampa
# Proyecto Facilitar el Software Libre en el Ecuador
# By: Washington Indacochea Delgado
# https://facilitarelsoftwarelibre.blogspot.com

[Desktop Entry]
Type=Action
Tooltip[es]=Extraer el archivo comprimido en una carpeta con su nombre usando Engrampa
Tooltip[en]=Extract the archive into its own folder using Engrampa
Tooltip[fr]=Extraire l'archive dans un dossier portant son nom avec Engrampa
Tooltip[de]=Archiv in eigenem Ordner mit gleichem Namen entpacken
Tooltip[it]=Estrarre l'archivio in una cartella con lo stesso nome
Tooltip[pt]=Extrair o arquivo em uma pasta com o mesmo nome

Name[es]=Extraer en carpeta
Name[en]=Extract to Folder
Name[fr]=Extraire dans un dossier
Name[de]=In Ordner entpacken
Name[it]=Estrai in una cartella
Name[pt]=Extrair em pasta

Icon=folder-new

Profiles=profile-zero;

[X-Action-Profile profile-zero]
MimeTypes=application/zip;application/x-rar;application/vnd.rar;application/x-rar-compressed;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;application/x-xz-compressed-tar;application/gzip;application/x-lzma-compressed-tar;application/x-lz4-compressed-tar;application/vnd.debian.binary-package;

Exec=engrampa --extract %u

Name[es]=Extraer en su propia carpeta
Name[en]=Extract to its own folder
Name[fr]=Extraire dans son propre dossier
Name[de]=In eigenen Ordner entpacken
Name[it]=Estrai nel proprio folder
Name[pt]=Extrair na própria pasta
```

después de pegar, guarda y cierra el archivo.


## 🌐 ¿Qué hace cada cosa?

Descripción:

* `Name[xx]`  Nombre que aparece en el menú contextual según el idioma del<br>sistema
* `Tooltip[xx]` Texto emergente que explica qué hace la acción 
* `Exec=`  Comando que se ejecuta cuando se selecciona la opción 
* `MimeTypes=`  Lista de formatos compatibles 


## ✅ Resultado final

Después de crear estos dos archivos, **Reinicia** `pcmanfm-qt` (cierra y vuelve a abrir) o incluso reinicia tu sesión gráfica si no ves los cambios.

*   Abre pcmanfm-qt y hacer clic derecho sobre un archivo comprimido (`.zip`, `.rar`, etc.)
*   Verás dos nuevas opciones:
    *   **“Extract Aquí”**
    *   **“Extract en carpeta”**

- - -

Dios les bendiga

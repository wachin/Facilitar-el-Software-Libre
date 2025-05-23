En Debian 12 con el gestor de ventanas LXQT está instalado PCmanFM-QT, pero no funciona la opción Extraer aquí, así si este es tu caso, o si has instalado `pcmanfm-qt` en algún Linux y ves la opción "Extraer aquí" pero no funciona al intentar descomprimir archivos `.zip`, haz lo siguiente:

# ✅ Instalar utilidades necesarias para descomprimir
`pcmanfm-qt` utiliza internamente otras herramientas del sistema (como `unzip`, `7z`, etc.) para realizar las operaciones de extracción.

##### Solución:
Instala las herramientas básicas necesarias:

```bash
sudo apt update
sudo apt install unzip xz-utils p7zip-full engrampa pcmanfm-qt
```

- `unzip`: para archivos `.zip`
- `p7zip-full`: soporte para formatos adicionales como `.7z`, `.rar`, etc.
- `engrampa`: es el gestor de archivos comprimidos, usado por algunas interfaces gráficas

Esto hará que funcione el poder extraer aquí, pero como funciona en PCManFM no me gusta porque extrae siempre todos los archivos en el directorio y no en una carpeta, para solucionarlo ahora vamos a crear una **acción contextual personalizada para `pcmanfm-qt`** que permita integrar las opciones de **Engrampa** directamente desde el menú contextual del explorador de archivos. Este método usa el sistema de acciones personalizadas de `pcmanfm-qt`, que se guardan en la carpeta:

```
~/.local/share/file-manager/actions/
```

---

# Crear una acción contextual personalizada para `pcmanfm-qt` que permita integrar las opciones para "Extraer aquí" con Engrampa

Mi objetivo de este blog es hacer las cosas fáciles de usar, así que he hecho una manera de instalar el nuevo menú contextual que integra las opciones de **Engrampa**

# Instalación rápida y automática

Copiar todas las siguietnes líneas (obvio después de haber instalado las dependencias de arriba) y poner en una terminal como Konsole, gnome-terminal o alguna otra que acepte el uso de pegar todas las líneas (hay algunas terminales que no pueden manejar esto, en ese caso hacerlo una por una):

```bash
mkdir -p ~/.local/share/file-manager/actions/
cd /tmp
git clone https://github.com/wachin/PCManFM-engrampa-Extract-Here
cd PCManFM-engrampa-Extract-Here
cp *.desktop ~/.local/share/file-manager/actions/
cd && echo "Dios les bendiga"
```

y da **Enter**, y quedará una ultima linea en la terminal (dependiendo de la terminal usada tal vez tengas que dar Enter otra vez) y **Reinicia** PCManFM (cerrarlo y volverlo a abrir) y quedará instalado correctamente

- Hacer clic derecho sobre un archivo comprimido (`.zip`, `.rar`, etc.)
- Verás dos nuevas opciones:
  - **"Extract Aquí"**
  - **"Extract en carpeta"**
con iconos:

![20250505-0004 extraer aquí con engrampa en PCManFM](vx_images/345998725303063.png)

## 🔍 Explicación línea por línea del Script

**1. `mkdir -p ~/.local/share/file-manager/actions/`**
- Crea la carpeta donde `pcmanfm-qt` busca las acciones personalizadas.
- La opción `-p` asegura que se creen todas las carpetas necesarias si no existen.
- Si ya existe, no hace nada.

📁 Carpeta final:  
`~/.local/share/file-manager/actions/`

**2. `cd /tmp`**
- Cambia al directorio temporal `/tmp`.
- Es una ubicación común para descargar o clonar repositorios temporales.

**3. `git clone https://github.com/wachin/PCManFM-engrampa-Extract-Here`**
- Clona mi repositorio de GitHub en la máquina local.
- Descarga los archivos `.desktop` desde el repositorio público.

📦 Esto crea una carpeta llamada `PCManFM-engrampa-Extract-Here` dentro de `/tmp`.

**4. `cd PCManFM-engrampa-Extract-Here`**
- Entra a la carpeta recién clonada para trabajar con sus archivos.

**5. `cp *.desktop ~/.local/share/file-manager/actions/`**
- Copia todos los archivos `.desktop` (en este caso, las dos acciones) a la carpeta de acciones personalizadas de `pcmanfm-qt`.

📄 Archivos copiados:
- `engrampa-extract-here.desktop`
- `engrampa-extract-to-folder.desktop`

**6. `cd && echo "Dios les bendiga"`**
- `cd` sin argumentos vuelve al directorio personal (`~`).
- `echo "Dios les bendiga"` muestra un mensaje amigable y positivo en la terminal 😊

**✅ Resultado final**

Después de ejecutar este script:

- Se habrán instalado correctamente las dos acciones personalizadas.
- Al abrir `pcmanfm-qt`, al hacer clic derecho sobre un archivo comprimido (`.zip`, `.tar.gz`, etc.) aparecerán estas opciones:
  - **"Extraer aquí"**
  - **"Extraer en carpeta"**

Ambas usarán **Engrampa**, respetando el idioma del sistema y mostrando iconos apropiados si están disponibles.

---


# Si deseas hacerlo manualmente todo haz lo siguiente
Puede que haya alguien que tenga dudas en usar el metodo automático de arriba y quiera revisar personalmente cada paso y cada parte del código, entonces si fuera así, para su tranquilidad haga lo siguiente:

## 📁 Paso 1: Crear la carpeta (lo más seguro es que no exista)

Ejecuta este comando en tu terminal:

```bash
mkdir -p ~/.local/share/file-manager/actions
```

---

## 📄 Paso 2: Crear el archivo `.desktop` para "Extraer aquí"

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

```ini
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
MimeTypes=application/zip;application/x-rar;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;
Exec=engrampa --extract-here %u

Name[es]=Extraer a la carpeta actual
Name[en]=Extract to current folder
Name[fr]=Extraire dans le dossier actuel
Name[de]=In aktuellen Ordner entpacken
Name[it]=Estrai nella cartella corrente
Name[pt]=Extrair na pasta atual
```

después de pegar, guarda y cierra el archivo.

---

## 📄 Paso 3: Crear otro archivo para "Extraer en carpeta..."

También puedes crear otra acción para extraer **en una carpeta con el nombre del archivo zip**:

```bash
nano ~/.local/share/file-manager/actions/engrampa-extract-to-folder.desktop
```

### ✅ Contenido del archivo:
El siguiente es el contenido que debes copiar y pegar en ese archivo:

```ini
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
MimeTypes=application/zip;application/x-rar;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;
Exec=engrampa --extract %u

Name[es]=Extraer en su propia carpeta
Name[en]=Extract to its own folder
Name[fr]=Extraire dans son propre dossier
Name[de]=In eigenen Ordner entpacken
Name[it]=Estrai nel proprio folder
Name[pt]=Extrair na própria pasta
```

después de pegar, guarda y cierra el archivo.

---

## 🌐 ¿Qué hace cada cosa?

| Campo | Descripción |
|-------|-------------|
| `# Comentario` | Solo visible para quien edite el archivo. Útil para documentar |
| `Name[xx]` | Nombre que aparece en el menú contextual según el idioma del sistema |
| `Tooltip[xx]` | Texto emergente que explica qué hace la acción |
| `Exec=` | Comando que se ejecuta cuando se selecciona la opción |
| `MimeTypes=` | Lista de formatos compatibles |

---

## ✅ Resultado final

Después de crear estos dos archivos, **Reinicia** `pcmanfm-qt` (cierra y vuelve a abrir) o incluso reinicia tu sesión gráfica si no ves los cambios.

- Abre pcmanfm-qt y hacer clic derecho sobre un archivo comprimido (`.zip`, `.rar`, etc.)
- Verás dos nuevas opciones:
  - **"Extract Aquí"**
  - **"Extract en carpeta"**

---

Dios les bendiga
En Debian 12 con el gestor de ventanas LXQT está instalado PCmanFM-QT, pero no funciona la opción Extraer aquí, así si este es tu caso, si has instalado `pcmanfm-qt` en algún Linux y ves la opción "Extraer aquí" pero no funciona al intentar descomprimir archivos `.zip`, haz lo siguiente:

# ✅ 1. Falta instalar utilidades necesarias para descomprimir
`pcmanfm-qt` utiliza internamente otras herramientas del sistema (como `unzip`, `7z`, etc.) para realizar las operaciones de extracción.

##### Solución:
Instala las herramientas básicas necesarias:

```bash
sudo apt update
sudo apt install unzip xz-utils p7zip-full engrampa
```

- `unzip`: para archivos `.zip`
- `p7zip-full`: soporte para formatos adicionales como `.7z`, `.rar`, etc.
- `engrampa`: es el gestor de archivos comprimidos, usado por algunas interfaces gráficas

Después de instalar estos paquetes, reinicia `pcmanfm-qt` o incluso la sesión del escritorio.







¡Perfecto! Vamos a crear una **acción contextual personalizada para `pcmanfm-qt`** que permita integrar las opciones de **Engrampa** directamente desde el menú contextual del explorador de archivos.

Este método usa el sistema de acciones personalizadas de `pcmanfm-qt`, que se guardan en la carpeta:

```
~/.local/share/file-manager/actions/
```

---

## 📁 Paso 1: Crear la carpeta si no existe

Ejecuta este comando en tu terminal:

```bash
mkdir -p ~/.local/share/file-manager/actions
```

---

## 📄 Paso 2: Crear el archivo `.desktop` para "Extraer aquí"

Crea un archivo llamado, por ejemplo:

```
~/.local/share/file-manager/actions/engrampa-extract-here.desktop
```

Puedes usar `nano` o tu editor favorito:

```bash
nano ~/.local/share/file-manager/actions/engrampa-extract-here.desktop
```

### ✅ Contenido del archivo:

```ini
[Desktop Entry]
Type=Action
Tooltip=Extract archive here using Engrampa
Name=Extract Here
Profiles=profile-zero;

[X-Action-Profile profile-zero]
MimeTypes=application/zip;application/x-rar;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;
Exec=engrampa --extract-here %u
Name=Extract to current folder
```

---

## 📄 Paso 3: Crear otro archivo para "Extraer en carpeta..."

También puedes crear otra acción para extraer **en una carpeta con el nombre del archivo zip**:

```bash
nano ~/.local/share/file-manager/actions/engrampa-extract-to-folder.desktop
```

### ✅ Contenido del archivo:

```ini
[Desktop Entry]
Type=Action
Tooltip=Extract archive into its own folder using Engrampa
Name=Extract to Folder
Profiles=profile-zero;

[X-Action-Profile profile-zero]
MimeTypes=application/zip;application/x-rar;application/x-tar;application/x-bzip2;application/x-7z-compressed;application/x-java-archive;application/x-deb;application/x-cd-image;
Exec=engrampa --extract %u
Name=Extract to its own folder
```

---

## ✅ Resultado final

Después de crear estos dos archivos:

- Hacer clic derecho sobre un archivo comprimido (`.zip`, `.rar`, etc.)
- Verás dos nuevas opciones:
  - **"Extract Here"**
  - **"Extract to Folder"**

La segunda opción es ideal para evitar desorden, ya que crea una carpeta con el nombre del archivo y coloca todo allí dentro.

---








# Cómo instalar

Y te digo si falta alguna.
Ejemplo para Dolphin

engrampa-kde-service

Dolphin Menú Extraer aqui para Dolphin usando Engrampa. Copiar todas las siguietnes líneas y poner en la terminal (las he preparado para que las pueda copiar todas y ahorrar tiempo):

```bash
mkdir -p ~/.local/share/kservices5/ServiceMenus
cd /tmp
git clone https://github.com/wachin/engrampa-kde-service
cd engrampa-kde-service
cp *.desktop ~/.local/share/kservices5/ServiceMenus
cd && echo "Dios les bendiga"
```

Quedará una ultima linea en la terminal, dar Enter, y Reiniciar Dolphin (cerrarlo y volverlo a abrir) y quedará instalado correctamente

Dolphin4 Menú Extraer aqui para Dolphin4 usando Engrampa. Copiar todas las siguietnes líneas y poner en la terminal (las he preparado para que las pueda copiar todas y ahorrar tiempo):

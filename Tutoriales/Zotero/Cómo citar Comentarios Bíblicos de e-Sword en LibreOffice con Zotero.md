# Cómo Instalar Zotero y con LibreOffice citar Comentarios Bíblicos de e-Sword
Me he preguntado cómo poder citar Comentarios Bíblicos de e-Sword usando Zotero para insertarlos en LibreOffice, lo siguiente es lo que he hecho


## Instalar Zotero

Como ejemplo instalar **Zotero** en Debian 12. Zotero es una herramienta excelente para la gestión de referencias bibliográficas y citas. 

### Paso 1: Preparar el sistema
Primero, asegúrate de tener el sistema actualizado. Abre una terminal y ejecuta el siguiente comando:

```bash
sudo apt update && sudo apt upgrade -y
```

Esto actualizará todos los paquetes de tu sistema a la última versión disponible.

### Paso 2: Verifica dependencias necesarias de Zotero
Zotero requiere algunas bibliotecas y dependencias para funcionar correctamente, deberían estar instaladas, pero con todo intentalo con el siguiente comando:

```bash
sudo apt install libx11-xcb1 libdbus-glib-1-2 libgtk-3-0 libasound2 libxt6
```

si están instaladas te lo dirá, y si faltare alguna te preguntará si deseas instalarlas.

### Paso 3: Descargar Zotero
La forma recomendada de instalar Zotero en Linux es descargando el archivo comprimido directamente desde el sitio oficial. Usa el siguiente comando para descargar el archivo comprimido desde el servidor de Zotero:

[https://www.zotero.org/download/](https://www.zotero.org/download/)

### Paso 4: Extraer el archivo
Una vez descargado el archivo, necesitarás extraerlo. Puedes hacerlo manualmente con clic derecho extraer aquí o ejemplo con el siguiente comando donde debes modificarlo según el nombre de tu archivo descargado:

```bash
tar -xvjf Zotero-5.0.97.2_linux-x86_64.tar.bz2
```

Esto extraerá el contenido en una carpeta llamada `Zotero_linux-x86_64`.

### Paso 5: Mover a una ubicación adecuada
Es recomendable mover la carpeta extraída a un directorio adecuado, como `/opt`, que es donde se suelen colocar las aplicaciones en Linux.

```bash
sudo mv Zotero_linux-x86_64 /opt/zotero
```

### Paso 6: Crear un acceso directo
Para facilitar el acceso a Zotero, puedes crear un acceso directo en el menú de aplicaciones. Para ello, crea un archivo `.desktop` en el directorio adecuado:

```bash
sudo nano /usr/share/applications/zotero.desktop
```

Dentro del archivo, pega el siguiente contenido:

```ini
[Desktop Entry]
Name=Zotero
Comment=Zotero
Exec=/opt/zotero/zotero
Icon=/opt/zotero/chrome/icons/default/default256.png
Terminal=false
Type=Application
Categories=Office;Education;
```

Guarda y cierra el archivo presionando `Ctrl + O` y luego `Ctrl + X`.

### Paso 7: Ejecutar Zotero
Ahora puedes buscar Zotero en tu menú de aplicaciones y ejecutarlo.

Si prefieres lanzarlo desde la terminal, simplemente puedes escribir:

```bash
/opt/zotero/zotero
```

una vez lanzado haz login con tus datos y sincronizalos

Se creará un carpeta con el nombre:

Zotero

en tus archivos de usuario (al lado de Descargas, Documentos, Música, etc)

### Paso 8: Crear un acceso directo en el escritorio (opcional)
Si quieres tener un acceso directo en el escritorio, puedes crear un enlace simbólico o copiar el archivo `.desktop` a tu escritorio:

```bash
cp /usr/share/applications/zotero.desktop ~/Escritorio/
```

Esto te permitirá iniciar Zotero directamente desde el escritorio.

---

## **1. Actualizar Zotero en Debian**

Zotero no tiene un gestor de actualizaciones automático en Linux, por lo que para actualizarlo, debes hacerlo manualmente descargando la última versión desde su página oficial. Aquí tienes los pasos:

### Paso 1: Eliminar la versión anterior (opcional)
Antes de instalar la nueva versión, puedes eliminar la versión actual si lo deseas. Sin embargo, si prefieres mantener tus datos (bibliografía y preferencias), no es necesario eliminarlo, ya que la información se guarda en tu carpeta de usuario.

Para eliminar la instalación de Zotero de la versión anterior:

```bash
sudo rm -rf /opt/zotero
```

### Paso 2: Descargar la nueva versión
Ve a la página de descarga de Zotero (en este caso, usa el enlace directo para la última versión disponible):

```bash
wget https://download.zotero.org/client/release/5.0.97.2/Zotero-5.0.97.2_linux-x86_64.tar.bz2
```

Nota: Asegúrate de comprobar que estás descargando la última versión (puedes visitar el [sitio oficial](https://www.zotero.org/download/) para ver si la versión ha cambiado).

### Paso 3: Extraer la nueva versión
Una vez descargado el archivo, descomprímelo con:

```bash
tar -xvjf Zotero-5.0.97.2_linux-x86_64.tar.bz2
```

### Paso 4: Mover la nueva versión a la ubicación de instalación
Mover la nueva carpeta extraída al directorio `/opt/zotero` (o donde lo prefieras):

```bash
sudo mv Zotero_linux-x86_64 /opt/zotero
```

### Paso 5: Verificar el acceso directo
Tu acceso directo (el archivo `.desktop` que creamos en el tutorial anterior) no necesitaría modificación, ya que sigue apuntando a la misma ubicación de la instalación en `/opt/zotero/`. Solo asegúrate de que el acceso directo sigue funcionando.

### Paso 6: Ejecutar Zotero
Ahora puedes iniciar Zotero con:

```bash
/opt/zotero/zotero
```

O bien, buscarlo en el menú de aplicaciones.

---

### **2. Desinstalar Zotero en Debian 12**

Para desinstalar Zotero, solo necesitas eliminar la carpeta donde se instaló, que es `/opt/zotero`, y el acceso directo si lo creaste.

#### Paso 1: Eliminar la carpeta de Zotero

Elimina la carpeta donde se encuentra Zotero, que por defecto es `/opt/zotero`:

```bash
sudo rm -rf /opt/zotero
```

#### Paso 2: Eliminar el acceso directo

Si creaste un acceso directo `.desktop` en el menú de aplicaciones, puedes eliminarlo también. El archivo de acceso directo se encuentra en `/usr/share/applications/`, por lo que puedes eliminarlo con:

```bash
sudo rm /usr/share/applications/zotero.desktop
```

Si también creaste un acceso directo en el escritorio, elimínalo de la carpeta `~/Escritorio/`:

```bash
rm ~/Escritorio/zotero.desktop
```

#### Paso 3: Borrar configuraciones (opcional)

Si deseas eliminar también las configuraciones de Zotero y los datos de bibliografía (ten en cuenta que esto eliminará todos tus datos), puedes borrar la carpeta de configuración que se encuentra en tu directorio de usuario:

```bash
rm -rf ~/.zotero
```

---







### Paso 9: Desinstalar
Si alguna vez necesitas desinstalarlo, primero desinstala el plugin de Zotero, en LibreOffice:

Herramientas > Gestor de extensiones

da clic en:

Zotero LibreOffice Integration

y da clic en:

Quitar

y aparecerá un mensaje que te pregunta por si deseas reiniciar, pon que si.

---



En e-Sword en el menú:

Descargar > Comentarios

Ejemplo: Adam Clarke, Adam Clarke's Commentary on the Bible

Luego de instalado, cerré e-Sword y lo volví a abrir y dí clic en e-Sword en la pestaña en el menú:

Comentario > Información...

y selecciono allí lo que me parece importante y lo pego aquí:

Adam Clarke's Commentary on the Bible
Adam Clarke, LL.D., F.S.A., (1715-1832)
Published in 1810-1826; public domain.

En Zotero, puedes citar versículos bíblicos y comentarios bíblicos como **Adam Clarke's Commentary on the Bible** en LibreOffice utilizando los campos personalizados de Zotero. Aquí hay un paso a paso:

---

### 1. **Citando versículos bíblicos**  
Para versículos bíblicos, lo más común es tratarlos como una fuente personalizada. Sigue estos pasos:

#### **En Zotero:**
1. **Crear una entrada nueva**:
   - Tipo: *Libro* (para versiones de la Biblia) o *Manuscrito* (para notas específicas sobre un versículo).
2. Completa los campos clave:
   - **Título**: Por ejemplo, "Santa Biblia, Reina-Valera 1960" o "Biblia NVI".
   - **Autor**: Por ejemplo, "Dios" o "Varios autores" (según el formato que uses).
   - **Fecha de publicación**: Año de publicación.
   - **Editor/Editorial**: Nombre de la editorial, como "Sociedades Bíblicas Unidas".
   - **Lugar de publicación**: Si lo sabes.
3. **Citar un versículo específico**:
   - Usa el campo *Número de página* para especificar el libro, capítulo y versículo. Por ejemplo: *Juan 3:16*. 

#### **En LibreOffice:**
- Inserta la cita en el texto utilizando Zotero. Configura el estilo de citación (como *Chicago* o *SBL* si usas estándares bíblicos).
- Ajusta manualmente para incluir abreviaciones específicas de la Biblia si no se generan automáticamente.

---

### 2. **Citando comentarios bíblicos (como Adam Clarke's Commentary)**  
Los comentarios suelen citarse como libros o capítulos de libros.

#### **En Zotero:**
1. **Crear una entrada nueva**:
   - Tipo: *Libro* o *Capítulo de libro* (si citas un comentario específico de un pasaje).
2. Completa los campos:
   - **Autor**: "Adam Clarke, LL.D., F.S.A."
   - **Título**: "Adam Clarke's Commentary on the Bible".
   - **Editor/Editorial**: Si es una edición específica, como *Abingdon Press*.
   - **Fecha de publicación**: "1810–1826" o la edición específica que tengas.
   - **Volumen**: Si aplicable, escribe el volumen que contiene el comentario del versículo.
   - **Número de página**: Especifica la página donde está el comentario.

#### **En LibreOffice:**
- Inserta la cita con Zotero. 
- Verifica que el formato cumple con tus necesidades (puedes personalizarlo en las preferencias de Zotero).

---

### 3. **Estilos de citación recomendados**
- Usa el estilo *Chicago Manual of Style (Full Note)* para notas completas. Este estilo permite manejar citaciones complejas como las de la Biblia.
- Si trabajas con estudios bíblicos, utiliza el estilo *Society of Biblical Literature (SBL)*, que está diseñado específicamente para este tipo de textos.

---

### 4. **Notas personalizadas (opcional)**
Si necesitas incluir detalles específicos (como "public domain"), puedes añadirlos en el campo *Extra* de Zotero o directamente en el documento después de insertar la cita.

Por ejemplo:
```  
Adam Clarke, *Adam Clarke's Commentary on the Bible*, vol. 1 (1810–1826), comentario sobre Juan 3:16.
``` 


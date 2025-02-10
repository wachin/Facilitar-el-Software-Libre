# Cómo Instalar Zotero y con LibreOffice citar Comentarios Bíblicos de e-Sword, y versículos
Me he preguntado cómo poder citar Comentarios Bíblicos de e-Sword usando Zotero para insertarlos en LibreOffice, lo siguiente es lo que he hecho


## Instalar Zotero en Debian, Ubuntu

Zotero es una herramienta excelente para la gestión de referencias bibliográficas y citas. A continuación, se presentan dos formas de instalación: una sin elevación de permisos y otra con permisos de superusuario.

### **Forma 1: Instalación manual sin elevación de permisos**

En esta forma, instalaremos Zotero en una carpeta dentro del directorio del usuario sin necesidad de permisos de superusuario.

#### Paso 1: Descargar Zotero
Descarga el archivo desde la página oficial:

[https://www.zotero.org/download/](https://www.zotero.org/download/)

#### Paso 2: Extraer el archivo
Ve a la carpeta donde se descargó el archivo comprimido, cortado con clic derecho cortar y llevalo alguna carpeta donde tengas instaladores de Linux ejemplo:

/AppsLinux

y puedes extraerlo de dos formas:

1. **Extracción manual.-** En un administrador de archivos da clic derecho y Extraer aquí y se extraerá.
2. **Extracción desde la línea de comandos**.- Abre una terminal y pon:

```bash
cd ~/AppsLinux
tar -xvjf Zotero-*.*.*_linux-*.tar.bz2
```

Esto creará la carpeta `Zotero_linux-*` en `~/AppsLinux/`.

#### Paso 3: Configurar el icono
Accede a la carpeta extraída y ejecuta el script con doble clic `set_launcher_icon` o sino desde la terminal donde estabas ubicado:

```bash
./set_launcher_icon
```

si no estaba allí entre con:

```bash
cd ~/AppsLinux/Zotero_linux-*
```

Este script actualizará el archivo `zotero.desktop` con la ruta correcta del icono.

#### Paso 4: Crear un acceso directo
Para que Zotero aparezca en el menú de aplicaciones, crea un enlace simbólico del archivo `zotero.desktop` en `~/.local/share/applications/`:

Primero asegúrate de que la carpeta **applications** esté en el lugar correcto:

```bash
mkdir -p ~/.local/share/applications
```

luego si crea el enlace simbólico:

```bash
ln -s ~/AppsLinux/Zotero_linux-*/zotero.desktop ~/.local/share/applications/
```

**Nota:** Debes verificar que los nombres de las carpetas son exactamente los mismos que aquí, de lo contrario se creará un archivo erroneo en "~/.local/share/applications/" y deberá borrarlo manualmente y corregir algún error para volver a intentarlo.

Si todo lo hizo bien hora Zotero estará disponible en el menú de aplicaciones y podrá ser lanzado desde allí.

### **Forma 2: Instalación con elevación de permisos**

En esta forma, instalaremos Zotero en el directorio `/opt/` y configuraremos el acceso desde la línea de comandos.

#### Paso 1: Descargar Zotero
Este paso es el mismo que en la forma manual

#### Paso 2: Extraer y mover a `/opt/`
Este paso es el mismo que en la forma manual

#### Paso 3: Configurar el icono
Ejecuta el script `set_launcher_icon` dentro del directorio de instalación:

```bash
cd /opt/zotero
sudo ./set_launcher_icon
```

Esto actualizará el archivo `zotero.desktop` con la ruta correcta del icono.

#### Paso 4: Crear acceso en el sistema
Para que Zotero esté disponible en el menú de aplicaciones, mueve el archivo `zotero.desktop` a `/usr/share/applications/`:

```bash
sudo mv /opt/zotero/zotero.desktop /usr/share/applications/
```

### **Ejecutar Zotero**

- Desde el menú de aplicaciones
- Desde la terminal:

```bash
/opt/zotero/zotero
```

O si lo instalaste en tu carpeta de usuario:

```bash
~/AppsLinux/Zotero_linux-*/zotero
```

Ahora Zotero estará correctamente instalado y accesible desde tu sistema.


## **Actualizar Zotero**

### **Actualizar Zotero sin elevación de permisos**

1. Elimina la versión anterior (opcional, si prefieres conservar configuraciones y bibliografía, solo sobrescribe):

   ```bash
   rm -rf ~/AppsLinux/Zotero_linux-*
   ```

2. Descarga la nueva versión y extráela siguiendo los pasos de la instalación manual.
3. Ejecuta `set_launcher_icon` nuevamente, manualmente o desde la terminal:

   ```bash
   cd ~/AppsLinux/Zotero_linux-*
   ./set_launcher_icon
   ```

### **Actualizar Zotero con permisos de superusuario**

1. Elimina la versión anterior:

   ```bash
   sudo rm -rf /opt/zotero
   ```

2. Descarga la nueva versión y extráela siguiendo los pasos de la instalación en `/opt/`.
3. Ejecuta `set_launcher_icon` nuevamente:

   ```bash
   cd /opt/zotero
   sudo ./set_launcher_icon
   ```

## **Desinstalar Zotero**

### **Desinstalar Zotero sin elevación de permisos**

Para eliminar Zotero instalado manualmente en tu carpeta de usuario:

```bash
rm -rf ~/AppsLinux/Zotero_linux-*
rm ~/.local/share/applications/zotero.desktop
```

Si deseas eliminar configuraciones y datos de usuario:

```bash
rm -rf ~/.zotero
```

y la carpeta en tu usuario:

Zotero

### **Desinstalar Zotero con permisos de superusuario**

Para eliminar Zotero instalado en `/opt/`:

```bash
sudo rm -rf /opt/zotero
sudo rm /usr/share/applications/zotero.desktop
```

Si deseas eliminar configuraciones y datos de usuario:

```bash
rm -rf ~/.zotero
```

y la carpeta en tu usuario:

Zotero

Ahora Zotero estará completamente eliminado de tu sistema.



---

# **Instalar el complemento de Zotero para LibreOffice**

Zotero ofrece un complemento para LibreOffice que permite gestionar citas y bibliografía de manera eficiente. Para instalarlo, sigue estos pasos:

## **Paso 1: Abrir Zotero y acceder a la configuración**

1. Abre Zotero.
2. Dirígete al menú `Editar > Ajustes`.
3. Selecciona la pestaña `Citar`.
4. En la parte inferior, localiza la sección `Procesador de texto`.
5. Haz clic en el botón `Instalar complemento LibreOffice`.

## **Paso 2: Seguir las instrucciones de instalación**

Aparecerá una ventana de instalación, sigue las instrucciones en pantalla.

## **Paso 3: Reiniciar LibreOffice**

Antes de usar el complemento, cierra LibreOffice si estaba abierto y vuelve a iniciarlo. Ahora deberías ver la barra de herramientas de Zotero en LibreOffice.

Si el complemento no aparece, revisa la sección de extensiones de LibreOffice:

1. Abre LibreOffice y ve a `Herramientas > Gestor de extensiones`.
2. Busca `Zotero LibreOffice Integration` y verifica que esté activado.
3. Si no aparece, intenta reinstalarlo desde Zotero siguiendo los pasos anteriores.

## **Paso 4: Verifica el tamaño de los iconos de LibreOffice
En LibreOffice con la Interfaz de usuario normal (Barras de herramientas convencionales) siempre me gusta ponerle el tamaño de los inocos de LibreOffice de tamaño pequeño para que entre bien la extensión de Zotero, esto lo hago en:

`Herramientas > Opciones > Ver`

allí en "Tamaño de iconos" a todos les pongo `Pequeño` y clic en `Aplicar` y `Aceptar`

además la extensión se la puede mover de lugar en caso de que desee que esté en otro lado, para hacerlo darle clic derecho y desmarcar:

`Bloquear posición de barra de herramientas`

y aparecerán tres puntitos verticales, darles clic y se puede mover la extensión.

**Nota:** En LibreOffice con la Interfaz de Ribbon "Cinta" es posible no se integre bien, pero deben arreglarlo en cualquier momento.

Ahora, Zotero estará completamente integrado con LibreOffice, permitiéndote gestionar referencias de manera sencilla.


## Desinstalar plugin de Zotero en LibreOffice
Si alguna vez necesitas desinstalarlo, en LibreOffice:

`Herramientas > Gestor de extensiones`

da clic en:

`Zotero LibreOffice Integration`

y da clic en:

`Quitar`

y aparecerá un mensaje que te pregunta por si deseas reiniciar, pon que si.

---

# Instalar el **Zotero Connector** en tu navegador y configurarlo para que funcione con **Google Docs**.
Esto es para Navegadores Web basados en Chromium (como Google Chrome o Microsoft Edge, o Chromium mismo) o Firefox

---

# Instalar Zotero Connector en tu navegador
1. **Abre tu navegador** (Chrome, Edge, Firefox, Chromium, etc.).
2. **Visita la página de Zotero Connector**:
   - Ve a [https://www.zotero.org/download/connectors](https://www.zotero.org/download/connectors).
3. **Selecciona tu navegador**:
   - Si usas **Chrome** o **Edge**, haz clic en el botón **"Install Chrome Connector"**.
   - Si usas **Firefox**, haz clic en **"Install Firefox Connector"**.
4. **Sigue las instrucciones**:
   - Se te redirigirá a la tienda de extensiones de tu navegador (Chrome Web Store o Firefox Add-ons).
   - Haz clic en **"Agregar"** o **"Instalar"** para agregar la extensión a tu navegador.

---

## **Paso 2: Conectar Zotero Connector con Zotero**
1. **Abre Zotero** en tu sistema (asegúrate de que esté en ejecución).
2. **En el Navegador Web haz clic en el complemento del ícono de Zotero Connector** en la barra de herramientas de tu navegador, es un ícono que parece una hoja de papel, sino aparece ve las configuraciones de las extensiones y hazlo visible.
3. **Conecta Zotero Connector con Zotero**:
   - Si es la primera vez que lo usas, Zotero Connector te pedirá que lo conectes con la aplicación Zotero.
   - Sigue las instrucciones en pantalla para completar la conexión.

---

## **Paso 3: Configurar Zotero Connector en Google Docs**
1. **Abre Google Docs**:
   - Ve a [https://docs.google.com/](https://docs.google.com/) y abre un documento nuevo o existente.
2. **Habilita la integración de Zotero**:
   - En la barra de menú de Google Docs, haz clic en  **"Zotero"** > **"Add/Edit Bibliography"** y se abrirá una ventana preguntadote para conectarse con una cuenta, yo elegí una de Google mía y acepta la integración.
3. **Inserta citas o bibliografía**:
   - Zotero Connector te permitirá buscar referencias desde tu biblioteca de Zotero y agregarlas directamente en tu documento de Google Docs.
   - También puedes generar una bibliografía automáticamente.

---

## **Paso 4: Verificar la instalación**
1. **Prueba la integración**:
   - Abre un artículo o página web en tu navegador y haz clic en el ícono de Zotero Connector para guardar la referencia en tu biblioteca de Zotero.
   - Luego, abre Google Docs y verifica que puedas insertar citas y bibliografías sin problemas.

---

## **Notas adicionales**
- **Sincronización**: Si usas Zotero Sync, asegúrate de que tu biblioteca esté sincronizada para acceder a tus referencias desde cualquier dispositivo.
- **LibreOffice**: Si también quieres usar Zotero con LibreOffice, asegúrate de que el complemento de Zotero esté instalado y activado en LibreOffice (esto ya lo tienes configurado según mencionaste).

---

# Cómo citar Comentarios Bíblicos de e-Sword en LibreOffice con Zotero

En `e-Sword` en el menú:

`Descargar > Comentarios`

Ejemplo he instalado el comentario: 

**"Adam Clarke, Adam Clarke's Commentary on the Bible"**

Luego de instalado, cerré `e-Sword` y lo volví a abrir y dí clic en `e-Sword` en la pestaña en el menú:

`Comentario > Información...`

y selecciono allí lo que me parece importante y lo pego aquí:

    Adam Clarke's Commentary on the Bible  
    Adam Clarke, LL.D., F.S.A., (1715-1832)  
    Published in 1810-1826; public domain.   

En Zotero, puedes citar versículos bíblicos y comentarios bíblicos como **Adam Clarke's Commentary on the Bible** en LibreOffice utilizando el campos personalizados de Zotero:

## **En Zotero:**
1. **Crea una nueva colección**
   - Da clic derecho a "**Mi Biblioteca**" y clic en "**Nueva Colección**" y ponle ejemplo el nombre: "**Comentarios Bíblicos**" y estando ubicado en él:
2. **Crear Nuevo Elemento**
    Da clic en:
    `Archivo > Nuevo Elemento > Sección de un libro`
3. Completa los campos:
   - **Título**: "Adam Clarke's Commentary on the Bible".
   - **Autor**: "Clarke, Adam"
   - **Editorial**: (Como no tiene dejala vacía)
   - **Fecha de publicación**: "1810–1826"
   - **Páginas**: Génesis 25:26
   - **Derechos**: Public Domain

## **En LibreOffice:**
- Inserta la cita con Zotero, en el primer icono que al pasar el cursor dice: **"Add/Edit Citation"** dale clic  
- Verifica que el **formato del estilo** cumple con tus necesidades (puedes personalizarlo en las preferencias de Zotero en el icono **Tuerca** en el complemento de LibreOffice o en Zotero en `Editar > Ajustes > Citar`), yo lo he dejado en **Chicago Manual of Style (Full Note)** el cual deja en la misma hoja abajo más información de la cita, pero cada cita tendrá un número en exponente, ejemplo: **¹**, pero si prefiere que cada cita tenga el nombre del autor y la fecha use **Chicago Manual of Style (author-date)** con lo que quedará en cada cita ejemplo: **(Clarke 1810)**

---

# **Citando versículos bíblicos**   
Citar versículos bíblicos en **Zotero** y luego insertarlos en **LibreOffice** es posible, pero requiere un poco de configuración, ya que Zotero no tiene un estilo de cita predefinido exclusivo para la Biblia. Sin embargo, puedes lograrlo así:

## **En Zotero:**
1. **Crea una nueva colección**
   - Da clic derecho a "**Mi Biblioteca**" y clic en "**Nueva Colección**" y ponle ejemplo el nombre: "**Versículos Bíblicos**" y estando ubicado en él:
2. **Crear Nuevo Elemento**
    Da clic en:
    `Archivo > Nuevo Elemento > Libro`
3. Completa los campos clave:
   - **Título**: Juan 3:16.
   - **Autor**: Da clic en el botón "Cambiar a campo único" y escribir ejemplo: "Reina-Valera 1960".
   - **Lugar**: México
   - **Fecha de publicación**: 1960.
   - **ISBN**: Si lo tiene coloquelo.
   - **Editorial**: "Sociedades Bíblicas Unidas".
   - **Derechos**: © 1960 Sociedades Bíblicas Unidas.

## **En LibreOffice:**
- Asegúrate de usar el formato nativo de LibreOffice **"odt"**.
- Inserta la cita en el texto utilizando la extensión o complemento Zotero, para hacerlo, en LibreOffice dale clic al icono que al pasar el cursor dice: **"Add/Edit Citation"**. 
- Verifica que el **formato del estilo** como en el caso anterior.

---

# Insertar la bibliografía
1. Debes tener ya completado bastante del documento y dar clic en LibreOffic en en el complemento Zotero en icono que al pasar el cursor dice: **Add/Edit Bibliography**
1. Espera y se insertará, además si necesitas actualizar la Bibliografía da clic en el botón "**Refresh**"
   - Esto generará una lista de todas las fuentes citadas, incluyendo la Biblia.

---

Si encuentras que en esta entrada hay algún error, escríbelo en los comentarios para arreglarlo

Dios te bendiga
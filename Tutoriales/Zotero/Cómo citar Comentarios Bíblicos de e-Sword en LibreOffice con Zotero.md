# Cómo Instalar Zotero y con LibreOffice citar Comentarios Bíblicos de e-Sword
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

# Cómo citar Comentarios Bíblicos de e-Sword en LibreOffice con Zotero

En e-Sword en el menú:

`Descargar > Comentarios`

Ejemplo he instalado el comentario: 

**"Adam Clarke, Adam Clarke's Commentary on the Bible"**

Luego de instalado, cerré e-Sword y lo volví a abrir y dí clic en e-Sword en la pestaña en el menú:

`Comentario > Información...`

y selecciono allí lo que me parece importante y lo pego aquí:

    Adam Clarke's Commentary on the Bible  
    Adam Clarke, LL.D., F.S.A., (1715-1832)  
    Published in 1810-1826; public domain.   

En Zotero, puedes citar versículos bíblicos y comentarios bíblicos como **Adam Clarke's Commentary on the Bible** en LibreOffice utilizando los campos personalizados de Zotero:

#### **En Zotero:**
1. **Crear una entrada nueva**
    Da clic en:
    `Archivo > Nuevo Elemento > Sección de un libro`
2. Completa los campos:
   - **Título**: "Adam Clarke's Commentary on the Bible".
   - **Autor**: "Clarke, Adam"
   - **Editor/Editorial**: (Como no tiene dejala vacía)
   - **Fecha de publicación**: "1810–1826"
   - **Páginas**: Génesis 25:26
   - **Derechos**: Public Domain

#### **En LibreOffice:**
- Inserta la cita con Zotero. 
- Verifica que el formato cumple con tus necesidades (puedes personalizarlo en las preferencias de Zotero).

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
- Por cierto, esto sólo funciona si uno guarda y usa el formato nativo de LibreOffice **"odt"**.
- Inserta la cita en el texto utilizando Zotero, para hacerlo dale clic al icono que al pasar el cursor dice: **"Add/Edit Citation"**. 
- Configura el estilo de citación (como *Chicago* o *SBL* si usas estándares bíblicos).

---

### 3. **Estilos de citación recomendados**
- Usa el estilo *Chicago Manual of Style (Full Note)* para notas completas. Este estilo permite manejar citaciones complejas como las de la Biblia.
- Si trabajas con estudios bíblicos, utiliza el estilo *Society of Biblical Literature (SBL)*, que está diseñado específicamente para este tipo de textos.

---

### 4. **Notas personalizadas (opcional)**
Si necesitas incluir detalles específicos (como "public domain"), puedes añadirlos en el campo *Derechos* de Zotero o directamente en el documento después de insertar la cita.

Por ejemplo:
```  
Adam Clarke, *Adam Clarke's Commentary on the Bible*, vol. 1 (1810–1826), comentario sobre Juan 3:16.
``` 


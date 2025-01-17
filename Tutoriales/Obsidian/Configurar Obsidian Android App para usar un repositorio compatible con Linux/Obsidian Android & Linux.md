
# Obsidian: Sincronización con GitHub y Uso en Android y Linux

## ¿Qué es Obsidian?
Obsidian puede ser una poderosa base de conocimientos pues uno puede guardar en una carpeta local archivos Markdown de texto con escritos y notas, tutoriales y demás, lo cual puede llegar a funcionar como un "segundo cerebro", permitiendo a los usuarios organizar y gestionar todo tipo de conocimiento de forma flexible y eficaz. Además, Obsidian está disponible para Android, facilitando su uso en dispositivos móviles tanto como para ordenadores:

[Descargar Obsidian para Android](https://play.google.com/store/apps/details?id=md.obsidian)

[Descargar Obsidian para Windows, Linux, MAC, iOS](https://obsidian.md/download)


# ¿Qué es Markdown?

Markdown es una forma simple de agregar formato (como negritas, listas, títulos, etc.) a un texto sin tener que usar opciones complicadas o menús de edición.

Markdown es un lenguaje de marcado, lo que significa que usa símbolos específicos para añadir formato a un texto. La idea detrás de Markdown es que el texto sea fácil de leer y de escribir, sin necesidad de un editor avanzado, lo cual es ideal para tomar notas rápidas y bien organizadas.

Cuando vas creado una nota en Obsidian, en la esquina derecha arriba (al lado de los tres puntitos) se puede intercambiar entre dos modos, veras un icono de un lápiz o un libro abierto, y dándole clic intercambiarás entre uno u otro de esos modos, y cuando estés en el modo de edición, arriba del teclado del celular (aproximadamente en medio de la pantalla) aparecerá una "Barra de herramientas móvil" que tiene unos iconos los mismos que servirán para usar algunos formatos básicos como los siguientes que también se pueden escribir manualmente

Por ejemplo:

1. En lugar de buscar un botón para poner el texto en negrita, en Markdown simplemente escribes: 
~~~
**tu texto en negrita**
~~~
muestra **tu texto en negrita** y al verlo Obsidian lo mostrará en negrita. Puedes usar también para esto el icono "B".

2. Para escribir en cursiva, solo necesitas escribir: 
~~~
*texto en cursiva*
~~~
y muestra *Texto en cursiva*. Puedes usar también para esto el icono "I"

## Ejemplos básicos de Markdown

3. Encabezados: Para añadir un título o encabezado, usa el símbolo #. La cantidad de # indica el nivel del encabezado.
~~~
# Título principal
## Subtítulo
### Sub-subtítulo
~~~
 también para esto puedes usar el icono "H"

4. Listas:

Para listas con viñetas, usa: - seguido del contenido:

~~~
- Elemento 1
- Elemento 2
~~~
Para listas numeradas, usa números seguidos de un punto:
~~~
1. Primer elemento
2. Segundo elemento
~~~

5. Enlaces a otras notas: En Obsidian, escribes:
~~~
[[Nombre de la otra nota]]
~~~
para crear un enlace directo a otra nota en tu bóveda. También puedes usar para esto el icono []

6. Imágenes: Usa 
~~~
![[nombre-de-la-imagen.jpg]] 
~~~
para agregar imágenes dentro de la nota. También puedes usar para esto el icono: clip

## Cómo usar Obsidian sincronizado con GitHub
Antes de seguir les explico el porqué de este tutorial, sucede que yo uso Linux Debian de 32 bit y Obsidian para Linux no tiene una versión 32 bit sino sólo de 64 entonces por eso se me ocurrió ver si Obsidian puede usar un repositorio de GitHub pues si fuera así en Android usando Obsidian con un repositorio git (instalado en Termux) podría yo tener los archivos sincronizados en la nube, y luego en Linux de 32 bit con git podría clonar ese repositorio y abrir los archivos .md con algún editor de Markdown como VNote, Ghostwriter, etc, etc que funcionan en Linux de 32 bit, y luego hacer alguna modificación y enviar los cambios a la nube, y luego viceversa sincronizando entre ambos Android y Linux en  el repositorio para tener sincronizados mis archivos en la nube y en local, y si se puede, es posible

### Paso 1: Sincronización con GitHub en Android

Para configurar Obsidian en Android y sincronizarlo con un repositorio de GitHub que sea compatible con Linux, sigue estos pasos:

1. **Instalar Git en Android (usando Termux)**:
   - Instala Termux, vea el siguiente tutorial [Instalar-git-en-Android-con-Termux ](https://github.com/wachin/Instalar-git-en-Android-con-Termux)

2. **Clonar tu repositorio de GitHub**:
   - Una vez que tenga acceso a su almacenamiento Interno, en Termux, clona tu repositorio de GitHub (debes tener uno) donde almacenarás tus notas de Obsidian:
     ```bash
     git clone https://github.com/tu-usuario/tu-repositorio
     ```
   - Asegúrate de que el repositorio ya tenga al menos un **push** realizado previamente (es decir, debe tener contenido subido a GitHub).

3. **Crear el archivo .gitignore** 
Para evitar problemas en la sincronización que se podrían dar por los archivos de configuración de Obsidian (.obsidian) que cambian frecuentemente, lo que podría causar conflictos o corrupción en el repositorio si no están correctamente excluidos, agrega un archivo .gitignore para evitar que estos archivos sean rastreados por Git.

**Crea archivo .gitignore manualmente**
Crea un archivo .gitignore con algún editor de texto o con nano en el directorio raíz del repositorio (tu-repo/.gitignore) con el siguiente contenido:

```
# Ignorar configuraciones específicas de Obsidian
.obsidian/

# Ignorar archivos temporales del sistema
.DS_Store
Thumbs.db

# Ignorar archivos de respaldo
*.bak
*.tmp

# Ignorar cualquier archivo temporal generado por la aplicación
*.swp
*.lock

# Ignorar cachés y otros directorios que no son necesarios
.cache/
.trash/
```
Guardar y cerrar.

**O Crea el archivo .gitignore: desde Termux:**
Si deseas crearlo con un solo comando pon en Termux:

```
echo -e "# Ignorar configuraciones específicas de Obsidian\n.obsidian/\n\n# Ignorar archivos temporales del sistema\n.DS_Store\nThumbs.db\n\n# Ignorar archivos de respaldo\n*.bak\n*.tmp\n\n# Ignorar cualquier archivo temporal generado por la aplicación\n*.swp\n*.lock\n\n# Ignorar cachés y otros directorios que no son necesarios\n.cache/\n.trash/" > .gitignore
```

**Explicación**
- .obsidian/: Ignora todo el directorio de configuración de Obsidian. Si deseas sincronizar temas o plugins específicos, puedes incluirlos manualmente.
- Archivos temporales: Se agregan patrones para ignorar archivos comunes que no son relevantes para el control de versiones, como *.swp, *.lock, y archivos de respaldo.
- Archivos del sistema: Excluye archivos como .DS_Store y Thumbs.db generados automáticamente por el sistema operativo.

**Actualizar el repositorio:**  
```
git add .gitignore
git commit -m "Añado .gitignore para excluir archivos de configuración de Obsidian"
git push
```

**Verificar el estado:** 
Los cambios en el directorio .obsidian/ ya no deben aparecer en los resultados de git status.


4. **Configurar Obsidian con el repositorio clonado**:
   - Abre Obsidian en tu dispositivo Android.
   - Durante la configuración inicial da clic en "Open folder as vault >" o si ya estás dentro de un vault da clic al icono del **libro** que está arriba a la izquierda que abre el panel lateral izquierdo y clic al lado izquierdo de la tuerca en el signo ∨ y da clic en la opción **Administrar bóvedas. .**, selecciona la carpeta local donde se encuentra el repositorio que has clonado el cual será usado como lo que Obsidian llama "Vault" (Bóveda), además puedes buscar otra carpeta local y seleccionarla como vault. Ejemplo yo tengo dos carpetas donde tengo tutoriales y me intercambio a veces entre uno y otro vault.
   - A partir de este momento, cuando agregues notas o carpetas en Obsidian podrán sincronizarse con GitHub usando `git` en Termux.

### Paso 2: Configuración de Obsidian en Android

1. **Cambiar el idioma a español**:
   - Abre Obsidian.
   - Haz clic en el ícono del **libro** que se encuentra en la parte superior izquierda.
   - Luego, haz clic en el **ícono de engranaje** para acceder a la configuración.
   - En **Opciones** en la sección **Acerca de** y cambia el idioma mostrado de "English" a **Español**. Después, selecciona **Relaunch** para aplicar los cambios o cierra y vuelve a abrir Obsidian App

2. **Desactivar los "Wikilinks"**:
   - En **Opciones** en la sección **Archivos y Enlaces**.
   - Desmarca la opción **Usar [[Wikilinks]]** esto es para poder editar los archivos Markdown en Linux con editores como Typora, Ghostwriter, VNote, etc. (Si cambias de vault, en ese otro también tienes que configurar esto).

3. **Detectar todas las extensiones de archivo (Opcional)**:
   - También en **Archivos y Enlaces**, activa la opción **Detectar todas las extensiones de archivo** si deseas que Obsidian reconozca una mayor variedad de archivos.

---

## Edición de tus notas de Obsidian en Linux

Para editar tus notas en Linux, tienes varias opciones:

### Opción 1: Instalar Obsidian en Linux
Aunque no es mi objetivo, si tienes un Sistema Operativo Linux de 64 bit puedes instalar la versión de 64 bits de Obsidian directamente desde su sitio web oficial:
- [Descargar Obsidian](https://obsidian.md/download)

### Opción 2: Editar tus notas en Linux usando otros editores
Si prefieres editar tus notas de Obsidian utilizando otros editores de Markdown en Linux, ejemplo si usas un Linux de 32 bit puedes clonar tu repositorio de GitHub en tu sistema Linux y utilizar uno de los siguientes programas:

- **VNote**: Editor de Markdown con excelente soporte para notas y carpetas [Info aquí](https://facilitarelsoftwarelibre.blogspot.com/search/label/VNote)
- **Ghostwriter**: Editor de Markdown minimalista.[Info](https://facilitarelsoftwarelibre.blogspot.com/search/label/Ghostwriter)
- **Typora**: Editor de Markdown que renderiza el formato en tiempo real, de pago, pero ellos hicieron unas versiones beta que todavía funcionan y son gratis: [Info](https://facilitarelsoftwarelibre.blogspot.com/search/label/Typora)
- **Retext** [Info](https://github.com/retext-project/retext)
- Otros Editores [Info](https://facilitarelsoftwarelibre.blogspot.com/search/label/Markdown)
- **StackEdit** es un editor de texto en línea que te permite crear documentos utilizando Markdown. Con StackEdit puedes crear documentos profesionales: Desde simples notas hasta informes más complejos, exportar a diferentes formatos: Puedes guardar tu trabajo como HTML, PDF, o incluso como un documento de Word. Sincronizar con la nube: Conecta tu cuenta de Google Drive o Dropbox para tener tus documentos siempre a mano. [Info](https://stackedit.io/)
- **Dillinger** Parecido al anterior, es online, es una plataforma habilitada para la nube, compatible con dispositivos móviles y con almacenamiento fuera de línea. [Info](https://dillinger.io/)
- **HACKMD** Parecido al anterior, se puede hacer login con Google., Facebook Twitter, GitHub, Dropbox, Wallet [Info](https://hackmd.io/?nav=overview/)

Para clonar tu repositorio en Linux, ejecuta:
```bash
git clone https://github.com/tu-usuario/tu-repositorio
```

Una vez clonado, abre los archivos Markdown con el editor que prefieras. Sincronizalo con los comandos `git`

---

# Usar Obsidian para editar archivos Markdown en Android

Aunque no se puede usar directamente Obsidian como un editor de archivos Markdown en Android, al menos no en la versión que he instalado en el 2024, es posible copiar el archivo Markdown que uno tenga en el celular en el Almacenamiento Interno y pegarlo a la carpeta que Obsidian usa (Vault = bóveda) para sus archivos, en este caso es el repositorio git, y allí editarlo con Obsidian (al abrir Obsidian lo verá entre los archivos) y luego copiarlo de allí y sobre-escribirlo en el lugar donde estaba.


# Tutorial básico sobre cómo comenzar con Obsidian en Android, ideal para organizar notas, ideas, diarios, y más.
El siguiente es un pequeño tutorial para usar Obsidian:

## Crear una carpeta dentro de tu Vault (Bóveda)
Para organizar tus notas, puedes crear carpetas. Esto es útil si quieres separar temas, como clases, ideas o tu diario personal (por ejemplo por fechas).

1. En Obsidian Apps en la esquina superior izquierda da clic en el icono del **libro** que abre el panel lateral izquierdo (la vista principal de tu Vault - Bóveda)
2. Abajo pulsa en el icono en forma de carpeta que tiene un + en medio. 
3. Escribe un nombre para tu carpeta, por ejemplo, "Diario", "Ideas" o "Clases".
4. Pulsa OK
5. Da Enter para guardar la carpeta.

### Crear una nota dentro de una carpeta

1. En Obsidian App en la esquina superior izquierda da clic en el icono del **libro** que abre el panel lateral izquierdo, la vista principal de tu Vault (Bóveda), elige la carpeta (en el paso anterior vimos como crear una) donde quieres crear la nota. Pulsala y sueltala y aparecerá una "Nueva nota"
2. Dale un nombre a la nota, por ejemplo, "Clase de hoy" o "Ideas para el proyecto".
3. Debajo del título ahora puedes empezar a escribir directamente en tu nueva nota.


## Mover notas entre carpetas
1. Desde arriba en la barra lateral izquierda, elige la carpeta donde se encuentra la nota que quieres mover.
2. Mantén presionada la nota que deseas mover.
3. Aparecerá una opción que ttdice "Mover archivo a..". ttTócala y selecciona la carpeta de destino.

## Insertar imágenes en tus notas
Obsidian, por defecto, guarda los archivos adjuntos (como imágenes) en la raíz de la bóveda, a menos que configures un comportamiento diferente en sus ajustes, puedes personalizar la ubicación de los archivos adjuntos para que las imágenes se guarden en la misma subcarpeta donde está la nota para que cuando desee ver las imágenes desde un navegador web en la página de github las imágenes carguen.

### Configurando Obsidian para que guarde las imágenes en la misma carpeta de la nota
Haga lo siguiente:

1. Abrir configuración:

Haz clic en el ícono de "Configuración" (⚙️) en la barra lateral izquierda de Obsidian.

2. Ir a la sección de **"Archivos y Enlaces"**:

En Obsidian App 1.7.7 en Android en busca: 

"Ubicación predeterminada para los archivos adjuntos nuevos"

Dale clic all selector y escoge entre las opciones:

"Misma carpeta donde está el archivo"



3. Guardar los cambios:

Una vez seleccionada tu preferencia, Obsidian aplicará esta configuración para futuros archivos adjuntos, y solo debe salir de allí cerrando las opciones por donde llegó.

### **Opcional: Mover imágenes existentes**

Si ya tienes imágenes en la raíz de tu bóveda que quieres mover a las subcarpetas correspondientes, puedes hacerlo manualmente:

1. Mover archivos:

Usa tu explorador de archivos para mover las imágenes a las carpetas correspondientes.

2. Actualizar enlaces:

Si los enlaces a las imágenes dejan de funcionar, puedes usar la función Buscar y reemplazar en Obsidian para actualizar las rutas.

**Ejemplo práctico:**

Si moviste las imágenes a una carpeta "imagenes" dentro de ejemplo una subcarpeta "Tutoriales", y antes estaban en la raíz:

Ruta antigua: ](imagen.png)

Ruta nueva: ](Tutoriales/imagenes/imagen.png)

En el campo de reemplazo, escribirías algo como:

Buscar: ](imagen.png)

Reemplazar con: ](Tutoriales/imagenes/imagen.png

Y sino, también se puede editar manualmente observando la ruta en la que está guardada la imagen.

### Insertando una imagen desde el dispositivo

Una vez configurado Obsidian, en tu dispositivo Android por ejemplo si tienes una imagen en la carpeta: 

DCIM

o:

Pictures

usa algún administrador de archivos para Android y copia la imagen a la carpeta deseada de tu bóveda

Luego, en Obsidian crea una nota dentro de alguna subcarpeta y dentro de la nota puedes usar el icono de clip para buscarla e insertarla (recomendado) o manualmente usa el siguiente formato para insertar la imagen: 

~~~~
![](nombre-de-la-imagen.jpg)
~~~~

Ejemplo una foto con mi amigo Fulco en Octubre 2024:

![](20241025-en-la-casa-de-Fulco.jpg)

Es así porque No estamos usando el siguiente formato de Wikilinks:

~~~~
 ![[nombre-de-la-imagen.jpg]]
~~~~
porque lo hemos configurado para poder usar el formato que entiende Git en sus repositorios y los editores de markdown![](20201002%20Como%20calmar%20las%20preocupaciones,%20Mateo%206.25-27%20-%20Fernando%20S.opus)

## Tomar una foto desde la nota:

No es posible hacerlo directamente desde Obsidian, pero puedes usar la cámara del teléfono y guardar la imagen en la carpeta de tu bóveda. Luego, insértala en la nota como en el paso anterior.

## Sugerencias para organizar tus notas

Usa etiquetas: En cualquier parte de la nota, escribe #Etiqueta pero debes escribir el asterisco seguido del nombre de la etiqueta pues de lo contrario lo tomará como un título. Esto te permite agrupar notas similares, como #Diario, #Ideas, o #Clases. Para buscarlas por este criterio en Obsidian App arriba en la esquina izquierda de clic al icono del **libro** que abre el contenido del Vault (Bóveda) y de clic en medio de "Explorador de archivos" y se abrirá un submenú y de clic en "Etiquetas" y allí las encontrará.

Puedes crear categorías específicas como "Ideas para libros", "Resúmenes de clase", o "Notas diarias".

## Carpetas y subcarpetas: 

Puedes crear subcarpetas dentro de las carpetas principales para organizar mejor la información.

## Búsqueda: 

Para usar el buscador hágalo desde arriba en la esquina izquierda dando clic en el icono que abre el contenido del Vault (Bóveda) y de clic en medio del "Explorador de archivos" y se abrirá un submenú y de clic en "Buscar" para buscar y encontrar rápidamente notas o temas específicos.

## Consejos finales

Aprovecha la interconexión: Al enlazar notas, puedes construir una red de ideas interconectadas.

### Gráfico local o segundo cerebro
Un Youtube hizo un vídeo bastante interesante sobre este tema: 

Tu propio diario inteligente II Obsidian
https://youtu.be/ASTsSyPoUWQ?si=02aFFqXR7NCKlxnR

En el celular en Android yo creo está opción dando clic arriba a la derecha en los tres puntos verticales y clic abajo en: 

Abrir gráfico local 

Para cerrarlo clic en los tres puntos verticales y clic en Cerrar

## Conclusión
Con esta configuración, puedes tener tus notas de Obsidian sincronizadas entre Android y Linux mediante GitHub, y ver las publicaciones allí y si tienen imágenes las podrá ver en cada publicación. No lo he probado entre Windows o MAC y sé que se pueden instalar allí (buscar en Google), y si a alguien les sirve allí que bueno.

# Quien inventó Markdown
Markdown fue creado en 2004 por John Gruber, con contribuciones de Aaron Swartz. Gruber, un escritor y desarrollador de software, diseñó Markdown con el objetivo de que los textos sin formato se leyeran de manera similar a como se verían formateados, para que los escritores pudieran enfocarse en el contenido sin preocuparse por la complejidad del formato.

Aaron Swartz, un programador y activista digital muy influyente, contribuyó en la implementación de Markdown, ayudando a escribir el primer convertidor que transformaba texto en Markdown a HTML. Markdown fue concebido como una alternativa sencilla a HTML, que a menudo resulta más complicado para escribir textos simples.


# Referencias

1. [Daring Fireball - Markdown](https://daringfireball.net/projects/markdown/)
2. [The Markdown Story on Wikipedia](https://en.wikipedia.org/wiki/Markdown)
3. [Aaron Swartz - Biography on the Internet Hall of Fame](https://www.internethalloffame.org/inductees/aaron-swartz)
4. [Obsidian Help Docs](https://help.obsidian.md/)
5. [Foro de la comunidad de Obsidian](https://forum.obsidian.md/)
6. [Canal de YouTube de Obsidian](https://www.youtube.com/c/ObsidianApp)
7. [Markdown Guide](https://www.markdownguide.org/)
8. [Turning Obsidian into Your Personal Wiki](https://sidequirk.com/turning-obsidian-into-your-personal-wiki)
9. [Plugins y temas de Obsidian: En GitHub, puedes explorar](https://github.com/obsidianmd/obsidian-releases)
10. [Construye tu segundo cerebro digital | Obsidian + NVIM | Organizarte | Youtube](https://youtu.be/6HSc2l0oyws?si=pWDeRqvfDpteTFN3)
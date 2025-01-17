### **Paso 1: Obtener el código del botón de PrintFriendly**
1. **Visita la página de PrintFriendly para obtener el código**:
   - Dirígete a este [enlace](https://www.printfriendly.com/blog/add-printfriendly-to-blogger-or-blogspot).
   - Selecciona **Blogger/Blogspot**.
   - Elige el estilo del botón que prefieras.
   - Copia el código que te proporcionan.

### **Paso 2: Editar tu plantilla HTML en Blogger**
1. **Inicia sesión en tu cuenta de Blogger**.
2. En el panel de control, haz clic en **Diseño** (en la barra lateral).
3. Luego, selecciona **Editar HTML** (en la parte superior de la pantalla).
4. Marca la opción **Expandir plantillas de widget** (es importante para poder ver todo el código).
   
   > *Consejo*: Si no ves el código completo, asegúrate de que la opción "Expandir plantillas de widget" esté marcada.

### **Paso 3: Insertar el código del botón PrintFriendly**
1. Dentro del código de la plantilla, busca la línea que contiene **`<div class="post-footer">`**. 
   - Puedes buscar rápidamente esta línea presionando **Ctrl + F** (o **Cmd + F** en Mac) y luego escribiendo **`class='post-footer'`**.
2. Pega el código del botón de PrintFriendly **justo antes de la etiqueta `</div>` que cierra `class="post-footer"`**.

3. **Guarda los cambios**:
   - Haz clic en **Guardar plantilla** en la parte superior derecha.

### **Personaliza tu botón (opcional)**
#### 1. **Alinear el botón a la derecha**:
   Si quieres que el botón PrintFriendly se alinee a la derecha en la página del post, debes modificar el código del botón.

   - En el código de PrintFriendly que copiaste, busca dos etiquetas `<div class='pfbutton'>`.
   - Añade el siguiente estilo en línea en esas etiquetas: `style='float:right;'`.

   Ejemplo de lo que deberías hacer:
   ```html
   <div class='pfbutton' style='float:right;'> 
   ```

#### 2. **Usar tu propio gráfico o botón**:
   Si deseas utilizar tu propio gráfico en lugar del predeterminado, busca las etiquetas `<img>` dentro del código de PrintFriendly. 
   
   - Encuentra las etiquetas `<img>` que contienen la URL de las imágenes predeterminadas. 
   - Cambia la URL en el atributo `src` por la URL de tu propia imagen.

   Ejemplo:
   ```html
   <img src="URL_DE_TU_IMAGEN" alt="Botón de impresión">
   ```

#### 3. **Mostrar el botón solo en las páginas de post (no en la página principal)**:
   Si deseas que el botón de PrintFriendly solo aparezca en las páginas de las publicaciones, necesitas editar el código para excluirlo de la página principal.

   - El código de PrintFriendly tiene dos secciones:
     - Una para la página principal (con la palabra **Index**).
     - Otra para las páginas de post (con la palabra **Item**).
   
   - Cambia la palabra **Index** por **Item** en el código.
   - Luego, elimina la primera sección que contiene el código para la página principal.

   Así, el botón solo se mostrará en las páginas de las publicaciones.

### **Paso 4: Verifica y prueba el botón**
1. Una vez que hayas guardado la plantilla, dirígete a tu blog y abre una publicación individual.
2. Revisa si el botón PrintFriendly aparece como deseas: alineado correctamente, con tu imagen personalizada (si la cambiaron), y solo en las páginas de post.

¡Listo! Ahora deberías tener el botón PrintFriendly correctamente instalado y funcionando en tu blog de Blogger.

# **Cómo instalar y configurar tint2 con Openbox en MX Linux 23 KDE**

Este tutorial está diseñado para usuarios de **MX Linux 23 KDE** que desean instalar y configurar el panel **tint2** para usarlo junto con el gestor de ventanas **Openbox**.

---

## **1. Instalar Openbox y tint2**

1. Abre una terminal.
2. Ejecuta el siguiente comando para instalar Openbox y tint2:
   ```bash
   sudo apt install tint2 openbox nitrogen xfce4-appfinder
   ```
esto es lo más básico, pero guíate en mi repositorio con las demás configuraciones:

[https://github.com/wachin/openbox-kde-session-MX-Linux-KDE-23
](https://github.com/wachin/openbox-kde-session-MX-Linux-KDE-23)

pues son necesarias más cosas para que funcione.

3. Una vez instalados, cierra la sesión actual.
4. En la pantalla de inicio de sesión, selecciona **Openbox** como tu entorno de escritorio y accede con tu usuario.

---

## **2. Configurar un botón lanzador de aplicaciones en tint2 con xfce4-appfinder**

Por defecto, tint2 no incluye un botón lanzador de aplicaciones en su panel. A continuación, te explico cómo agregar uno para lanzar **xfce4-appfinder**:

### **2.1. Abrir las configuraciones de tint2**

1. Haz clic en el extremo inferior izquierdo del panel (en el área donde normalmente aparece un botón vacío).
2. Se abrirá la ventana de configuración de tint2.

---

### **2.2. Agregar un elemento "Botón" al panel**

1. En la ventana de configuración de tint2:
   - Ve a la sección **Propiedades**.
   - Haz clic en la pestaña **Elementos del panel**.
2. En el lado derecho, bajo "**Elementos disponibles**", selecciona el elemento **Botón**.
3. Haz clic en la flecha izquierda (ubicada en el centro de la ventana) para mover el elemento "Botón" a la sección "Elementos seleccionados".
4. Aparecerá una nueva sección llamada **Botón 1** en la parte inferior izquierda de la ventana principal.
5. Ese botón lo puedes ubicar donde desees, si lo deseas poner a la izquierda debes ponerlo arriba al principio, debes moverlo con la flecha arriba.

---

### **2.3. Configurar el botón con un icono y un comando**

1. Selecciona **Botón 1** en la lista de elementos.
2. Configura los siguientes parámetros:
   - **Format - Icono**: Ingresa la ruta del icono que quieres usar. Por ejemplo:
     ```
     /usr/share/icons/hicolor/32x32/apps/org.xfce.appfinder.png
     ```
   - **Format - Texto**: Déjalo vacío.
   - **Elementos de ratón - Comando de clic izquierdo**: Ingresa el comando para ejecutar el lanzador de aplicaciones:
     ```
     xfce4-appfinder
     ```

3. Haz clic en **Aplicar** y luego en **Aceptar** para guardar los cambios.

---

## 3. **Agrega un botón de Logout al panel**

1. En la ventana de configuración de tint2:
   - Ve a la sección **Propiedades**.
   - Haz clic en la pestaña **Elementos del panel**.
2. En el lado derecho, bajo "**Elementos disponibles**", selecciona el elemento **Botón**.
3. Haz clic en la flecha izquierda (ubicada en el centro de la ventana) para mover el elemento "Botón" a la sección "Elementos seleccionados".
4. Aparecerá una nueva sección llamada **Botón 2** en la parte inferior izquierda de la ventana principal.
5. Sugiero que el botón lo dejes allí pues se verá a la derecha del panel, pero sino puedes moverlo con las flechas.

---

### **3.1 Configura el botón**
1. Haz clic en **Botón 2** en la lista de elementos seleccionados.
2. En el panel de configuración, ajusta lo siguiente:
3.    - **Icono**:
     - Selecciona un icono para el botón. Puedes elegir uno existente o especificar la ruta a un archivo de icono, como:
       ```
       /usr/share/icons/Papirus-Light/24x24/panel/system-shutdown-panel-restart.svg
       - **Texto**:
       - Dejalo vacío pues sino ocupará mucho espacio en el panel
       
   - **Comando de clic izquierdo**: Escribe el comando que ejecutará **lxsession-logout**:
     ```bash
     /usr/bin/lxsession-logout
     ```
     

       ```
4. Aplicar y Aceptar

---

## **4. ¡Listo!**

Ahora deberías tener un icono en el extremo inferior izquierdo del panel que, al hacer clic, abre el lanzador de aplicaciones **xfce4-appfinder**, y en el extremo inferior derecho muestre el icono de **Logout**. Puedes repetir este proceso para agregar más botones personalizados con diferentes aplicaciones si lo deseas.

---

### **Notas adicionales**

- Si necesitas iconos adicionales, puedes buscarlos en el directorio `/usr/share/icons/` ejemplo como hice yo buscando la palabra xfce4-appfinder pues allí hay otros bonitos del tema papirus-icon-theme que está instalado por defecto, o usar tus propios iconos personalizados.
- Para personalizar más aspectos de tint2, explora las demás opciones en la configuración.
- Estoy también pensando en ponerle más cosas tomando como ejemplo a mi repositorio de fluxbox en el menú:
- 
[https://github.com/wachin/RisenPC-Fluxbox-ES/blob/main/menu](https://github.com/wachin/RisenPC-Fluxbox-ES/blob/main/menu)

Espero que esta guía sea útil y fácil de seguir. 😊 Dios te bendiga.

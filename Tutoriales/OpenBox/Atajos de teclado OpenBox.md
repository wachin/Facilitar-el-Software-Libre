
# Atajos de teclado más usados de Openbox




|                                        Acción                                        |        Teclas rápidas de Openbox        |
| ------------------------------------------------------------------------------------ | --------------------------------------- |
| Cerrar la ventana activa                                                             | Alt + F4                                |
| Mostrar el menú del cliente para la ventana activa                                   | Alt + Barra espaciadora                 |
| Cambiar entre ventanas en el escritorio                                              | Alt + Tab                               |
| Cambiar entre ventanas en el escritorio en orden inverso                             | Alt + Shift + Tab                       |
| Alternar entre el panel y las ventanas del escritorio                                | Ctrl + Alt + Tab                        |
| Ocultar todas las ventanas para mostrar el escritorio                                | Win + D                                 |
| Enviar la ventana activa detrás de otras ventanas y activar la última ventana en uso | Alt + Esc                               |
| Ir al primer escritorio al instante                                                  | Win + F1                                |
| Ir al segundo escritorio al instante                                                 | Win + F2                                |
| Ir al tercer escritorio al instante                                                  | Win + F3                                |
| Ir al cuarto escritorio al instante                                                  | Win + F4                                |
| Ir al escritorio a la izquierda del actual                                           | Ctrl + Alt + Flecha izquierda           |
| Ir al escritorio a la derecha del actual                                             | Ctrl + Alt + Flecha derecha             |
| Ir al escritorio encima del actual                                                   | Ctrl + Alt + Flecha arriba              |
| Ir al escritorio debajo del actual                                                   | Ctrl + Alt + Flecha abajo               |
| Ir al escritorio a la izquierda del actual y llevar la ventana activa contigo        | Shift + Alt + Flecha izquierda          |
| Ir al escritorio a la derecha del actual y llevar la ventana activa contigo          | Shift + Alt + Flecha derecha            |
| Ir al escritorio encima del actual y llevar la ventana activa contigo                | Shift + Alt + Flecha arriba             |
| Ir al escritorio debajo del actual y llevar la ventana activa contigo                | Shift + Alt + Flecha abajo              |
| Mover una ventana                                                                    | Sostener Alt + Clic izquierdo del ratón |
| Cambiar el tamaño de una ventana                                                     | Sostener Alt + Clic derecho del ratón   |
| Cambiar de escritorios hacia adelante y hacia atrás                                  | Sostener Alt + Rueda del ratón          |

Los siguientes atajos de teclado los he añadido yo

|                    Acción                    | Teclas rápidas Personalizadas |
| -------------------------------------------- | ----------------------------- |
| Abrir xfce4-appfinder                        | Ctrl + A                      |
|                                              |                               |
| Abrir el administrador de archivos Konqueror | Win + E                       |



## Añadiendo atajos de teclado



En Openbox, para minimizar ventanas no se utiliza un comando externo, sino una acción interna llamada **"Iconify"**. Aquí te explico cómo configurarlo:

### 1. Configuración básica para minimizar ventanas
En tu archivo `~/.config/openbox/rc.xml`, añade esta configuración dentro de la sección `<keyboard>`:

```xml
<!-- Minimizar ventana activa -->
<keybind key="W-m">  <!-- Win + M -->
  <action name="Iconify"/>
</keybind>

<!-- Minimizar ventana activa con F10 -->
<keybind key="F10">
  <action name="Iconify"/>
</keybind>
```

### 2. Atajos comunes para minimizar:
Puedes usar diferentes combinaciones según tus preferencias:

```xml
<!-- Usando tecla Windows + flecha abajo -->
<keybind key="W-Down">
  <action name="Iconify"/>
</keybind>

<!-- Usando Alt + F9 -->
<keybind key="A-F9">
  <action name="Iconify"/>
</keybind>

<!-- Usando Ctrl + Alt + M -->
<keybind key="C-A-m">
  <action name="Iconify"/>
</keybind>
```

### 3. Acciones adicionales útiles:
También puedes añadir estas acciones relacionadas con ventanas:

```xml
<!-- Restaurar todas las ventanas minimizadas -->
<keybind key="W-S-m">  <!-- Win + Shift + M -->
  <action name="Unshade"/>
  <action name="ToggleOmnipresent"/>
</keybind>

<!-- Minimizar todas las ventanas -->
<keybind key="W-d">  <!-- Win + D -->
  <action name="ToggleShowDesktop"/>
</keybind>

<!-- Cerrar ventana activa -->
<keybind key="A-F4">
  <action name="Close"/>
</keybind>
```

### 4. Pasos para implementar:
1. Edita tu archivo de configuración:
   ```bash
   nano ~/.config/openbox/rc.xml
   ```

2. Añade las combinaciones de teclas que prefieras dentro de la sección `<keyboard>`

3. Guarda el archivo (Ctrl+O) y cierra (Ctrl+X)

4. Recarga la configuración:
   ```bash
   openbox --reconfigure
   ```
   O simplemente cierra sesión y vuelve a entrar

### 5. Notas importantes:
- **W** = Tecla Windows/Super
- **A** = Tecla Alt
- **C** = Tecla Ctrl
- **S** = Tecla Shift
- Las acciones como `Iconify` son internas de Openbox, no requieren comandos externos
- Si usas LXQt, asegúrate de que no haya conflictos con sus atajos de teclado

### 6. Verificar que funciona:
1. Abre cualquier ventana
2. Presiona la combinación de teclas que configuraste
3. La ventana debería minimizarse al panel

Si quieres ver todas las acciones disponibles en Openbox, puedes revisar la documentación oficial o examinar el archivo `/etc/xdg/openbox/rc.xml` que contiene ejemplos de todas las acciones posibles.

# Consultas

**Openbox shortcuts** 
[https://tutorialtactic.com/keyboard-shortcuts/openbox-shortcuts/](https://tutorialtactic.com/keyboard-shortcuts/openbox-shortcuts/)

**Openbox keyboard shortcuts** 
[https://defkey.com/openbox-shortcuts#](https://defkey.com/openbox-shortcuts#)
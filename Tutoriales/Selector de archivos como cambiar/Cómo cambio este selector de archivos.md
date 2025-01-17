# ¿Cómo cambio este selector de archivos?

Lo siguiente es una traducción de (estoy tratando de entender todavía bien toda la solución):

**Kubuntu 18.10 - How do I change this file picker?**

https://askubuntu.com/questions/1150404/kubuntu-18-10-how-do-i-change-this-file-picker

Estoy usando Kubuntu 18.10 y tengo el administrador de archivos predeterminado, *Dolphin* , configurado bastante bien con servidores, favoritos, etc. en la barra lateral.

Ahora, cada vez que quiero abrir un archivo o carpeta desde un programa, se abre este selector de archivos:

Ahora, muchos programas abren este selector de archivos/carpetas en lugar del selector de archivos *Dolphin* :

[![Selector de archivos](https://i.sstatic.net/rc9Bh.png)](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://i.sstatic.net/rc9Bh.png)

**EDITAR** : Esto sucede, por ejemplo, en *Sublime Text* y *Firefox* . ¡Los programas preinstalados (por ejemplo, *Spectacle* o *Kate* ) parecen mostrar un selector de archivos *Dolphin* !

¿Hay alguna forma de reemplazar esto con el selector de archivos *Dolphin* , o al menos incluir mis favoritos, etc. en este programa?

Quiere que las aplicaciones utilicen el cuadro de diálogo de selección de archivos de KDE para que pueda tener una apariencia que coincida con la de Dolphin.

Como has visto, aplicaciones nativas como Spectacle sí se ajustan, pero otras no. Probablemente esto se deba a que las aplicaciones no conformes están basadas en gtk y utilizan el cuadro de diálogo de selección de archivos GTK:  

**Firefox utiliza el cuadro de diálogo de selección de archivos gtk de forma predeterminada**

[![Firefox usando el cuadro de diálogo de selección de archivos gtk](https://i.sstatic.net/vlZXE.png)](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://i.sstatic.net/vlZXE.png)

Para que Firefox, que es una aplicación gtk, utilice el cuadro de diálogo de selección de archivos de KDE, inícielo desde una terminal como esta:

```
GTK_USE_PORTAL=1 firefox
```

Ahora verás  

[![Firefox usando el cuadro de diálogo de selección de archivos de KDE](https://i.sstatic.net/U8uWW.png)](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://i.sstatic.net/U8uWW.png)

 

De manera similar, puede hacer que *gedit* y otras aplicaciones gtk utilicen el cuadro de diálogo de selección de archivos de KDE.  

Esto es lo que verás con `GTK_USE_PORTAL=1 gedit`:  

[![gedit usando el cuadro de diálogo de selección de archivos de KDE](https://i.sstatic.net/fjiiY.png)](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://i.sstatic.net/fjiiY.png)

------

Si está seguro de que desea utilizar consistentemente el cuadro de diálogo de selección de archivos de KDE, puede agregarlo `export GTK_USE_PORTAL=1`al final de *~/.profile* . Después de cerrar sesión y volver a iniciarla, todas las aplicaciones utilizarán el cuadro de diálogo de selección de archivos de KDE.

Tenga en cuenta que los dos paquetes siguientes deberían estar presentes en su sistema:

-. xdg-portal-de-escritorio-kde
-. portal-de-escritorio-xdg



## El problema

La mayoría de las aplicaciones basadas en GTK (como Firefox) abrirán el selector de archivos GTK ("Nautilus") de forma predeterminada, independientemente del entorno de escritorio actual.

## La solución (temporal)

Sin embargo, la mayoría de las aplicaciones GTK admiten el uso de portales de escritorio xdg. Como requisito previo, asegúrese de tener los paquetes instalados `xdg-desktop-portal`y `xdg-desktop-portal-kde`actualizados. Para comprobar si una aplicación GTK admite portales de escritorio, ejecútela desde la consola con la variable de entorno `GTK_USE_PORTAL=1`configurada. Por ejemplo, para iniciar Firefox y probar el selector de archivos, ejecútelo `GTK_USE_PORTAL=1 firefox`desde su línea de comando. **Si una aplicación todavía usa Nautilus incluso cuando se inicia de esta manera, usa una versión GTK que no admite la variable de entorno ni los portales de escritorio.** En este caso no puedes hacer nada más que esperar que el programa sea de código abierto y puedas arreglarlo tú mismo. Hay [otra alternativa](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://superuser.com/questions/944119/replace-gtk-file-dialog-with-alternative/1373504%231373504) , pero es muy complicada y no la recomendaría.

## Solución permanente

Para que todas las aplicaciones se inicien con la variable de entorno configurada, cree una variable de entorno de sesión de KDE (consulte [la wiki de KDE UserBase](https://translate.google.com/website?sl=en&tl=es&hl=es&client=webapp&u=https://userbase.kde.org/Session_Environment_Variables) como referencia):

1.) Asegúrese de haber instalado `xdg-desktop-portal`y`xdg-desktop-portal-kde`
2.) Asegúrate de que la ruta `$HOME/.config/plasma-workspace/env`exista

```shell
$ mkdir -p $HOME/.config/plasma-workspace/env
```

1.) Cree un nuevo `.sh`archivo en el directorio, con cualquier nombre y contenido. `export GTK_USE_PORTAL=1`KDE ejecutará cualquier `.sh`script que se encuentre en ese directorio al inicio y mantendrá las variables de entorno establecidas en ellos.

```shell
$ echo "export GTK_USE_PORTAL=1" >> $HOME/.config/plasma-workspace/env/gtk_use_portal.sh
```

1.) Reiniciar/Cerrar sesión y volver a iniciar sesión

**Tenga en cuenta que esto sólo funcionará mientras utilice una sesión de KDE.** Si está cambiando a una sesión de Gnome, la variable de entorno obviamente no será configurada por KDE y todas las aplicaciones volverán a su valor predeterminado.

### Por qué no `.profile`?

La mayoría de las soluciones que encontré en línea recomiendan configurar la variable de entorno permanente en el `.profile`archivo. Si bien esto funciona para aplicaciones Flatpak, no parece funcionar para aplicaciones nativas (a partir de hoy). Configurarlo como una variable de entorno de sesión de KDE también funciona para la mayoría de las aplicaciones nativas (si lo admiten).
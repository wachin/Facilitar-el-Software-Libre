# Cómo Cambiar El Administrador De Archivos Predeterminado De Linux

https://www.adamsdesk.com/posts/change-default-linux-file-manager/

- Adam Douglas

- Publicado el 9 de enero de 2023
- Revisado el 3 de junio de 2024

- https://www-adamsdesk-com.translate.goog/tag/linux/?_x_tr_sl=es&_x_tr_tl=en&_x_tr_hl=es&_x_tr_pto=wapp)

Es un hecho que no todos los usuarios de Linux quieren usar el mismo administrador de archivos y desean cambiar el administrador de archivos predeterminado. Sin embargo, otros usuarios pueden estar contentos con su administrador de archivos, pero experimentan el problema de que los directorios no se abren en el administrador de archivos deseado. En cualquier caso, estas situaciones pueden remediarse fácilmente. Primero comencemos explicando algunas cosas, antes de cambiar el administrador predeterminado.

## Asociación De Archivos

Una aplicación se asocia a archivos o contenido mediante lo que se llama tipo MIME o también conocido como tipo de medio. Cuando se instala una aplicación, los tipos MIME se configuran automáticamente y se actualizan cuando se aplica una actualización de software. Piense en ello como un mapa que le da al sistema instrucciones sobre qué programa abre un archivo en particular. En el caso del administrador de archivos, el tipo MIME se llama “inodo/directorio”. Cualquier aplicación configurada como predeterminada que esté asociada a este tipo MIME y se abrirá como administrador de archivos incluso si la aplicación en sí no es realmente un administrador de archivos. Las aplicaciones que se sabe que están configuradas como administrador de archivos pueden ser [Audacious](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://audacious-media-player.org/) , [VSCodium](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://github.com/VSCodium/vscodium) , [Kitty](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://sw.kovidgoyal.net/kitty/) , etc.

## ¿Qué Es Un Archivo De Entrada De Escritorio?

Una forma de integrar una aplicación en los menús de un entorno de escritorio Linux que sigue la especificación estándar del menú de escritorio XDG. Piense en estos archivos como un acceso directo que proporciona toda la información necesaria para funcionar sin problemas.

## Encuentre El Administrador De Archivos Predeterminado

Para determinar el administrador de archivos predeterminado, ejecute el siguiente comando.

```
$ xdg-mime query default inode/directory
codium.desktop
```

## Cambiar El Administrador De Archivos Predeterminado

Para cambiar el administrador predeterminado, debe saber cómo se llama el nombre del archivo de entrada del escritorio. Los archivos de entrada de escritorio generalmente se almacenan en un par de ubicaciones en un sistema Linux, “~/.local/share/applications/” para aplicaciones específicas del usuario y “/usr/share/applications/” o “/usr/local/share /aplicaciones/” para aplicaciones instaladas en todo el sistema. Intente localizar el nombre de la aplicación explorando cada uno de los directorios enumerados o buscando usando el `find`comando.

A continuación se muestra un ejemplo de una búsqueda de archivos GNOME (nautilus) dentro del directorio “/usr/share/applications/”.

```
$ find /usr/share/applications/ -iname "*nautilus*"
/usr/share/applications/nautilus-autorun-software.desktop
/usr/share/applications/org.gnome.Nautilus.desktop
```

El siguiente ejemplo de comando establecerá Archivos GNOME (nautilus) como el administrador de archivos predeterminado.

```
$ xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

Para verificar si el cambio funcionó, puede ejecutar el siguiente comando.

```
$ xdg-mime query default inode/directory
org.gnome.Nautilus.desktop
```

## Más Ejemplos

A continuación se muestran algunos ejemplos más de otros administradores de archivos y cómo cambiarlos para que sean los predeterminados.

- Delfín

  ```
    $ xdg-mime default org.kde.dolphin.desktop inode/directory
  ```

- Doble comandante

  ```
    $ xdg-mime default doublecmd.desktop inode/directory
  ```

- Comandante gnomo

  ```
    $ xdg-mime default org.gnome.gnome-commander.desktop inode/directory
  ```

- Krusader

  ```
    $ xdg-mime default org.kde.krusader.desktop inode/directory
  ```

- nnn

  ```
    $ xdg-mime default nnn.desktop inode/directory
  ```

- Thunar

  ```
    $ xdg-mime default thunar.desktop inode/directory
  ```

Esta es la publicación 83 de 100 y es la ronda 2 del desafío [100 días para descargar](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://100daystooffload.com) .
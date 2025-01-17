# How To Change The Default Linux File Manager

https://www.adamsdesk.com/posts/change-default-linux-file-manager/

- Adam Douglas

- Published Jan 9, 2023
- Revised Jun 3, 2024

https://www-adamsdesk-com.translate.goog/tag/linux/?_x_tr_sl=es&_x_tr_tl=en&_x_tr_hl=es&_x_tr_pto=wapp)

It is a given that not all Linux users want to use the same file manager, and wish to change the default file manager. Other users however may be content with their file manager, but are experiencing the issue of directories not opening in the desired file manager. In either case, these situations can be easily remedied. First let's begin explaining a few things, before we change the default manager.

## File Association

An application is associated with files or content by using what is called MIME type or also known as a media type. When an application is installed MIME types are set automatically, and updated when a software update is applied. Think of it like map that gives the system directions on what program opens a particular file. In the case of file manager the MIME type is called “inode/directory”. Any application set as default that is associated with this MIME type, and will be opened as the file manager even if the application itself is not actually a file manager. Such applications that are known to be set as the file manager can be [Audacious](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://audacious-media-player.org/) , [VSCodium](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://github.com/VSCodium/vscodium) , [Kitty](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://sw.kovidgoyal.net/kitty/) , etc.

## What Is A Desktop Entry File?

A way to integrate an application into menus of a Linux desktop environment that follows the standard XDG Desktop Menu specification. Think of these files like a shortcut providing all the information needed to work seamlessly.

## Find The Default File Manager

To determine the default file manager run the following command.

```
$ xdg-mime query default inode/directory
codium.desktop
```

## Change The Default File Manager

In order to change the default manager you have to know what the desktop entry file name is called. Desktop entry files are typically stored at a couple location on a Linux system, “~/.local/share/applications/” for user-specific applications, and “/usr/share/applications/” or “/usr/local/share /applications/” for applications installed system-wide. Try locating the application name by browsing each of those directories listed or searching by using the `find`command.

Here is an example of a search for GNOME Files (nautilus) within the directory “/usr/share/applications/”.

```
$ find /usr/share/applications/ -iname "*nautilus*"
/usr/share/applications/nautilus-autorun-software.desktop
/usr/share/applications/org.gnome.Nautilus.desktop
```

The below command example will set GNOME Files (nautilus) as the default file manager.

```
$ xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

To verify if the change worked, you can run the following command.

```
$ xdg-mime query default inode/directory
org.gnome.Nautilus.desktop
```

## More Examples

Here are some more examples of other file managers, and how to change them to be the default.

- Dolphin

  ```
    $ xdg-mime default org.kde.dolphin.desktop inode/directory
  ```

- Double Commander

  ```
    $ xdg-mime default doublecmd.desktop inode/directory
  ```

- Gnome Commander

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

This is post 83 of 100, and is round 2 of the [100 Days To Offload](https://translate.google.com/website?sl=es&tl=en&hl=es&client=webapp&u=https://100daystooffload.com) challenge.
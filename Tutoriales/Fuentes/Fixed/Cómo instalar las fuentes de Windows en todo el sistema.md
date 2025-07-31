




## Instalación de fuentes tipográficas de Windows para todo el sistema en Linux

En la mayoría de los casos, copiar las fuentes de Windows a la carpeta personal (`~/.fonts`) es suficiente, pero si el equipo tiene **varios usuarios** y todos necesitan las fuentes, hay que instalarlas **para todo el sistema**.

### ¿Dónde van las fuentes del sistema?
Las fuentes del sistema en Linux se guardan en:

/usr/share/fonts/truetype/

Allí podemos crear una carpeta nueva, por ejemplo:

/usr/share/fonts/truetype/windows

y dentro de ella pegar todas las fuentes de Windows.

## ¿Cómo copiar las fuentes sin usar la terminal?
Para mover archivos a esa carpeta necesitamos permisos de administrador. Hay varias formas de hacerlo gráficamente:

### 1. Usando **Krusader**
1.) Instalar Krusader (si no lo tiene):

```bash
sudo apt install krusader
```

2.) Ejecutar Krusader como superusuario:

```bash
sudo krusader
```

3.) Navegar a la carpeta donde tienes las fuentes de Windows y copialas
4.) Abre una pestaña con "Ctrl + T" e ir a `/usr/share/fonts/truetype/`, crear la carpeta `windows` y pegar allí las fuentes. También si deseas puedes hacerlo usando el otro panel en vez de crear una pestaña

### 2. Usando **Double Commander (GTK o QT)**

1.) Instalar Double Commander:

```bash
sudo apt install doublecmd-gtk
```

 o si tengas un sistema operativo KDE Plasma o LXQT:

```bash
sudo apt install doublecmd-qt
```

2.) Ejecutar Double Commander con permisos de superusuario:

```bash
sudo doublecmd-gtk
```

 o:

```bash
sudo doublecmd-qt
```

3.) Copiar las fuentes a `/usr/share/fonts/truetype/windows`.

## Consejos para usar el administrador de archivos como superusuario
- **Tenga mucho cuidado** de no borrar ni mover carpetas o archivos del sistema operativo. Si elimina o mueve algo crítico, el sistema puede dejar de funcionar y podría ser necesario reinstalarlo.  
- **No abra sus archivos personales (imágenes, documentos, etc.)** desde el administrador de archivos ejecutado como superusuario.  
  Esto se debe a que el programa que abre esos archivos puede heredar permisos de superusuario y cambiar la propiedad de los mismos, provocando que luego no pueda acceder a ellos desde su usuario normal.  
- **Cierre el administrador de archivos cuando termine de usarlo como superusuario.**  
  Dejarlo abierto puede ser peligroso porque, al volver más tarde y olvidar que sigue con permisos de administrador, podría borrar o mover algo importante sin darse cuenta.


## Actualizar el caché de fuentes (opcional)

Después de copiar las fuentes, si deseas puedes poner:

```bash
sudo fc-cache -fv
```
